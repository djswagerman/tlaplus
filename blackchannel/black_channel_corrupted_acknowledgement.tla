-------------- MODULE black_channel_corrupted_acknowledgement --------------

EXTENDS Integers, Naturals, Sequences, TLC, FiniteSets
CONSTANTS Msg, MaxMessagesInFlight

Remove(i, seq) ==   [j \in 1..(Len(seq)-1) |-> 
                        IF j < i THEN
                            seq[j]
                        ELSE
                            seq[j+1]]

RandomIndex (seq) == CHOOSE x \in 1..Len(seq) : x < Len(seq)


(* --algorithm blackchannel
variables
    createMessageCounter = 0;
    currentMessageCounter = 1;
    corruptionCounter = 0;  
    
    message = [content |-> <<>>, counter |-> 0, checksum |-> 0];
    
    sendMessages = <<>>;
    acknowledgedMessages = <<>>;
    
    messageChannel = <<>>;
    acknowledgeChannel = <<>>;


    define
        EachSendMessageWillEventuallyBeReceived == ([](\A i \in 1..Len (acknowledgedMessages) : acknowledgedMessages[i].counter = sendMessages[i].counter))
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
                createMessageCounter := createMessageCounter + 1;
                with m \in Msg do
                    message.content := m || message.counter := createMessageCounter;
                    sendMessages := Append (sendMessages, message);
                end with;
        or            
            await Len (messageChannel) < MaxMessagesInFlight /\ currentMessageCounter <= Len (sendMessages);
            SendMessage:            
                Send (messageChannel, sendMessages[currentMessageCounter]);
        or 
            await Len (acknowledgeChannel) > 0;
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
        either
            await Len (messageChannel) > 0 /\ Len (acknowledgeChannel) < MaxMessagesInFlight ;
            ReceiveMessage:
                Receive (receivedMessage, messageChannel);
        or
            await receivedMessage # <<>>;
            SendAcknowledgeMessage: 
                Send (acknowledgeChannel, receivedMessage);
                receivedMessage := <<>>;
        end either;
    end while;
end process;


process MessageCorrupter \in {"MC"}
variables
    randomNumber;
begin
startMessageCorrupter:
    while TRUE do
        either
            await Len (messageChannel) > 0;
            RemoveMessage:
                messageChannel := Remove (RandomIndex(messageChannel), messageChannel);
                corruptionCounter := corruptionCounter + 1;
        or
            RemoveAcknowledgement:
                await Len (messageChannel) > 0;
                acknowledgeChannel := Remove (RandomIndex(acknowledgeChannel), acknowledgeChannel);
                corruptionCounter := corruptionCounter + 1;
        end either;
    end while;
end process;



end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "66a368b1" /\ chksum(tla) = "a2b062e5")
CONSTANT defaultInitValue
VARIABLES createMessageCounter, currentMessageCounter, corruptionCounter, 
          message, sendMessages, acknowledgedMessages, messageChannel, 
          acknowledgeChannel, pc

(* define statement *)
EachSendMessageWillEventuallyBeReceived == ([](\A i \in 1..Len (acknowledgedMessages) : acknowledgedMessages[i].counter = sendMessages[i].counter))

VARIABLES acknowledgedMessage, sendMessage, receivedMessage, randomNumber

vars == << createMessageCounter, currentMessageCounter, corruptionCounter, 
           message, sendMessages, acknowledgedMessages, messageChannel, 
           acknowledgeChannel, pc, acknowledgedMessage, sendMessage, 
           receivedMessage, randomNumber >>

ProcSet == ({"S"}) \cup ({"R"}) \cup ({"MC"})

Init == (* Global variables *)
        /\ createMessageCounter = 0
        /\ currentMessageCounter = 1
        /\ corruptionCounter = 0
        /\ message = [content |-> <<>>, counter |-> 0, checksum |-> 0]
        /\ sendMessages = <<>>
        /\ acknowledgedMessages = <<>>
        /\ messageChannel = <<>>
        /\ acknowledgeChannel = <<>>
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
                        \/ /\ Len (messageChannel) < MaxMessagesInFlight /\ currentMessageCounter <= Len (sendMessages)
                           /\ pc' = [pc EXCEPT ![self] = "SendMessage"]
                        \/ /\ Len (acknowledgeChannel) > 0
                           /\ pc' = [pc EXCEPT ![self] = "AcknowledgeMessage"]
                     /\ UNCHANGED << createMessageCounter, 
                                     currentMessageCounter, corruptionCounter, 
                                     message, sendMessages, 
                                     acknowledgedMessages, messageChannel, 
                                     acknowledgeChannel, acknowledgedMessage, 
                                     sendMessage, receivedMessage, 
                                     randomNumber >>

CreateMessage(self) == /\ pc[self] = "CreateMessage"
                       /\ createMessageCounter' = createMessageCounter + 1
                       /\ \E m \in Msg:
                            /\ message' = [message EXCEPT !.content = m,
                                                          !.counter = createMessageCounter']
                            /\ sendMessages' = Append (sendMessages, message')
                       /\ pc' = [pc EXCEPT ![self] = "startSender"]
                       /\ UNCHANGED << currentMessageCounter, 
                                       corruptionCounter, acknowledgedMessages, 
                                       messageChannel, acknowledgeChannel, 
                                       acknowledgedMessage, sendMessage, 
                                       receivedMessage, randomNumber >>

SendMessage(self) == /\ pc[self] = "SendMessage"
                     /\ messageChannel' = Append (messageChannel, (sendMessages[currentMessageCounter]))
                     /\ pc' = [pc EXCEPT ![self] = "startSender"]
                     /\ UNCHANGED << createMessageCounter, 
                                     currentMessageCounter, corruptionCounter, 
                                     message, sendMessages, 
                                     acknowledgedMessages, acknowledgeChannel, 
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
                            /\ UNCHANGED << createMessageCounter, 
                                            corruptionCounter, message, 
                                            sendMessages, messageChannel, 
                                            sendMessage, receivedMessage, 
                                            randomNumber >>

Sender(self) == startSender(self) \/ CreateMessage(self)
                   \/ SendMessage(self) \/ AcknowledgeMessage(self)

startReceiver(self) == /\ pc[self] = "startReceiver"
                       /\ \/ /\ Len (messageChannel) > 0 /\ Len (acknowledgeChannel) < MaxMessagesInFlight
                             /\ pc' = [pc EXCEPT ![self] = "ReceiveMessage"]
                          \/ /\ receivedMessage[self] # <<>>
                             /\ pc' = [pc EXCEPT ![self] = "SendAcknowledgeMessage"]
                       /\ UNCHANGED << createMessageCounter, 
                                       currentMessageCounter, 
                                       corruptionCounter, message, 
                                       sendMessages, acknowledgedMessages, 
                                       messageChannel, acknowledgeChannel, 
                                       acknowledgedMessage, sendMessage, 
                                       receivedMessage, randomNumber >>

ReceiveMessage(self) == /\ pc[self] = "ReceiveMessage"
                        /\ Len(messageChannel) > 0
                        /\ receivedMessage' = [receivedMessage EXCEPT ![self] = Head (messageChannel)]
                        /\ messageChannel' = Tail (messageChannel)
                        /\ pc' = [pc EXCEPT ![self] = "startReceiver"]
                        /\ UNCHANGED << createMessageCounter, 
                                        currentMessageCounter, 
                                        corruptionCounter, message, 
                                        sendMessages, acknowledgedMessages, 
                                        acknowledgeChannel, 
                                        acknowledgedMessage, sendMessage, 
                                        randomNumber >>

SendAcknowledgeMessage(self) == /\ pc[self] = "SendAcknowledgeMessage"
                                /\ acknowledgeChannel' = Append (acknowledgeChannel, receivedMessage[self])
                                /\ receivedMessage' = [receivedMessage EXCEPT ![self] = <<>>]
                                /\ pc' = [pc EXCEPT ![self] = "startReceiver"]
                                /\ UNCHANGED << createMessageCounter, 
                                                currentMessageCounter, 
                                                corruptionCounter, message, 
                                                sendMessages, 
                                                acknowledgedMessages, 
                                                messageChannel, 
                                                acknowledgedMessage, 
                                                sendMessage, randomNumber >>

Receiver(self) == startReceiver(self) \/ ReceiveMessage(self)
                     \/ SendAcknowledgeMessage(self)

startMessageCorrupter(self) == /\ pc[self] = "startMessageCorrupter"
                               /\ \/ /\ Len (messageChannel) > 0
                                     /\ pc' = [pc EXCEPT ![self] = "RemoveMessage"]
                                  \/ /\ pc' = [pc EXCEPT ![self] = "RemoveAcknowledgement"]
                               /\ UNCHANGED << createMessageCounter, 
                                               currentMessageCounter, 
                                               corruptionCounter, message, 
                                               sendMessages, 
                                               acknowledgedMessages, 
                                               messageChannel, 
                                               acknowledgeChannel, 
                                               acknowledgedMessage, 
                                               sendMessage, receivedMessage, 
                                               randomNumber >>

RemoveMessage(self) == /\ pc[self] = "RemoveMessage"
                       /\ messageChannel' = Remove (RandomIndex(messageChannel), messageChannel)
                       /\ corruptionCounter' = corruptionCounter + 1
                       /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                       /\ UNCHANGED << createMessageCounter, 
                                       currentMessageCounter, message, 
                                       sendMessages, acknowledgedMessages, 
                                       acknowledgeChannel, acknowledgedMessage, 
                                       sendMessage, receivedMessage, 
                                       randomNumber >>

RemoveAcknowledgement(self) == /\ pc[self] = "RemoveAcknowledgement"
                               /\ Len (messageChannel) > 0
                               /\ acknowledgeChannel' = Remove (RandomIndex(acknowledgeChannel), acknowledgeChannel)
                               /\ corruptionCounter' = corruptionCounter + 1
                               /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                               /\ UNCHANGED << createMessageCounter, 
                                               currentMessageCounter, message, 
                                               sendMessages, 
                                               acknowledgedMessages, 
                                               messageChannel, 
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
\* Last modified Thu Mar 24 20:12:28 CET 2022 by dirk-janswagerman
\* Created Wed Mar 23 16:19:17 CET 2022 by dirk-janswagerman

=============================================================================
\* Modification History
\* Created Thu Mar 24 19:24:19 CET 2022 by dirk-janswagerman

=============================================================================
\* Modification History
\* Created Thu Mar 24 19:29:38 CET 2022 by dirk-janswagerman

=============================================================================
\* Modification History
\* Created Thu Mar 24 19:36:49 CET 2022 by dirk-janswagerman
