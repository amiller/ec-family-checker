#!/bin/sh
# A family over Q(t) with torsion 3 and 16 independent sections.
exec python3 "$(dirname "$0")/../check.py" 3 16 "$1"
