---- MODULE MC ----
EXTENDS 13_deliver_products_finalspec, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652796039918373000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652796039918374000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652796039918375000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652796039918376000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652796039918377000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652796039918378000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652796039918379000 == 
{25, 50, 100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652796039918380000 == 
{"v1"}
----

\* CONSTANT definitions @modelParameterConstants:8customer_cash
const_1652796039918381000 == 
1000
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652796039918382000 ==
\A p \in DOMAIN products : vending_machines ["v1"].assets.product[p] >= 0
----
=============================================================================
\* Modification History
\* Created Tue May 17 16:00:39 CEST 2022 by dirk-janswagerman
