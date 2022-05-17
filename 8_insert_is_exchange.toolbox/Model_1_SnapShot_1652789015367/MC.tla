---- MODULE MC ----
EXTENDS 8_insert_is_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_165278901203019000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_165278901203120000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_165278901203121000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_165278901203122000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_165278901203123000 == 
0
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_165278901203124000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_165278901203125000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_165278901203126000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:03:32 CEST 2022 by dirk-janswagerman
