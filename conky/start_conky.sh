#!/usr/bin/env bash
set -euo pipefail

conky -c $HOME/.config/conky/keybindings.conf &
