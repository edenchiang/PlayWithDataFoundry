var chats = {};

// handshake
chats['hi'] = {text: "Hello, do you want to start the questionnaire? [[Yes]][[No]]", next: ""}

// chat phases
chats['phase-0'] = {text: "Content of phase-0 [[ok, good]]", next: "phase-1"}
chats['phase-1'] = {text: "content of phase-1", next: "phase-2"}
chats['phase-2'] = {text: "content of phase-2", next: "phase-3"}
chats['phase-3'] = {text: "content of phase-3", next: "phase-4"}
chats['phase-4'] = {text: "Thanks, see you soon!", next: ""}

// parse incoming message
var msg = data.message.toLowerCase()
var participant_id = data.participant_id
var profile = DF.entity.get(participant_id)
var isConversationStarted = profile.inConversation == null ? false : profile.inConversation
var inquery = profile.inquery == null || profile.inquery == "" ? "" : profile.inquery
var next_question = ""
var device_id = "d5ec11d5770e94800"
var again = false

// check incoming data and conversation status
// DF.print(typeof(data))
// DF.print("isConversationStarted: " + isConversationStarted)
// DF.print("inquery: " + inquery)

// confirmation for starting out
if(!isConversationStarted) {
  if (msg === "hi") {
    inquery = msg
    next_question = ""
    DF.telegramParticipant(data.participant_id, chats["hi"].text)
    DF.entity.update(data.participant_id, {inConversation: true, inquery: inquery})
  }
} else {
//   DF.print("conversation starts!")
//   DF.print("message:" + msg)
  if(chats[msg] !== undefined) {
    // chats[msg] is defined
    // DF.print("1-inquery:" + inquery)
    switch(msg) {
    case "phase-0":
      if(msg === "ok, good") {
        next_question = "phase-1"
      }
      break;
    case "ok, good":
      // oil
      next_question = "phase-2"
      break;
    default:
      // unexpected answer, repeat question again
      again = true
      break; 
    }
    // DF.print("1-next_question:" + next_question)
    // DF.print("starting")
  } else {
    // chats[msg] is undefined
    DF.print("2-inquery:" + inquery)
    switch(inquery) {
    case "hi":
      if(msg === "yes") {
        next_question = "phase-0"
      } else if (msg === "no") {
        next_question = "phase-4"
      }
      break;
    case "phase-2":
      next_question = "phase-3"
      break;
    case "phase-3":
      next_question = "phase-4"
      break;
    default:
      // if something wrong with inquery, restart the conversation
      next_question = "hi"
      break; 
    }
    // DF.print("2-next_question:" + next_question)
  }
//   DF.print("3-next question: " + next_question)
  if (!again) {
    DF.eventData.log(device_id, 'choice_' + inquery, {choice: msg, participant_id: participant_id})
    if(next_question === "phase-4") {
      isConversationStarted = false
      inquery = ""
    } else {
      inquery = next_question
    }
    DF.entity.update(participant_id, {inConversation: isConversationStarted, inquery: inquery})
  } else {
    next_question = inquery
  }
  DF.telegramParticipant(participant_id, chats[next_question].text)  
}
