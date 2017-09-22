#!/bin/bash
#
# (c) Copyright 2016 Hewlett Packard Enterprise Development LP
# (c) Copyright 2017 SUSE LLC
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#

check_playbook_status()
{
    PLAYBOOK_NAME=$1
    STATUS=$2
    if [ $STATUS -eq 0 ]
    then
      echo "Playbook: $PLAYBOOK_NAME status: Ok"
    else
      echo "Playbook: $PLAYBOOK_NAME status: Fail"
      exit 1
    fi
}


for playbook in ceph-status.yml ceph-reconfigure.yml ceph-status.yml ceph-stop.yml ceph-start.yml ceph-status.yml
do
    ansible-playbook -i hosts/verb_hosts $playbook
    check_playbook_status $playbook $?
done

