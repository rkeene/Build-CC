#! /usr/bin/env sh

GCC_VERS="$1"

case "${GCC_VERS}" in
	4.9.*)
		exit 0
		;;
esac

exit 1
