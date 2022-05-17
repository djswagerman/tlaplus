---- MODULE MC ----
EXTENDS blackchannel_1, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164608387946457000 == 
{"a", "b"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164608387946458000 ==
sendCount - receiveCount < 4
----
=============================================================================
\* Modification History
\* Created Mon Feb 28 22:31:19 CET 2022 by dirk-janswagerman
