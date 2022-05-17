---- MODULE MC ----
EXTENDS blackchannel_1, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164608351977745000 == 
{"a", "b"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164608351977746000 ==
sendCount < 10 /\ receiveCount < 3
----
=============================================================================
\* Modification History
\* Created Mon Feb 28 22:25:19 CET 2022 by dirk-janswagerman
