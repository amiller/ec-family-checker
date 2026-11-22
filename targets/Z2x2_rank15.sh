#!/bin/sh
# A family over Q(t) with torsion 2x2 and 15 independent sections.
exec python3 "$(dirname "$0")/../check.py" 2x2 15 "$1"
