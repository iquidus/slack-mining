#!/bin/bash

# amdmon

## Copyright 2013 Luke Williams, luke@iquidus.co.nz
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

if [ -x ${1+x} ]; then
echo "usage:"
echo "$(basename $0) [adapter]"
exit
fi

INTERVAL=5
ADAPTER=$1

while [ 0 ]; do
TEMP=$(aticonfig --adapter=$ADAPTER --od-gettemperature | grep Temperature | awk '{print $5}')
LOAD=$(aticonfig --adapter=$ADAPTER --od-getclocks | grep "GPU load" | awk '{print $4}')
CORE=$(aticonfig --adapter=$ADAPTER --od-getclocks | grep "Current Clocks" | awk '{print $4}')
MEM=$(aticonfig --adapter=$ADAPTER --od-getclocks | grep "Current Clocks" | awk '{print $5}')
FAN=$(export DISPLAY=:0.$ADAPTER; aticonfig --pplib-cmd "get fanspeed 0" | grep "Fan Speed" | awk '{print $4}')
echo "GPU $ADAPTER - Core: $CORE MHz - Memory: $MEM MHz - Load: $LOAD - Temp: $TEMP C - Fan: $FAN"
sleep $INTERVAL
done


