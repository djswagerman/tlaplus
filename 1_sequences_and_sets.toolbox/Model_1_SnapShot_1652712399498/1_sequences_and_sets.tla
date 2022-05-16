------------------------ MODULE 1_sequences_and_sets ------------------------
EXTENDS FiniteSets, Sequences, TLC

VARIABLES
    chars1,
    chars2,
    numbers1,
    numbers2
    
Init ==
    /\ chars1 = {"a", "b", "c"}
    /\ chars2 = {"c", "d", "f"}
    /\ numbers1 = {1,2}
    /\ numbers2 = {3,4}

Next ==


    \* cross product
    /\ PrintT ("SUBSET numbers1")
    /\ PrintT (SUBSET numbers1)

Spec ==
    Init /\ Next
    
=============================================================================
\* Modification History
\* Last modified Mon May 16 16:46:33 CEST 2022 by dirk-janswagerman
\* Created Mon May 16 16:25:24 CEST 2022 by dirk-janswagerman
