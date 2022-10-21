#!/bin/bash
LANG=$(xkblayout-state print %s)
CAPS=$(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p' | awk '{if ($0 == "on") { print "CAPS" } }')

echo -n "$LANG $CAPS" 
