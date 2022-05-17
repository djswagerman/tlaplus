---- MODULE MC ----
EXTENDS 9_returning_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652790380641216000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652790380641217000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652790380641218000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652790380641219000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652790380641220000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652790380641221000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652790380641222000 == 
{50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652790380641223000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:26:20 CEST 2022 by dirk-janswagerman
