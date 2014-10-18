#!/bin/bash
cat ./install.sh | sed "s/prod/$2/g" | ssh root@$1 'bash -s'
