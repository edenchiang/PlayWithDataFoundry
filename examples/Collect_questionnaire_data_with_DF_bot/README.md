### **Description**
---
Collecting data remotely is one of the best benefit of collecting data via Data Foundry. Here is an example for collecting data remotely with TelegramBot of Data Foundry. I create a script running by Script dataset, and it will monitor / respond as Telegram bot to the participants in the same project according to the content. Also, all the results will be stored in IoT dataset.

<br>

### **Data Foundry setting**
---
#### Requirement
A project with
  - An active IoT dataset
  - An active Entity dataset
  - An active Script dataset
  - A participant
  - A device

#### Setting
- Copy the code in "lets_talk.js" and past into the Script dataset
- find the code below and replace the device_id with the id of the device created in Data Foundry
```javascript
// line 20
var device_id = "the_device_id_you_have"
```
- "SAVE" the code


<br>

### **Telegram settings**
---
1. Install [Telegram app](https://telegram.org/)
2. Search "DataFoundryBot" and "Start" chat

<br>

### **How to start conversation**
---
1. Open [Telegram app](https://telegram.org/) and get into the chat with "DataFoundryBot"
2. Click and "START" a new conversation
3. Login as a participant with a participant email and the PIN number on the paticipation page via invitation link
4. Say "hi" directly to the bot
5. Start your conversation / questionnaire

### **What will happen during / at the end of the conversation?**
---
The inputs from participants will be completely saved in the IoT dataset, and users can check the latest status of the conversations with all the participants in Entity dataset. <br />
And the "participant_id" in IoT dataset is applied to the "resource_id" in Entity dataset.

<br>

### **FAQ**
---
**Q. Something wrong with the DataFoundryBot, what can I do?**

A. Enter "/stop" and then "/start" over again

<br>

**Q. How to add new participant?**

A. [Add a new participant](https://data.id.tue.nl/documentation/add-participant)

<br>

**Q. How to add new device?**

A. [Add a new device](https://data.id.tue.nl/documentation/add-device)

<br>

**Q. How to add new dataset?**

A. [Add a new dataset](https://data.id.tue.nl/documentation/add-dataset)
