#!/bin/bash

# Check external template file
# If exist, replace /etc/nginx/ngnix.conf.ctmpl with external config file
TEMPLATE_FILE=/template/nginx.conf.ctmpl
DEFAULT_TEMPLATE_FILE=/etc/nginx/ngnix.conf.ctmpl
if [ -f "$TEMPLATE_FILE" ]; then
  echo "> Override default template\n"
  mv -f $TEMPLATE_FILE $DEFAULT_TEMPLATE_FILE
else
  echo "$ Starting with default template\n"
fi
