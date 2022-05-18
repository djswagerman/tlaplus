---- MODULE MC ----
EXTENDS 9_returning_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652790650918305000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652790650918306000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652790650918307000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652790650918308000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652790650918309000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652790650918310000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652790650918311000 == 
{50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652790650918312000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:30:50 CEST 2022 by dirk-janswagerman
