#!/bin/bash

# Arguments:
# $1 = Date (four digits)
# $2 = AM or PM (narrows it down to 2 possible times)
# $3 = Time

cat $1_Dealer_schedule | grep $3 | grep $2 | awk '{print $5,$6}'
