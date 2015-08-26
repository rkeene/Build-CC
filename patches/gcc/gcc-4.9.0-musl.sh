#! /usr/bin/env sh

GCC_VERS="$1"
CCNAME="$2"

case "${CCNAME}" in
	*-musl)
		;;
	*)
		exit 1
		;;
esac

case "${GCC_VERS}" in
	4.9.*)
		exit 0
		;;
esac

exit 1
