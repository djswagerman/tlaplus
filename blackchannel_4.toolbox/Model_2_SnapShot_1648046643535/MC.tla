---- MODULE MC ----
EXTENDS blackchannel_4, TLC

\* CONSTANT definitions @modelParameterConstants:0MaxQueueLength
const_16480466297211016000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Msg
const_16480466297211017000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:3MaxMessagesInFlight
const_16480466297211018000 == 
2
----

\* PROPERTY definition @modelCorrectnessProperties:0
prop_16480466297221019000 ==
\A i \in 1..Len (acknowledgedMessages) : acknowledgedMessages[i].counter = sendMessage[i].counter
----
=============================================================================
\* Modification History
\* Created Wed Mar 23 15:43:49 CET 2022 by dirk-janswagerman
