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




end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "b94255ec" /\ chksum(tla) = "52726951")
VARIABLES sendQueue, messageChannel, acknowledgeChannel, sendCount, 
          receiveCount, corruptionCounter, createMessageCounter, 
          currentMessageCounter, sendMessages, acknowledgedMessages, message, 
          pc

(* define statement *)
EachSendMessageWillEventuallyBeReceived == (<>(\A msg \in {sendMessages[i] : i \in DOMAIN sendMessages }: msg \in {acknowledgedMessages[j] : j \in DOMAIN acknowledgedMessages}))

VARIABLES acknowledgedMessage, sendMessage, receivedMessage

vars == << sendQueue, messageChannel, acknowledgeChannel, sendCount, 
           receiveCount, corruptionCounter, createMessageCounter, 
           currentMessageCounter, sendMessages, acknowledgedMessages, message, 
           pc, acknowledgedMessage, sendMessage, receivedMessage >>

ProcSet == ({"S"}) \cup ({"R"})

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
        /\ pc = [self \in ProcSet |-> CASE self \in {"S"} -> "startSender"
                                        [] self \in {"R"} -> "startReceiver"]

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
                                     receivedMessage >>

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
                                       receivedMessage >>

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
                                     receivedMessage >>

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
                                            receivedMessage >>

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
                                       receivedMessage >>

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
                                        acknowledgedMessage, sendMessage >>

Receiver(self) == startReceiver(self) \/ ReceiveMessage(self)

Next == (\E self \in {"S"}: Sender(self))
           \/ (\E self \in {"R"}: Receiver(self))

Spec == /\ Init /\ [][Next]_vars
        /\ \A self \in {"S"} : WF_vars(Sender(self))
        /\ \A self \in {"R"} : WF_vars(Receiver(self))

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Wed Mar 23 15:47:00 CET 2022 by dirk-janswagerman
\* Created Sun Mar 06 20:47:53 CET 2022 by dirk-janswagerman
