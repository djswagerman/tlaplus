---- MODULE MC ----
EXTENDS black_channel_with_resend, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_164814757047292000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_164814757047293000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_164814757047294000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:46:10 CET 2022 by dirk-janswagerman
