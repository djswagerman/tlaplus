---- MODULE MC ----
EXTENDS blackchannel_1, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164608296371323000 == 
{"a", "b"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164608296371324000 ==
sendCount < 10
----
=============================================================================
\* Modification History
\* Created Mon Feb 28 22:16:03 CET 2022 by dirk-janswagerman
