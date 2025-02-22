# open3e-ha-addon
Home Assistnat Addon Open3e

!!! STILL in ALPHA-Status !!! Use at your own risk. 

This Addon connects to a USB Can adapter which is plugged into the Home Assistant device. It will connect to the CAN interface and runs the Open3e https://github.com/open3e/open3e to read and potentially write to Viessmann E3 platform devices (Heat Pump, Venting System, Solar Inverter)

It requires the Mosquitto MQTT broker to be installed. It will use the Home Assistant build in capability to publish and subscribe to the MQTT Broker the data comming from the CAN adapter. 

As it is in Alpha Status the user testmqtt password: test needs to be added to the Mosquitto MQTT broker to authenticate

