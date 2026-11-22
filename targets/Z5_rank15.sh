#!/bin/sh
# A family over Q(t) with torsion 5 and 15 independent sections.
exec python3 "$(dirname "$0")/../check.py" 5 15 "$1"
