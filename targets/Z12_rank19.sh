#!/bin/sh
# A family over Q(t) with torsion 12 and 19 independent sections.
exec python3 "$(dirname "$0")/../check.py" 12 19 "$1"
