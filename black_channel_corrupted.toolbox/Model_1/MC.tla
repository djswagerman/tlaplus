---- MODULE MC ----
EXTENDS black_channel_corrupted, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_164814689765954000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_164814689766055000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_164814689766056000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:34:57 CET 2022 by dirk-janswagerman
