DF.print("test message data: " + data.sendMsg + ", humidity: " + data.humidity)
if (data.sendMsg == true) {
  DF.telegramResearchers("Humidity:" + data.humidity + ", temperature:" + data.temperature)  
}
