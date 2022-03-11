### Description

In this example, Arduino device will send messages to user(s) through the Telegram bot, and all the users have created connection with the Telegram bot will receive messages.

### Physical setting

No physical setting is required for this case

### TelegramBot settings

1. Install [Telegram app](https://telegram.org/)
2. Connect to [BotFather](https://t.me/botfather) with Telegram, remember to check the bot username should be @BotFather, this is the official BotFather
3. Start [creating a new Telegram bot](https://core.telegram.org/bots#6-botfather)
4. Search the newly created Telegram bot username on the Telegram app and create the connection with it
5. Check the **chat ID** of the conversation and get the **bot token** from [BotFather](https://t.me/botfather)
6. Wait and check for the messages from the Telegram bot :)

* How to get the **chat ID**?
    1. For personal conversation, start conversation with [@IDBot](https://t.me/IDBot) and enter "/getid" for getting personal chat ID
    2. For a channel chat, add the [@IDBot](https://t.me/IDBot) into the channel and enter "/getgroupid" in the channel for getting chat ID of the channel

### How to use Telegram bot in Arduino with chat ID and bot token

* References: 
    * Include library: **[universaltelegrambot](https://www.arduino.cc/reference/en/libraries/universaltelegrambot/)**
    * Documentation: [Github page](https://github.com/witnessmenow/Universal-Arduino-Telegram-Bot)
