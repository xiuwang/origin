#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

OS_ROOT=$(dirname "${BASH_SOURCE}")/../..
source "${OS_ROOT}/hack/util.sh"
os::log::install_errexit

# This test validates the edit command

oc create -f examples/hello-openshift/hello-pod.json

[ "$(OC_EDITOR='cat' oc edit pod/hello-openshift 2>&1 | grep 'Edit cancelled')" ]
[ "$(OC_EDITOR='cat' oc edit pod/hello-openshift | grep 'name: hello-openshift')" ]
echo "edit: ok"

