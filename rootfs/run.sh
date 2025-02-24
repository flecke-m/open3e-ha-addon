#!/usr/bin/env bashio


bashio::log.info "Preparing to start...checking can interface"

ifconfig -a | grep can0
ip link set can0 type can bitrate 250000 && ifconfig can0 up
ip link | grep can0

bashio::log.info "Preparing to start...checking for devices.json"

if ! test -f /data/devices.json; then
   bashio::log.info "Running open3e depcit system ... This may take a while"
   cd /data
   open3e_depictSystem -c can0 
fi

bashio::log.info "Starting Open3e..."
cd /data
open3e --can can0 --mqtt 127.0.0.1:1883:open3e --mqttuser testmqtt:test --mqttformatstring {device}_{ecuAddr:03X}_{didNumber}_{didName} --listen open3e/cmnd --config /data/devices.json
