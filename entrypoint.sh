#!/bin/bash

set -e

nginx -g 'pid /tmp/nginx.pid;' -c '/nginx.conf'
mkdir -p '/run/dump1090-fa'
/usr/bin/dump1090-fa --quiet --net --write-json '/run/dump1090-fa'
