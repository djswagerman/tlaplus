---- MODULE MC ----
EXTENDS black_channel_with_resend, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_164814718896380000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_164814718896381000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_164814718896382000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164814718896383000 ==
Len(acknowledgedMessages) <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:39:48 CET 2022 by dirk-janswagerman
