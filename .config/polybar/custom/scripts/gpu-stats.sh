#!/bin/sh
nvidia-smi --query-gpu=utilization.gpu,memory.used, --format=csv,noheader, nounits | awk  '{print " " $1"% " $3"MiB"}'
