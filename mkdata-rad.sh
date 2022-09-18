#!/usr/bin/env bash

set -e

for f in flight1.csv flight2.csv; do
    awk -F, '{print $1 " " $2 " " $3}' "${f?}" \
	| sed 1d \
	| while read DATE TIME ALT VEL; do
	echo "$(date +%s -d "$(echo ${DATE?} ${TIME?})") ${ALT?} ${VEL?}"
    done > "$(basename "${f?}" .csv).data"
done

GEIGERTIME=1663508220
REALTIME=1663502063
OFS=$(expr $REALTIME - $GEIGERTIME + 3600)

awk -F, '{print $1 " " $3}' radiation.csv \
    | sed 1,3d \
    | while read DATE TIME USV; do
    TSS="$(echo ${DATE?} ${TIME?})"
    TS="$(date +%s -d "${TSS?}")"
    TSFIX="$(expr ${TS?} + ${OFS?})"
    echo "${TSFIX?} ${USV?}"
done > rad.data
