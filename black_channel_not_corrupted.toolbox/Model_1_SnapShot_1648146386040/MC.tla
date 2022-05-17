---- MODULE MC ----
EXTENDS black_channel_not_corrupted, TLC

\* CONSTANT definitions @modelParameterConstants:0MaxMessagesInFlight
const_164814638297524000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:1Msg
const_164814638297525000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_164814638297526000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:26:22 CET 2022 by dirk-janswagerman
