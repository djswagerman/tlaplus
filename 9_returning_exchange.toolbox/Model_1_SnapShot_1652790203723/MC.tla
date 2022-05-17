---- MODULE MC ----
EXTENDS 9_returning_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652790199679180000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652790199679181000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652790199679182000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652790199679183000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652790199679184000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652790199679185000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652790199679186000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652790199679187000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:23:19 CEST 2022 by dirk-janswagerman
