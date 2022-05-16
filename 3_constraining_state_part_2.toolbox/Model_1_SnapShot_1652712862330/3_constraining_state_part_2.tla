-------------------- MODULE 3_constraining_state_part_2 --------------------

EXTENDS Naturals

VARIABLE
    x
    
Increment (v) ==
    v' = v + 1

Decrement (v) ==
    v' = v + 1

    
Init ==
    /\ x = 0

Next ==
   \/ Increment (x)
   \/ Decrement (x)

Spec ==
    Init /\ [][Next]_<<x>>

=============================================================================
\* Modification History
\* Last modified Mon May 16 16:54:06 CEST 2022 by dirk-janswagerman
\* Created Mon May 16 16:52:56 CEST 2022 by dirk-janswagerman
