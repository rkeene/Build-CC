#! /bin/bash

# Tested

if [ -z "${LINUX_VERS}" ]; then
	LINUX_VERS='4.0'
	LINUX_TARBALL_SHA256='0f2f7d44979bc8f71c4fc5d3308c03499c26a824dd311fdf6eef4dee0d7d5991'
	export LINUX_VERS LINUX_TARBALL_SHA256
fi