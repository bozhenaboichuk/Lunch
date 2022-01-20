#!/usr/bin/env sh

set -e

if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

exec bin/rails s -b 0.0.0.0
