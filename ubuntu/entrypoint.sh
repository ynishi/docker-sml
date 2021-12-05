#!/bin/sh

# support "rlwrap: error: My terminal reports width=0"
# thanks for https://github.com/sflyr/docker-sqlplus/pull/2/files
sleep 1
rlwrap ${RLWRAP_OPTS} sml $@
