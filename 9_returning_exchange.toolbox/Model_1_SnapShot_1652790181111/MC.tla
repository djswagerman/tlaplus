---- MODULE MC ----
EXTENDS 9_returning_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652790177641171000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652790177641172000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652790177641173000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652790177641174000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652790177641175000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652790177641176000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652790177641177000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652790177641178000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:22:57 CEST 2022 by dirk-janswagerman
