----------------------- MODULE 4_simple_state_machine -----------------------
EXTENDS FiniteSets, TLC

VARIABLE
    state
    
    
Open ==
    /\ state = "closed"
    /\ state' = "open"

Close ==
    /\ state = "open"
    /\ state' = "close"

Init ==
    /\ state = "open"    

Next ==
    \/ Open
    \/ Close
    
Spec ==
    Init /\ [][Next]_<<state>>

=============================================================================
\* Modification History
\* Last modified Mon May 16 21:01:30 CEST 2022 by dirk-janswagerman
\* Created Mon May 16 20:58:09 CEST 2022 by dirk-janswagerman
