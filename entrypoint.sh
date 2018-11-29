#!/bin/bash

set -o errexit

#
# If there's an empty mount over /etc/salt, then copy the original
# configuration files to it.
#
if [ -n "$( find "/etc/salt/" -maxdepth 0 -empty )" ]; then
  cp -a "/etc/salt.dist/*" "/etc/salt/"
fi

exec /usr/bin/salt-master

