#!/usr/bin/sed -Enf
# Gravity defied 
# 9 Dec 2016
# (C) Voldemar 
# tg: @firemoon777
p
/^q/q
# print lvl
/^a/b left
/^d/b right 

:print 
g
 /$^/ !{ s/.*/\
	+---------------------------+\
	|BBBBBBBBBBBBBBBBBBBBBBBBBBB|\
	|BBBBBBBBBBBBBBBBBBBBBBBBBBB|\
	|BBBBBBBBBBBBBBBBBBBBBBBBBBB|\
	|BBBBBBBBBBBBBBBBBBBBBBBBBBB|\
	|BBBBBBBBBBBBBBBBBBBBBBBBBBB|\
	|BBWBWBBBBBBBBBBBBBBBBBBBBBB|\
	|RRRRRRRRRRRRRRRRRRRRRRRRRRR|\
	+---------------------------+\
	/
}

b end
:right
	g
	s/WB/BW/g
	b end

:left
	g
	s/BW/WB/g
	b end

:end
h
# Wheels
s/W/[107;38;5;0mo[0m/g
# Background
s/B/[107m [0m/g
# Road
s/R/[107;38;5;82m▀[0m/g
i\
[H
p
