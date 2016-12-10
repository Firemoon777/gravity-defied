#!/usr/bin/sed -Enf
# Gravity defied 
# 9 Dec 2016
# (C) Voldemar 
# tg: @firemoon777

# key map
/^$/b print
/^r/b print
/^q/q
/^s/b left
/^w/b right 
/^t/b down 

:print 
g
s/.*/\
+-------------------------------------+\
|BBBBBBBBBBBBBBBBBBBBBBSBFBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBRRRRBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBRBBBRBBBBBBBBBBBB|\
|RBBBBBBBBBBBBBBBBBRRBBBBRBBBBBBBBBBBB|\
|BRBBBBBBBBBBBBBBBRBBBBBBRBBBBBBBBBBBB|\
|BBRRRRRRRRRRRRRRRBBBBBBBRRRRRRRRRRRRR|\
+-------------------------------------+\
/
b end

# moving forward
:right
	g
	# Prevent moving in air
	/(F|S)(.{39})R/ {
		s/SFR/BFR/g	
		s/SB/BS/g
		s/FB/BF/g	
	}
	b check

:left
	g
	/(F|S)(.{39})R/ {
		s/RSF/RSB/g	
		s/BF/FB/g
		s/BS/SB/g
	}
	b check 

# Physics
:down
	g
	# Free fall
	/F(.{39})R|S(.{39})R/ !{
		s/F(.{39})B/B\1F/
		s/S(.{39})B/B\1S/
	}
	b end 
:check
/(S|F)(.*)(F|S)/ !{ 
	s/$/died/
}
:end
h
# Road █ ▞
# s/([^B])R/\1P/g
s/R(.{38})R/U\1U/g
s/R(.{39})R/A\1A/g
s/R(.{40})R/D\1D/g
s/R/P/g
s/A/[107;38;5;82m█[0m/g
s/D/[107;38;5;82m▚[0m/g
s/P/[107;38;5;82m▀[0m/g
s/U/[107;38;5;82m▞[0m/g
# Wheels
y/FS/WW/
s/W/[107;38;5;0mo[0m/g
# Background
s/B/[107m [0m/g
i\
[H
/died/ {
	s/died/You're died!/
	p;q
}
p
