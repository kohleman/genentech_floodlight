#!/bin/bash
# Author Manuel Kohler

DATETIME=`date  +%Y_%m_%d_%H_%M_%S`
FILE_POSTFIX=_Genetech_Roche_Floodlight.csv
OUTPUT_FILE=${DATETIME}${FILE_POSTFIX}
CSV_FOLDER=./csv
LATEST=latest
WEBADDRESS=https://dataset.floodlightopen.com/public-blobs-prod/complete_dataset.csv


if [ ! -d "${CSV_FOLDER}" ]; then
  mkdir ${CSV_FOLDER}
fi

wget -q -O ${CSV_FOLDER}/${OUTPUT_FILE} ${WEBADDRESS}

if [ -L ${CSV_FOLDER}/${LATEST}${FILE_POSTFIX} ]; then
  rm ${CSV_FOLDER}/${LATEST}${FILE_POSTFIX}
fi

ln -s ${CSV_FOLDER}/${OUTPUT_FILE} ${CSV_FOLDER}/${LATEST}${FILE_POSTFIX}

echo -e "Saved file to ${CSV_FOLDER}/${OUTPUT_FILE} and created softlink to ${CSV_FOLDER}/${LATEST}${FILE_POSTFIX}"
