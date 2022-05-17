--------------------------- MODULE blackchannel_4 ---------------------------
EXTENDS Integers, Naturals, Sequences, TLC, FiniteSets
CONSTANTS Msg, MaxQueueLength, MaxMessagesInFlight

Remove(i, seq) ==   [j \in 1..(Len(seq)-1) |-> 
                        IF j < i THEN
                            seq[j]
                        ELSE
                            seq[j+1]]

RandomIndex (seq) == CHOOSE x \in 1..Len(seq) : x < Len(seq)


(* --algorithm blackchannel_4


variables
    sendQueue = <<>>;
    messageChannel = <<>>;
    acknowledgeChannel = <<>>;
    sendCount = 0;
    receiveCount = 0;
    corruptionCounter = 0;
    createMessageCounter = 0;
    currentMessageCounter = 1;

    sendMessages = <<>>;
    acknowledgedMessages = <<>>;
    message = [content |-> <<>>, counter |-> 0, checksum |-> 0];

define
    EachSendMessageWillEventuallyBeReceived == (<>(\A msg \in {sendMessages[i] : i \in DOMAIN sendMessages }: msg \in {acknowledgedMessages[j] : j \in DOMAIN acknowledgedMessages}))
    
end define;

macro Send (channel, msg)
begin
    channel := Append (channel, msg);
end macro;

macro Receive (msg, channel)
begin
    await Len(channel) > 0;
    msg := Head (channel);
    channel := Tail (channel);
end macro;



fair process Sender  \in {"S"}
variables
   acknowledgedMessage = <<>>;
   sendMessage = <<>>;
begin
startSender:
    while TRUE do
        either
            CreateMessage:
                await createMessageCounter < currentMessageCounter;
                createMessageCounter := createMessageCounter + 1;
                with m \in Msg do
                    message.content := m || message.counter := createMessageCounter;
                    sendMessages := Append (sendMessages, message);
                end with;
        or 
            SendMessage:
                await (createMessageCounter > 0) /\ (currentMessageCounter <= Len (sendMessages)) /\ Len(messageChannel) < MaxMessagesInFlight;
                Send (messageChannel, sendMessages[currentMessageCounter]);
        or 
            AcknowledgeMessage:
                Receive (acknowledgedMessage, acknowledgeChannel);
                if (acknowledgedMessage.counter = currentMessageCounter) then
                    currentMessageCounter := currentMessageCounter + 1;
                    acknowledgedMessages := Append (acknowledgedMessages, acknowledgedMessage);
                end if
        end either;
    end while;
end process;

fair process Receiver \in {"R"}
variable
    receivedMessage = <<>>;
begin
startReceiver:
    while TRUE do
        ReceiveMessage:
            Receive (receivedMessage, messageChannel);
            acknowledgeChannel := Append (acknowledgeChannel, receivedMessage);
    end while;
end process;


process MessageCorrupter \in {"MC"}
variables
    randomNumber;
begin
startMessageCorrupter:
    while corruptionCounter < 2 do
        either
            RemoveMessage:
                await Len (messageChannel) > 0;
                messageChannel := Remove (RandomIndex(messageChannel), messageChannel);
                corruptionCounter := corruptionCounter + 1;
        or
            RemoveAcknowledgement:
                await Len (messageChannel) > 0;
                acknowledgeChannel := Remove (RandomIndex(acknowledgeChannel), acknowledgeChannel);
                corruptionCounter := corruptionCounter + 1;
        end either
    end while;
end process;



end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "83681575" /\ chksum(tla) = "4d356157")
CONSTANT defaultInitValue
VARIABLES sendQueue, messageChannel, acknowledgeChannel, sendCount, 
          receiveCount, corruptionCounter, createMessageCounter, 
          currentMessageCounter, sendMessages, acknowledgedMessages, message, 
          pc

(* define statement *)
EachSendMessageWillEventuallyBeReceived == (<>(\A msg \in {sendMessages[i] : i \in DOMAIN sendMessages }: msg \in {acknowledgedMessages[j] : j \in DOMAIN acknowledgedMessages}))

VARIABLES acknowledgedMessage, sendMessage, receivedMessage, randomNumber

vars == << sendQueue, messageChannel, acknowledgeChannel, sendCount, 
           receiveCount, corruptionCounter, createMessageCounter, 
           currentMessageCounter, sendMessages, acknowledgedMessages, message, 
           pc, acknowledgedMessage, sendMessage, receivedMessage, 
           randomNumber >>

ProcSet == ({"S"}) \cup ({"R"}) \cup ({"MC"})

Init == (* Global variables *)
        /\ sendQueue = <<>>
        /\ messageChannel = <<>>
        /\ acknowledgeChannel = <<>>
        /\ sendCount = 0
        /\ receiveCount = 0
        /\ corruptionCounter = 0
        /\ createMessageCounter = 0
        /\ currentMessageCounter = 1
        /\ sendMessages = <<>>
        /\ acknowledgedMessages = <<>>
        /\ message = [content |-> <<>>, counter |-> 0, checksum |-> 0]
        (* Process Sender *)
        /\ acknowledgedMessage = [self \in {"S"} |-> <<>>]
        /\ sendMessage = [self \in {"S"} |-> <<>>]
        (* Process Receiver *)
        /\ receivedMessage = [self \in {"R"} |-> <<>>]
        (* Process MessageCorrupter *)
        /\ randomNumber = [self \in {"MC"} |-> defaultInitValue]
        /\ pc = [self \in ProcSet |-> CASE self \in {"S"} -> "startSender"
                                        [] self \in {"R"} -> "startReceiver"
                                        [] self \in {"MC"} -> "startMessageCorrupter"]

startSender(self) == /\ pc[self] = "startSender"
                     /\ \/ /\ pc' = [pc EXCEPT ![self] = "CreateMessage"]
                        \/ /\ pc' = [pc EXCEPT ![self] = "SendMessage"]
                        \/ /\ pc' = [pc EXCEPT ![self] = "AcknowledgeMessage"]
                     /\ UNCHANGED << sendQueue, messageChannel, 
                                     acknowledgeChannel, sendCount, 
                                     receiveCount, corruptionCounter, 
                                     createMessageCounter, 
                                     currentMessageCounter, sendMessages, 
                                     acknowledgedMessages, message, 
                                     acknowledgedMessage, sendMessage, 
                                     receivedMessage, randomNumber >>

CreateMessage(self) == /\ pc[self] = "CreateMessage"
                       /\ createMessageCounter < currentMessageCounter
                       /\ createMessageCounter' = createMessageCounter + 1
                       /\ \E m \in Msg:
                            /\ message' = [message EXCEPT !.content = m,
                                                          !.counter = createMessageCounter']
                            /\ sendMessages' = Append (sendMessages, message')
                       /\ pc' = [pc EXCEPT ![self] = "startSender"]
                       /\ UNCHANGED << sendQueue, messageChannel, 
                                       acknowledgeChannel, sendCount, 
                                       receiveCount, corruptionCounter, 
                                       currentMessageCounter, 
                                       acknowledgedMessages, 
                                       acknowledgedMessage, sendMessage, 
                                       receivedMessage, randomNumber >>

SendMessage(self) == /\ pc[self] = "SendMessage"
                     /\ (createMessageCounter > 0) /\ (currentMessageCounter <= Len (sendMessages)) /\ Len(messageChannel) < MaxMessagesInFlight
                     /\ messageChannel' = Append (messageChannel, (sendMessages[currentMessageCounter]))
                     /\ pc' = [pc EXCEPT ![self] = "startSender"]
                     /\ UNCHANGED << sendQueue, acknowledgeChannel, sendCount, 
                                     receiveCount, corruptionCounter, 
                                     createMessageCounter, 
                                     currentMessageCounter, sendMessages, 
                                     acknowledgedMessages, message, 
                                     acknowledgedMessage, sendMessage, 
                                     receivedMessage, randomNumber >>

AcknowledgeMessage(self) == /\ pc[self] = "AcknowledgeMessage"
                            /\ Len(acknowledgeChannel) > 0
                            /\ acknowledgedMessage' = [acknowledgedMessage EXCEPT ![self] = Head (acknowledgeChannel)]
                            /\ acknowledgeChannel' = Tail (acknowledgeChannel)
                            /\ IF (acknowledgedMessage'[self].counter = currentMessageCounter)
                                  THEN /\ currentMessageCounter' = currentMessageCounter + 1
                                       /\ acknowledgedMessages' = Append (acknowledgedMessages, acknowledgedMessage'[self])
                                  ELSE /\ TRUE
                                       /\ UNCHANGED << currentMessageCounter, 
                                                       acknowledgedMessages >>
                            /\ pc' = [pc EXCEPT ![self] = "startSender"]
                            /\ UNCHANGED << sendQueue, messageChannel, 
                                            sendCount, receiveCount, 
                                            corruptionCounter, 
                                            createMessageCounter, sendMessages, 
                                            message, sendMessage, 
                                            receivedMessage, randomNumber >>

Sender(self) == startSender(self) \/ CreateMessage(self)
                   \/ SendMessage(self) \/ AcknowledgeMessage(self)

startReceiver(self) == /\ pc[self] = "startReceiver"
                       /\ pc' = [pc EXCEPT ![self] = "ReceiveMessage"]
                       /\ UNCHANGED << sendQueue, messageChannel, 
                                       acknowledgeChannel, sendCount, 
                                       receiveCount, corruptionCounter, 
                                       createMessageCounter, 
                                       currentMessageCounter, sendMessages, 
                                       acknowledgedMessages, message, 
                                       acknowledgedMessage, sendMessage, 
                                       receivedMessage, randomNumber >>

ReceiveMessage(self) == /\ pc[self] = "ReceiveMessage"
                        /\ Len(messageChannel) > 0
                        /\ receivedMessage' = [receivedMessage EXCEPT ![self] = Head (messageChannel)]
                        /\ messageChannel' = Tail (messageChannel)
                        /\ acknowledgeChannel' = Append (acknowledgeChannel, receivedMessage'[self])
                        /\ pc' = [pc EXCEPT ![self] = "startReceiver"]
                        /\ UNCHANGED << sendQueue, sendCount, receiveCount, 
                                        corruptionCounter, 
                                        createMessageCounter, 
                                        currentMessageCounter, sendMessages, 
                                        acknowledgedMessages, message, 
                                        acknowledgedMessage, sendMessage, 
                                        randomNumber >>

Receiver(self) == startReceiver(self) \/ ReceiveMessage(self)

startMessageCorrupter(self) == /\ pc[self] = "startMessageCorrupter"
                               /\ IF corruptionCounter < 2
                                     THEN /\ \/ /\ pc' = [pc EXCEPT ![self] = "RemoveMessage"]
                                             \/ /\ pc' = [pc EXCEPT ![self] = "RemoveAcknowledgement"]
                                     ELSE /\ pc' = [pc EXCEPT ![self] = "Done"]
                               /\ UNCHANGED << sendQueue, messageChannel, 
                                               acknowledgeChannel, sendCount, 
                                               receiveCount, corruptionCounter, 
                                               createMessageCounter, 
                                               currentMessageCounter, 
                                               sendMessages, 
                                               acknowledgedMessages, message, 
                                               acknowledgedMessage, 
                                               sendMessage, receivedMessage, 
                                               randomNumber >>

RemoveMessage(self) == /\ pc[self] = "RemoveMessage"
                       /\ Len (messageChannel) > 0
                       /\ messageChannel' = Remove (RandomIndex(messageChannel), messageChannel)
                       /\ corruptionCounter' = corruptionCounter + 1
                       /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                       /\ UNCHANGED << sendQueue, acknowledgeChannel, 
                                       sendCount, receiveCount, 
                                       createMessageCounter, 
                                       currentMessageCounter, sendMessages, 
                                       acknowledgedMessages, message, 
                                       acknowledgedMessage, sendMessage, 
                                       receivedMessage, randomNumber >>

RemoveAcknowledgement(self) == /\ pc[self] = "RemoveAcknowledgement"
                               /\ Len (messageChannel) > 0
                               /\ acknowledgeChannel' = Remove (RandomIndex(acknowledgeChannel), acknowledgeChannel)
                               /\ corruptionCounter' = corruptionCounter + 1
                               /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                               /\ UNCHANGED << sendQueue, messageChannel, 
                                               sendCount, receiveCount, 
                                               createMessageCounter, 
                                               currentMessageCounter, 
                                               sendMessages, 
                                               acknowledgedMessages, message, 
                                               acknowledgedMessage, 
                                               sendMessage, receivedMessage, 
                                               randomNumber >>

MessageCorrupter(self) == startMessageCorrupter(self)
                             \/ RemoveMessage(self)
                             \/ RemoveAcknowledgement(self)

Next == (\E self \in {"S"}: Sender(self))
           \/ (\E self \in {"R"}: Receiver(self))
           \/ (\E self \in {"MC"}: MessageCorrupter(self))

Spec == /\ Init /\ [][Next]_vars
        /\ \A self \in {"S"} : WF_vars(Sender(self))
        /\ \A self \in {"R"} : WF_vars(Receiver(self))

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Wed Mar 23 15:43:16 CET 2022 by dirk-janswagerman
\* Created Sun Mar 06 20:47:53 CET 2022 by dirk-janswagerman
