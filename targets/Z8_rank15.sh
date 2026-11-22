#!/bin/sh
# A family over Q(t) with torsion 8 and 15 independent sections.
exec python3 "$(dirname "$0")/../check.py" 8 15 "$1"
