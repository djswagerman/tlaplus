---- MODULE MC ----
EXTENDS black_channel_with_resend, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_164814723963784000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_164814723963785000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_164814723963786000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164814723963787000 ==
Len(acknowledgedMessages) <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:40:39 CET 2022 by dirk-janswagerman
