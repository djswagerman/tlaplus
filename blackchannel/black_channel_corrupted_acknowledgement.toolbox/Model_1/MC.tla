---- MODULE MC ----
EXTENDS black_channel_corrupted_acknowledgement, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_1648149153190177000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_1648149153190178000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1648149153190179000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 2
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 20:12:33 CET 2022 by dirk-janswagerman
