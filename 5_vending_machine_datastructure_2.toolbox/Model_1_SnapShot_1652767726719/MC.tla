---- MODULE MC ----
EXTENDS 5_vending_machine_datastructure_2, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652767723666119000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652767723666120000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652767723666121000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652767723666122000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652767723666123000 == 
0
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652767723666124000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652767723666125000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652767723666126000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 08:08:43 CEST 2022 by dirk-janswagerman
