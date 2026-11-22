#!/bin/sh
# A family over Q(t) with torsion 2 and 10 independent sections.
exec python3 "$(dirname "$0")/../check.py" 2 10 "$1"
