#!/usr/bin/env bashio



bashio::log.info "Preparing to start...reading config"


CAN=$(bashio::config 'main.can')
bashio::log.info "Can Interface:  $CAN"
ListenTopic=$(bashio::config 'main.Listen-Topic')
bashio::log.info "Listen to topic:  $ListenTopic"
SERVER=$(bashio::config 'mqtt.Server_Topic')
bashio::log.info "MQTT Server and Publish Topic:  $SERVER"
USERPWD=$(bashio::config 'mqtt.MQTT-User-Password')
bashio::log.info "MQTT Username/Password:  $USERPWD"
FORMATSTRING=$(bashio::config 'mqtt.MQTT-Format-String')
bashio::log.info "Format String:  $FORMATSTRING"
CLIENTID=$(bashio::config 'mqtt.MQTT_ClientID')
bashio::log.info "ClientID:  $CLIENTID"    

bashio::log.info "Preparing to start...checking can interface"

ifconfig -a | grep $CAN
ip link set $CAN type can bitrate 250000 && ifconfig $CAN up
ip link | grep $CAN

bashio::log.info "Preparing to start...checking for devices.json"

if ! test -f /data/devices.json; then
   bashio::log.info "Running open3e depcit system ... This may take a while"
   cd /data
   open3e_depictSystem -c $CAN
fi

bashio::log.info "Starting Open3e..."
cd /data
open3e --can $CAN --mqtt $SERVER --mqttuser $USERPWD --mqttformatstring $FORMATSTRING --mqttclientid $CLIENTID --listen $ListenTopic --config /data/devices.json