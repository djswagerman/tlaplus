---- MODULE MC ----
EXTENDS black_channel_with_resend, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_1648147928561129000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_1648147928561130000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1648147928561131000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:52:08 CET 2022 by dirk-janswagerman
