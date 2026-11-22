#!/bin/sh
# A family over Q(t) with torsion 8 and 23 independent sections.
exec python3 "$(dirname "$0")/../check.py" 8 23 "$1"
