---- MODULE MC ----
EXTENDS 8_insert_is_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_165278917390337000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_165278917390438000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_165278917390439000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_165278917390440000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_165278917390441000 == 
0
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_165278917390442000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_165278917390443000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_165278917390444000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:06:13 CEST 2022 by dirk-janswagerman
