#!/bin/bash 

set -x
set -u
set -o pipefail

ansible-playbook -i inv local_playbook.yml

docker image build --tag local/nginx:dockerfile-example .

docker container run -d -p 8080:80 -p 8443:443 local/nginx:dockerfile-example
