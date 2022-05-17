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
    /\ PrintT ("chars1 \\union chars2")
    /\ PrintT (chars1 \union chars2)
    
    /\ PrintT ("chars1 \\intersect chars2")
    /\ PrintT (chars1 \intersect chars2)

    \* The elements in chars1 not in chars 2
    /\ PrintT ("chars1 \\ chars2")
    /\ PrintT (chars1 \ chars2)

    /\ PrintT ("chars1 \\union numbers2")
    /\ PrintT (chars1 \union numbers2)

    \* cross product
    /\ PrintT ("chars1 \\X numbers2")
    /\ PrintT (chars1 \X numbers2)

    \* cross product
    /\ PrintT ("SUBSET numbers1")
    /\ PrintT (SUBSET (chars1 \X numbers2))

Spec ==
    Init /\ Next
    
=============================================================================
\* Modification History
\* Last modified Mon May 16 16:43:14 CEST 2022 by dirk-janswagerman
\* Created Mon May 16 16:25:24 CEST 2022 by dirk-janswagerman