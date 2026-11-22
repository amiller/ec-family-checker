#!/bin/sh
# A family over Q(t) with torsion 2x4 and 8 independent sections.
exec python3 "$(dirname "$0")/../check.py" 2x4 8 "$1"
