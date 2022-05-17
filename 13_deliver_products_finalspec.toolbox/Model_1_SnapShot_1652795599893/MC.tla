---- MODULE MC ----
EXTENDS 13_deliver_products_finalspec, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652795519486324000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652795519489325000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652795519489326000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652795519489327000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652795519489328000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652795519489329000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652795519489330000 == 
{25, 50, 100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652795519489331000 == 
{"v1"}
----

\* CONSTANT definitions @modelParameterConstants:8customer_cash
const_1652795519489332000 == 
1000
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652795519489333000 ==
\A p \in DOMAIN products : vending_machines ["v1"].assets.product[p] >= 0
----
=============================================================================
\* Modification History
\* Created Tue May 17 15:51:59 CEST 2022 by dirk-janswagerman
