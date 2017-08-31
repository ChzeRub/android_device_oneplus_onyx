#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#


# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

function blob_fixup() {
    case "${1}" in
        vendor/lib/libmmcamera2_stats_algorithm.so)
            "${PATCHELF}" --add-needed libshim_mmcamera.so "${2}"
            ;;
    esac
}

export DEVICE=onyx
export DEVICE_COMMON=msm8974-common
export VENDOR_DEVICE=oneplus
export VENDOR_COMMON=oppo

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
