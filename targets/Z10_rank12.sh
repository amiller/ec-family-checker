#!/bin/sh
# A family over Q(t) with torsion 10 and 12 independent sections.
exec python3 "$(dirname "$0")/../check.py" 10 12 "$1"
