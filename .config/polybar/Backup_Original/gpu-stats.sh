#!/bin/sh
#nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ print "GPU",""$1"","%"}'
nvidia-smi --query-gpu=utilization.gpu,memory.used, --format=csv,noheader, nounits | awk  '{print "GPU " $1"% " $3"MiB"}'
