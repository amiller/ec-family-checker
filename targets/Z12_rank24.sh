#!/bin/sh
# A family over Q(t) with torsion 12 and 24 independent sections.
exec python3 "$(dirname "$0")/../check.py" 12 24 "$1"
