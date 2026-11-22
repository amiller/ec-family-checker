#!/bin/sh
# A family over Q(t) with torsion 2x4 and 17 independent sections.
exec python3 "$(dirname "$0")/../check.py" 2x4 17 "$1"
