#!/bin/sh
# A family over Q(t) with torsion 2x8 and 10 independent sections.
exec python3 "$(dirname "$0")/../check.py" 2x8 10 "$1"
