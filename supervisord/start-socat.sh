#!/bin/bash

while [ ! $(getent hosts application | awk '{ print $1 }') ]; do
  true
done

echo -n 80 8088 | xargs -d ' ' -I% bash -c "socat TCP-LISTEN:%,reuseaddr,fork TCP:$(getent hosts application | awk '{ print $1 }'):80" | sh