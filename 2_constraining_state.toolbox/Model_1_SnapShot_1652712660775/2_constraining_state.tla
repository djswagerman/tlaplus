------------------------ MODULE 2_constraining_state ------------------------
EXTENDS Naturals

VARIABLE
    x
    
    
Init ==
    /\ x = 0

Next ==
    /\ x' = x + 1

Spec ==
    Init /\ Next

=============================================================================
\* Modification History
\* Last modified Mon May 16 16:50:43 CEST 2022 by dirk-janswagerman
\* Created Mon May 16 16:49:49 CEST 2022 by dirk-janswagerman
