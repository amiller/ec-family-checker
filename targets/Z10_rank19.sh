#!/bin/sh
# A family over Q(t) with torsion 10 and 19 independent sections.
exec python3 "$(dirname "$0")/../check.py" 10 19 "$1"
