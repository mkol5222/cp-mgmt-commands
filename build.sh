#!/bin/bash

cd /tmp; git clone https://github.com/CheckPointSW/terraform-provider-checkpoint; cd /tmp/terraform-provider-checkpoint/commands; ls

COMMANDS="approve_session  discard  install_policy  logout  publish  reject_session  submit_session  verify_policy"

for CMD in $COMMANDS; do
    echo $CMD
    pushd $CMD
    ls
    ls "./$CMD.go"
    go build "./$CMD.go"
    popd
done

mkdir -p /workspaces/cp-mgmt-commands/releases/$(uname -p)
cd /tmp/terraform-provider-checkpoint/commands
for CMD in $COMMANDS; do
    echo $CMD
    pushd $CMD
    mv ./$CMD /workspaces/cp-mgmt-commands/releases/$(uname -p)/
    popd
done


cd /workspaces/cp-mgmt-commands

echo
ls /workspaces/cp-mgmt-commands/releases/$(uname -p)
