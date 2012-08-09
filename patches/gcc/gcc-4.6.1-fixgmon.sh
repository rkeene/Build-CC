#! /bin/bash

# This patch only applies to GCC 4.6.x
if echo "$1" | grep '^4\.6\.' >/dev/null; then
	exit 0
fi

exit 1
