---- MODULE MC ----
EXTENDS blackchannel_4, TLC

\* CONSTANT definitions @modelParameterConstants:0MaxQueueLength
const_16480465998061007000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Msg
const_16480465998061008000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:3MaxMessagesInFlight
const_16480465998061009000 == 
2
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_16480465998061010000 ==
Len (messageChannel) <= 2
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_16480465998061011000 ==
\A i \in 1..Len (acknowledgedMessages) : acknowledgedMessages[i].counter = sendMessage[i].counter
----
=============================================================================
\* Modification History
\* Created Wed Mar 23 15:43:19 CET 2022 by dirk-janswagerman
