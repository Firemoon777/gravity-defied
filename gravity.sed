#!/usr/bin/sed -Enf
# Gravity defied 
# 9 Dec 2016
# (C) Voldemar 
# tg: @firemoon777

/^$/b print
/^r/b print
/^q/q
# print lvl
/^a/b left
/^d/b right 
/^t/b down 

:print 
g
s/.*/\
+-------------------------------------+\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|\
|BBSBFBBBBBBBBBBBBBBBBRRRRBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBRBBBRBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBRRBBBBRBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBRBBBBBBRBBBBBBBBBBBB|\
|RRRRRRRRRRRRRRRRRRBBBBBBRRRRRRRRRRRRR|\
+-------------------------------------+\
/


b end
:right
	g
	s/SF/BF/g	
	s/SB/BS/g
	s/FB/BF/g	
	b check

:left
	g
	s/SF/SB/g	
	s/BS/SB/g
	s/BF/FB/g
	b check 

:down
	g
	s/F(.{39})B/B\1F/
	s/S(.{39})B/B\1S/
	b end 
:check
/S(.*)F/ !{ 
	s/$/died/
}
:end
h
# Wheels
y/FS/WW/
s/W/[107;38;5;0mo[0m/g
# Background
s/B/[107m [0m/g
# Road
s/R/[107;38;5;82m▀[0m/g
i\
[H
/died/ {
	s/died/You're died!/
	p;q
}
p
