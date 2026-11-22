#!/bin/sh
# A family over Q(t) with torsion 1 and 2 independent sections.
exec python3 "$(dirname "$0")/../check.py" 1 2 "$1"
