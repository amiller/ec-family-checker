#!/bin/sh
# A family over Q(t) with torsion 6 and 20 independent sections.
exec python3 "$(dirname "$0")/../check.py" 6 20 "$1"
