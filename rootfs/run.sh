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
open3e @args
