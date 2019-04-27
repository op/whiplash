#!/bin/sh

text=`head -n 10240 /usr/share/dict/words | tail -n 64 | tr -d \'s | tr '\n' ' '`

`dirname $0`/yesno.sh "$text"
`dirname $0`/gauge.sh "$text"
