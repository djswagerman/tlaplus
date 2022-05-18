---- MODULE MC ----
EXTENDS 10_select_product, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_165280921127429000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_165280921127430000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_165280921127431000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_165280921127432000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_165280921127433000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_165280921127434000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_165280921127435000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_165280921127436000 == 
{"v1"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_165280921127437000 ==
selected_product # "ocean_blue"
----
=============================================================================
\* Modification History
\* Created Tue May 17 19:40:11 CEST 2022 by dirk-janswagerman
