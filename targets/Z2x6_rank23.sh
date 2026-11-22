#!/bin/sh
# A family over Q(t) with torsion 2x6 and 23 independent sections.
exec python3 "$(dirname "$0")/../check.py" 2x6 23 "$1"
