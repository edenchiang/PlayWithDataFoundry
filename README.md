## Implementation for the use-cases of the Data Foundry


### Data Foundry 

[Data Foundry](https://data.id.tue.nl) is a data infrastructure for prototyping and designing with data for the ID department of TU/e. In addition, the site serves as a Design Research Data Management system.


### PLATFORM - Raspberry Pi 3b

* [DHT11_in_Pi](examples/DHT11_in_Pi/)

	*Get humidity and temperature periodically with DHT11 module and receive notifications from the TelegramBot of the Data Foundry*

	*References: [Use-case: Data-enabled design II (informed step)](https://data.id.tue.nl/documentation/usecase-ded-2)*


### PLATFORM - ESP32

* [ESP32_with_OOCSI](examples/ESP32_with_OOCSI)

	*Get light data for the environment and send to the Data Foundry via OOCSI upload stream with ESP32, and observing the data with received information from download OOCSI stream*
	
	*References: [Use-case: Smart Things](https://data.id.tue.nl/documentation/usecase-smart-things)*