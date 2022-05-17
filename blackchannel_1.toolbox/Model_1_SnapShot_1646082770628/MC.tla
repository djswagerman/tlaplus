---- MODULE MC ----
EXTENDS blackchannel_1, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164608276757717000 == 
{"a", "b"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164608276757818000 ==
Len (message) < 2
----
=============================================================================
\* Modification History
\* Created Mon Feb 28 22:12:47 CET 2022 by dirk-janswagerman
