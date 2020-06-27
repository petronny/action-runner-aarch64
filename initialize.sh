#!/bin/sh
set -ex

echo ${GITHUB_RUN_ID} > ${GITHUB_WORKSPACE}/workflow_id

pkgbase=$(jq -r .action "${GITHUB_EVENT_PATH}")
uuid=$(echo $pkgbase | cut -d' ' -f2)
pkgbase=$(echo $pkgbase | cut -d' ' -f1)

echo "${GITHUB_WORKSPACE}/action-tools" >> $GITHUB_PATH
echo "${GITHUB_WORKSPACE}/lilac" >> $GITHUB_PATH
echo "::set-output name=pkgbase::${pkgbase}"
echo "::set-output name=uuid::${uuid}"
