------------------ MODULE 5_vending_machine_datastructure ------------------
EXTENDS Naturals, TLC


VARIABLE
    products

Init ==
            /\ products = [saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]

Next ==
            /\ PrintT (products)
                                        
=============================================================================
\* Modification History
\* Last modified Tue May 17 08:11:55 CEST 2022 by dirk-janswagerman
\* Created Tue May 17 07:57:40 CEST 2022 by dirk-janswagerman
