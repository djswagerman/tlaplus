---- MODULE MC ----
EXTENDS 9_returning_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652790296190189000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652790296192190000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652790296192191000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652790296192192000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652790296192193000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652790296192194000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652790296192195000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652790296192196000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:24:56 CEST 2022 by dirk-janswagerman
