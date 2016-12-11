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
/^w/b press_right 
/^t/b down 
/^a/b rotate1

:print 
g
s/.*/\
+-------------------------------------+\
|BBBBBBBBBBBBBBBBBBBBBBSBFBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBRRRRBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBRBBBRBBBBBBBBBBBB|\
|RBBBBBBBBBBBBBBBBBRRBBBBRBBBBBBBBBBBB|\
|BRBBBBBBBBBBBBBBBRBBBBBBRBBBBBBBBBBBB|\
|BBRRRRRRRRRRRRRRRBBBBBBBRRRRRRRRRRRRR|\
+-------------------------------------+\
0s\
/
b end

# moving forward
:press_right
	g
	# Prevent moving in air
	/(F|S)(.{39})R/ {
		s/8s/9s/
		s/7s/9s/
		s/6s/8s/
		s/5s/8s/
		s/4s/8s/
		s/2s/4s/
		s/1s/2s/
		s/0s/1s/
	:right
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
:rotate1
	g
	s/(.)(.{40})F(.{37})S/F\2\1\3S/g
	s/B(.{37})S(.)F/F\1S\2B/g
	b check
# Physics
:down
	g
	# Free fall
	/F(.{39})R|S(.{39})R/ !{
		s/F(.{39})B/B\1F/
		s/S(.{39})B/B\1S/
	}
	# Velocity
	/[1-9]s/ {
		s/1s/0s/
		s/2s/1s/
		s/3s/2s/
		s/4s/3s/
		s/5s/4s/
		s/6s/5s/
		s/7s/6s/
		s/8s/7s/
		s/9s/8s/
		b right
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
