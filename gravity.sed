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
/^e/b rotate-1
/^/d
b end

:print 
g
s/.*/\
+-------------------------------------+\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|\
|BBBBBBBBBBBBBBBBBBBBBBBBSBFBBBBBBBBBB|\
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
		s/2s/4s/
		s/1s/2s/
		s/0s/1s/
	:right
		s/SFR/BFR/g	
		s/SB/BS/g
		s/FB/BF/g	
	}
	/[1-9]s[1-9]/ {
		s/(.)s1/\1s0/
		s/(.)s2/\1s1/
		s/(.)s3/\1s2/
		s/(.)s4/\1s3/
		b right
	}
	s/([0-9])s[0-9]*/\1s/
	b check

:left
	g
	/(F|S)(.{39})R/ {
		s/RSF/RSB/g	
		s/BF/FB/g
		s/BS/SB/g
	}
	b check 
# Counterclockwise
:rotate1
	g
	s/(F|S)(.{39})(B)(.)(S|F)/\3\2\1\4\5/g

	s/(B)(F|S)(.{41})(S|F)/\2\1\3\4/g
	s/(B)(F|S)(.{40})(S|F)/\2\1\3\4/g
	s/(B)(F|S)(.{39})(S|F)/\2\1\3\4/g
	
	s/(B)(F|S)(.{38})(S|F)/\2\1\3\4/g
	s/(B)(F|S)(.{37})(S|F)/\2\1\3\4/g
	s/(B)(.{37})(S|F)(.)(F|B)/\5\2\3\4\1/g
	b check
# Clockwise
:rotate-1
	g
	s/0s/1s/g
	b check
# Physics
:down
	g
	# Free fall
	/F(.{39})R|S(.{39})R/ !{
		s/S(.{39})B/B\1S/
		s/F(.{39})B/B\1F/
	}
	# Velocity
	/[1-9]s/ {
		s/(.)s/\1s\1/
		/(F|S)(.{39})R/ {
			s/1s/0s/
			s/2s/1s/
			s/3s/2s/
			s/4s/3s/
		}
		b right
	}
	b end 
:check
/(S|F)(.*)(F|S)/ !{ 
	s/$/died/
	b end
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
s/S/[107;38;5;0m◉[0m/g
s/F/[107;38;5;0m○[0m/g
# Background
s/B/[107m [0m/g
i\
[H
/died$/ {
	s/died$/You're died!/
	p;q
}
p
