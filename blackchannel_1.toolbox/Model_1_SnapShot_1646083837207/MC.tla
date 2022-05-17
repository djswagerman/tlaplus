---- MODULE MC ----
EXTENDS blackchannel_1, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164608383016953000 == 
{"a", "b"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164608383016954000 ==
sendCount - receiveCount >= 0
----
=============================================================================
\* Modification History
\* Created Mon Feb 28 22:30:30 CET 2022 by dirk-janswagerman
