---- MODULE MC ----
EXTENDS 10_select_product, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_165279290357512000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_165279290357513000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_165279290357514000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_165279290357515000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_165279290357516000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_165279290357517000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_165279290357618000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_165279290357619000 == 
{"v1"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_165279290357620000 ==
selected_product # "ocean_blue"
----
=============================================================================
\* Modification History
\* Created Tue May 17 15:08:23 CEST 2022 by dirk-janswagerman
