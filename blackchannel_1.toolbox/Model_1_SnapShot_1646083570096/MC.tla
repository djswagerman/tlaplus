---- MODULE MC ----
EXTENDS blackchannel_1, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164608356705349000 == 
{"a", "b"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164608356705350000 ==
sendCount = 8 /\ receiveCount < 3
----
=============================================================================
\* Modification History
\* Created Mon Feb 28 22:26:07 CET 2022 by dirk-janswagerman
