#!/usr/bin/env bash

rsync -rav --delete --exclude "hardware-configuration.nix" . /etc/nixos
