----------------------------- MODULE transport -----------------------------

EXTENDS FiniteSets, Sequences, Naturals, TLC, Integers

VARIABLE
    system,
    environment

vars == <<system, environment>>


BoardOnRunin ==
        \* If there are unprocessed boards in the head of the queue
        /\ environment.boards # <<>> /\ Head(environment.boards).state = "unprocessed"

        \* and the runIn area is empty...
        /\ system.runIn = <<>>

        \* Remove the head of the queue of the unprocessed boards
        /\ environment'= [environment EXCEPT !.boards = Tail (environment.boards)]

        \* and move the board to the runIn area, changing its state to 'waiting'
        /\ system'= [       system
                                EXCEPT !.runIn = Append (system.runIn, [Head(environment.boards) EXCEPT !.state = "waiting"])
                    ]
 
ProcessBoard ==
        \* If there are boards waiting on the runIn
        /\ system.runIn # <<>>  /\ Head(system.runIn).state = "waiting"

        \* and the work area is empty
        /\ system.workarea = <<>>       

        /\ system'= [[       system

        \* move the board from the runIn area to the workarea and change its state to 'in process'
                                EXCEPT !.workarea = Append (system.workarea, [Head(system.runIn) EXCEPT !.state = "in process"])]
                                EXCEPT !.runIn = Tail (system.runIn)
                    ]                                
        /\ UNCHANGED <<environment>>

BoardToRunOut ==
        \* If there are boards in process in the work area
        /\ system.workarea # <<>> /\ Head(system.workarea).state = "in process"

        \* and the runOut is clear
        /\ system.runOut = <<>>
        
        \* move the board from the workarea to the runOut area
        /\ system'= [[       system
                                EXCEPT !.runOut = Append (system.runOut, [Head(system.workarea) EXCEPT !.state = "processed"])]
                                EXCEPT !.workarea = Tail (system.workarea)
                    ]                                
    /\ UNCHANGED <<environment>>


BoardFinished ==
        \* If there is a board on the runOut
        /\ system.runOut # <<>>

        \* move the board from the runOut ...
        /\ system'= [        system
                                EXCEPT !.runOut = Tail (system.runOut)]

        \* back to the environment
        /\ environment'= [environment EXCEPT !.boards = Append (environment.boards, Head(system.runOut)) ]

AllBoardsProcessed == 
    \* if there are no boards in the system
    /\ system.runIn = <<>>
    /\ system.workarea = <<>>
    /\ system.runOut = <<>>

    \* and all boards are returned back as 'processed'
    /\ \A i \in 1..Len(environment.boards) : environment.boards[i].state = "processed"

    \* the program terminates
    /\ UNCHANGED <<vars>>


Init ==
    /\ system = [
                    runIn |-> <<>>,
                    workarea |-> <<>>,
                    runOut |-> <<>>
                ]
    /\ environment =    [
                            boards |->  <<
                                            [   name |-> "board1",
                                                state |-> "unprocessed"
                                            ],
                                            [   name |-> "board2",
                                                state |-> "unprocessed"
                                            ],
                                            [   name |-> "board3",
                                                state |-> "unprocessed"
                                            ],
                                            [   name |-> "board4",
                                                state |-> "unprocessed"
                                            ]
                                        >>
                        ]

Next == 
    \/ BoardOnRunin
    \/ ProcessBoard
    \/ BoardToRunOut
    \/ BoardFinished
    \/ AllBoardsProcessed

Spec == Init /\ [][Next]_<<vars>>


=============================================================================
\* Modification History
\* Last modified Fri May 20 16:43:42 CEST 2022 by dirk-janswagerman
\* Created Tue May 17 21:51:46 CEST 2022 by dirk-janswagerman
