#!/usr/bin/env bashio


bashio::log.info "Preparing to start...checking can interface"
lsmod
ifconfig -a | grep can0
ip link set can0 down
ip link set can0 up
ip link | grep can0

bashio::log.info "Preparing to start...checking for devices.json"

if ! test -f /open3e/devices.json; then
   bashio::log.info "Running open3e depcit system ... This may take a while"
   cd /open3e
   open3e_depictSystem -c can0 
fi

bashio::log.info "Starting Open3e..."
cd /open3e
open3e @args
