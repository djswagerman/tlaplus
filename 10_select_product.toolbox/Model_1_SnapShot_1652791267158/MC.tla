---- MODULE MC ----
EXTENDS 10_select_product, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652791263123415000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652791263123416000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652791263123417000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652791263123418000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652791263123419000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652791263123420000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652791263123421000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652791263123422000 == 
{"v1"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652791263123423000 ==
selected_product # "ocean_blue"
----
=============================================================================
\* Modification History
\* Created Tue May 17 14:41:03 CEST 2022 by dirk-janswagerman
