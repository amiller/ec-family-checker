#!/bin/sh
# A family over Q(t) with torsion 9 and 13 independent sections.
exec python3 "$(dirname "$0")/../check.py" 9 13 "$1"
