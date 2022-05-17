---- MODULE MC ----
EXTENDS blackchannel_1, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164608310914840000 == 
{"a", "b"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164608310914841000 ==
sendCount < 10
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_164608310914842000 ==
\A x \in messageChannel : \A y \in x : Len (y) = 1
----
=============================================================================
\* Modification History
\* Created Mon Feb 28 22:18:29 CET 2022 by dirk-janswagerman
