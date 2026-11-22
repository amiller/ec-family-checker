#!/bin/sh
# A family over Q(t) with torsion 4 and 12 independent sections.
exec python3 "$(dirname "$0")/../check.py" 4 12 "$1"
