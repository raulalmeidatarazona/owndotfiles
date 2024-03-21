#!/usr/bin/env bash

bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)
atuin login -u raulalmeida
atuin sync -f