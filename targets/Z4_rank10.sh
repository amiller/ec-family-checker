#!/bin/sh
# A family over Q(t) with torsion 4 and 10 independent sections.
exec python3 "$(dirname "$0")/../check.py" 4 10 "$1"
