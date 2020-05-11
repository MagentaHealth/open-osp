#!/bin/bash

for filename in $ENVSUBST_CONFIG_FILES; do
    if [ -f $filename.template ]; then
        echo "Substituting $filename"
        envsubst < $filename.template \
                 > $filename
    fi
done


exec "$@"

