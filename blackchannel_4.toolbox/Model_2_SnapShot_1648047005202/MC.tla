---- MODULE MC ----
EXTENDS blackchannel_4, TLC

\* CONSTANT definitions @modelParameterConstants:0MaxQueueLength
const_16480470021721040000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Msg
const_16480470021721041000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:2MaxMessagesInFlight
const_16480470021721042000 == 
2
----

\* PROPERTY definition @modelCorrectnessProperties:0
prop_16480470021731043000 ==
\A i \in 1..Len (acknowledgedMessages) : acknowledgedMessages[i].counter = sendMessage[i].counter
----
=============================================================================
\* Modification History
\* Created Wed Mar 23 15:50:02 CET 2022 by dirk-janswagerman
