#!/bin/sh

egrep -o '[a-z][A-Z]{3}[a-z][A-Z]{3}[a-z]' level3.txt | cut -c5
