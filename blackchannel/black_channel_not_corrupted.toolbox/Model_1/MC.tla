---- MODULE MC ----
EXTENDS black_channel_not_corrupted, TLC

\* CONSTANT definitions @modelParameterConstants:0MaxMessagesInFlight
const_164814648577140000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:1Msg
const_164814648577141000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_164814648577142000 ==
createMessageCounter <= 8 /\ corruptionCounter <= 2
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:28:05 CET 2022 by dirk-janswagerman
