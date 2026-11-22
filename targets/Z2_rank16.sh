#!/bin/sh
# A family over Q(t) with torsion 2 and 16 independent sections.
exec python3 "$(dirname "$0")/../check.py" 2 16 "$1"
