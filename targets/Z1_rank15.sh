#!/bin/sh
# A family over Q(t) with torsion 1 and 15 independent sections.
exec python3 "$(dirname "$0")/../check.py" 1 15 "$1"
