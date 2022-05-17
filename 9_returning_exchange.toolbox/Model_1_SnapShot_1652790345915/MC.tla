---- MODULE MC ----
EXTENDS 9_returning_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652790342878207000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652790342878208000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652790342878209000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652790342878210000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652790342878211000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652790342878212000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652790342878213000 == 
{50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652790342878214000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:25:42 CEST 2022 by dirk-janswagerman
