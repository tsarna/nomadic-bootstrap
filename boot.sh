#!/bin/sh

export NOMADIC_DIR=${NOMADIC_DIR:-/etc/nomadic}
export NOMADIC_BOOT_D=${NOMADIC_BOOT_D:-/boot/boot.d}
export NOMADIC_VAR=${NOMADIC_VAR:-/var/nomadic}
export NOMADIC_BIN=${NOMADIC_BIN:-/usr/local/bin}

mkdir -p ${NOMADIC_VAR} ${NOMADIC_DIR}

(
    cd ${NOMADIC_BOOT_D} && \
    for script in *; do
	echo; echo "### $script:"
	./$script
	ec=$?
	if [ ! $? ]; then
            echo 1>&2 "*** $script Failed with exit code $ec"
            exit $ec
        fi
    done
)
