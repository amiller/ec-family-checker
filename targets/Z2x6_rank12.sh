#!/bin/sh
# A family over Q(t) with torsion 2x6 and 12 independent sections.
exec python3 "$(dirname "$0")/../check.py" 2x6 12 "$1"
