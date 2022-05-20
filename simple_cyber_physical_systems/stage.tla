------------------------------- MODULE stage -------------------------------

EXTENDS FiniteSets, Sequences, Naturals, TLC, Integers

CONSTANTS max_stage, axes, board_names

VARIABLE
    system,
    environment

vars == <<system, environment>>

StartMove (axis, position) ==
    /\ system.stage.state = "idle"
    /\ system' =    [   [system EXCEPT !.stage["target_" \o axis] = position]
                                EXCEPT !.stage.state = "moving"

                    ]
    /\ UNCHANGED <<environment>>

MoveCompleted (axis, position) ==
    /\ system.stage.state = "moving"
    /\ system' =    [[[    system 
                                EXCEPT !.stage[axis] = system.stage["target_" \o axis]]
                                EXCEPT !.stage["target_" \o axis] = -1]
                                EXCEPT !.stage.state = "idle"
                    ]
    /\ UNCHANGED <<environment>>



MoveStage ==
    \/ \E axis \in axes, position \in 0..max_stage : position # system.stage[axis] /\ StartMove (axis, position)
    \/ \E axis \in axes, position \in 0..max_stage : MoveCompleted (axis, position)

BoardOnRunin ==
        /\ environment.boards # <<>>
        /\ Head(environment.boards).state = "unprocessed"
        /\ system.runIn = <<>>
        /\ environment'= [environment EXCEPT !.boards = Tail (environment.boards)]
        /\ system'= [       system
                                EXCEPT !.runIn = [Head(environment.boards) EXCEPT !.state = "in process"]]
 
BoardToRunOut ==
        /\ system.runIn # <<>>
        /\ system.runOut = <<>>
        /\ system'= [[       system
                                EXCEPT !.runOut = [system.runIn EXCEPT !.state = "processed"]]
                                EXCEPT !.runIn = <<>>
                    ]                                
    /\ UNCHANGED <<environment>>

BoardToProcessed ==
        /\ system.runOut # <<>>
        /\ system'= [        system
                                EXCEPT !.runOut = <<>>]
        /\ environment'= [environment EXCEPT !.boards = Append (environment.boards, system.runOut) ]

Init ==
    /\ system = [
                    stage |->
                        [   state |-> "idle",
                            target_x |-> -1,
                            target_y |-> -1,
                            x |-> 0,
                            y |-> 0
                        ],
                    runIn |-> <<>>,
                    runOut |-> <<>>
                ]
    /\ environment =    [
                            boards |->  <<
                                            [   name |-> "b1",
                                                state |-> "unprocessed"
                                            ],
                                            [   name |-> "b2",
                                                state |-> "unprocessed"
                                            ],
                                            [   name |-> "b3",
                                                state |-> "unprocessed"
                                            ]
                                        >>
                        ]

Finished == 
    /\ UNCHANGED <<vars>>

Next == 
    \/ BoardOnRunin
    \/ BoardToRunOut
    \/ BoardToProcessed
    \/ Finished

Spec == Init /\ [][Next]_<<vars>>


TargetPositionIsDifferentFromCurrentPosition == system.stage.state = "Moving" => \E axis \in axes :  system.stage[axis] # system.stage["target_" \o axis]

=============================================================================
\* Modification History
\* Last modified Fri May 20 12:45:14 CEST 2022 by dirk-janswagerman
\* Created Tue May 17 21:51:46 CEST 2022 by dirk-janswagerman
