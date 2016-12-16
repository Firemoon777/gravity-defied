#!/usr/bin/sed -Enf
# Gravity defied 
# 9 Dec 2016
# (C) Voldemar 
# tg: @firemoon777

# key map
/^$/b print
/^r/b print
/^q/q
/^(s|2)/b left
/^(w|8)/b press_right 
/^t/b down 
/^(a|4)/b rotate1
/^(d|6)/b rotate-1
/^/d
b end

:print 
g
s/.*/\
+-----------------------+\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB1\
|BBBBSBFBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB2\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB3\
|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB4\
|BBBBBBBBBBBBBBBBBBBBBUPPABBBBBBBBBBBB5\
|BBBBBBBBBBBBBBBBBBBBUBBBABBBBBAPPPPPP6\
|DBBBBBBBBBBBBBBBBBUPBBBBABBBBBABBBBBB7\
|BDBBBBBBBBBBBBBBBUBBBBBBABBBBBABBBBBB8\
|BBPPPPPPPPPPPPPPPBBBBBBBPPPPPPPBBBBBB9\
+-----------------------+\
0s\
0z\
/
b end

# moving forward
:press_right
	g
	# Prevent moving in air
	/(F|S)(.{39})(U|D|P|A)/ {
		s/2s/4s/
		s/1s/2s/
		s/0s/1s/
		/S(U|D|P|A)/ {
			s/(B)(.{39})(F)/\3\2\1/
			s/(B)(.{39})(S)/\3\2\1/
		}
	:right
		/(F|S)(Q|q)/ {
			s/$/win/
			b check
		}
		s/SF(U|D|P|A)/BF\1/g	
		s/SB/BS/g
		s/FB/BF/g	
	}
	# prevent scrolling at last zone
	# load new zone if needed
	/(S|F)(.{2,25})[0-9]/ {
		s/\|./|/g
		s/(B|U|D|P|A|#)([0-9])/\1#\2/g
		/(#{10,13})/ {
			/0z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/BBBBBBBBBB\1/
				s/#*(6\n)/PPDBBBBUPP\1/
				s/#*(7\n)/BBBDBBUBBB\1/
				s/#*(8\n)/BBBBDUBBBB\1/
				s/#*(9\n)/BBBBBBBBBB\1/
				s/0z/1z/
				b continue
			}
			/1z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/BBBBBBBBBB\1/
				s/#*(6\n)/DBBBBBBBBB\1/
				s/#*(7\n)/BDBBBBABBB\1/
				s/#*(8\n)/BBPPPPPPPP\1/
				s/#*(9\n)/BBBBBBBBBB\1/
				s/1z/2z/
				b continue
			}
			/2z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/BBBBBBBBBB\1/
				s/#*(6\n)/BBBBBBBBBB\1/
				s/#*(7\n)/ABBBABBBAB\1/
				s/#*(8\n)/PPPPPPPPPP\1/
				s/#*(9\n)/BBBBBBBBBB\1/
				s/2z/3z/
				b continue
			}
			/3z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/BBBBBBBBBU\1/
				s/#*(6\n)/BBBBUPDBUB\1/
				s/#*(7\n)/BBBUBBBPBB\1/
				s/#*(8\n)/PPPBBBBBBB\1/
				s/#*(9\n)/BBBBBBBBBB\1/
				s/3z/4z/
				b continue
			}
			/4z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/ABADBBBBBB\1/
				s/#*(6\n)/ABABDBBAPP\1/
				s/#*(7\n)/ABABBDBABB\1/
				s/#*(8\n)/PPPBBBPPBB\1/
				s/#*(9\n)/BBBBBBBBBB\1/
				s/4z/5z/
				b continue
			}
			/5z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/BBBBBBUABB\1/
				s/#*(6\n)/PPPPPPBPPP\1/
				s/#*(7\n)/BBBBBBBBBB\1/
				s/#*(8\n)/BBBBBBBBBB\1/
				s/#*(9\n)/BBBBBBBBBB\1/
				s/5z/6z/
				b continue
			}
			/6z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/BUABAPABAP\1/
				s/#*(6\n)/PBABABABAB\1/
				s/#*(7\n)/BBABABABAB\1/
				s/#*(8\n)/BBABABABAB\1/
				s/#*(9\n)/BBPPPBPPPB\1/
				s/6z/7z/
				b continue
			}
			/7z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/PABAPDBBBB\1/
				s/#*(6\n)/BABABBDBBB\1/
				s/#*(7\n)/BABABBBDBB\1/
				s/#*(8\n)/BABABBBBPP\1/
				s/#*(9\n)/BPPPBBBBBB\1/
				s/7z/8z/
				b continue
			}
			/8z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/BBBBBBQBBB\1/
				s/#*(6\n)/BBBBBBqBBB\1/
				s/#*(7\n)/BBBBBBqBBB\1/
				s/#*(8\n)/PPPPPPPPPP\1/
				s/#*(9\n)/BBBBBBBBBB\1/
				s/8z/9z/
				b continue
			}
			/9z/ {
				s/#*(1\n)/BBBBBBBBBB\1/
				s/#*(2\n)/BBBBBBBBBB\1/
				s/#*(3\n)/BBBBBBBBBB\1/
				s/#*(4\n)/BBBBBBBBBB\1/
				s/#*(5\n)/BBBBBBBBBB\1/
				s/#*(6\n)/BBBBBBBBBB\1/
				s/#*(7\n)/BBBBBBBBBB\1/
				s/#*(8\n)/PPPPPPPPPP\1/
				s/#*(9\n)/BBBBBBBBBB\1/
				b continue
			}
		}
	}
	:continue
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
	/(F|S)(.{39})(B|U|D|P|A)/ {
		s/(U|D|P|A)SF/\1SB/g	
		s/BF/FB/g
		s/BS/SB/g
	}
	b check 
# Counterclockwise
:rotate1
	g
	/S.{41}F/ {
		s/(S)(.)(B)(.{39})(F)/\1\2\5\4\3/
		b check
	}
	s/(S)(.{40})(F)(B)/\1\2\4\3/
	s/(S)(.{39})(F)(B)/\1\2\4\3/
	s/(S)(.{38})(F)(B)/\1\2\4\3/
	s/(S)(.{37})(F)(B)/\1\2\4\3/
	s/(F)(.)(S)(.{37})(B)/\5\2\3\4\1/
	s/(F)(.{39})(B)(.)(S)/\3\2\1\4\5/
	s/(B)(F)(.{40})(S)/\2\1\3\4/
	s/(B)(F)(.{39})(S)/\2\1\3\4/
	s/(B)(F)(.{38})(S)/\2\1\3\4/
	s/(B)(F)(.{37})(S)/\2\1\3\4/
	s/(B)(.{37})(S)(.)(F)/\5\2\3\4\1/g

	b check
# Clockwise
:rotate-1
	g
	/F.{37}S/ {
		s/(F)(.{37})(S)(.)(B)/\5\2\3\4\1/
		b check
	}
	s/(F)(B)(.{37})(S)/\2\1\3\4/
	s/(F)(B)(.{38})(S)/\2\1\3\4/
	s/(F)(B)(.{39})(S)/\2\1\3\4/
	s/(F)(B)(.{40})(S)/\2\1\3\4/
	s/(B)(.{39})(F)(.)(S)/\3\2\1\4\5/
	s/(B)(.)(S)(.{37})(F)/\5\2\3\4\1/
	s/(S)(.{37})(B)(F)/\1\2\4\3/
	s/(S)(.{38})(B)(F)/\1\2\4\3/
	s/(S)(.{39})(B)(F)/\1\2\4\3/
	s/(S)(.{40})(B)(F)/\1\2\4\3/
	s/(S)(.)(F)(.{39})(B)/\1\2\5\4\3/
	b check
# Physics
:down
	g
	# Free fall
	/S(.{39})F(.{39})B/ {
		s/F(.{39})B/B\1F/
		s/S(.{39})B/B\1S/
		b velocity
	}
	/F(.{39})(U|D|P|A)|S(.{39})(U|D|P|A)/ !{
		s/S(.{39})B/B\1S/
		s/F(.{39})B/B\1F/
	}
	:velocity
	# Velocity
	/[1-9]s/ {
		s/(.)s/\1s\1/
		/(F|S)(.{39})(U|D|P|A)/ {
			s/1s/0s/
			s/2s/1s/
			s/3s/2s/
			s/4s/3s/
		}
		b right
	}
	# Back wheel on the road
	/S.{39}(U|D|P|A)/ {
		/F.{39}(U|D|P|A)/ !{ 
			/F.{35,38}S/b rotate-1
			/F.{39,41}S/b rotate1
			/F.S/b rotate1
			/S.F/b rotate-1
			/S.{37,38}F/b rotate1
			/S.{39,41}F/b rotate-1
		}
	}
	# Front wheel on the road
	/F.{39}(U|D|P|A)/ {
		/S.{39}(U|D|P|A)/ !{
			/F.{37,38}S/b rotate1
			/F.{39,40}S/b rotate-1
			/F.S/b rotate-1
			/S.F/b rotate1
			/S.{37,38}F/b rotate-1
			/S.{39,41}F/b rotate1
		}
	}
	b check 
:check
# One wheel check
/(S|F)(.*)(F|S)/ ! b die 

# Check wheels position
/S.{39}(U|D|P|A)/ {
	/F.{39}(U|D|P|A)/ {
		# Wheels on the road, check upside down driving
		/S.{35,39}F/ b die
		/F.{39,41}S/ b die
		/F.S/ b die
	}
}

# Wall check
/S.{39}F/ {
	/S(U|D|P|A)/ {
		/F(U|D|P|A)/ b die
	}
}
/F.{39}S/ {
	/(U|D|P|A)S/ {
		/(U|D|P|A)F/ b die
	}
}

# Bike crash check
/(S|F).{0,1}(S|F)/ b end
/(S|F).{37,41}(S|F)/ b end

:die
/died$/ !{
	s/$/died/
}
b end
:end
# save changes to hold buffer and process post-effects
h
# Disable post-effects
# b test
# Remove speed
s/[0-9]s//
# Remove zone
s/[0-9]*z//g
# Road █ ▞
# Hide screen buffer
s/(.{14})([0-9])/|/g
s/A/[107;38;5;82m█[0m/g
s/D/[107;38;5;82m▚[0m/g
s/P/[107;38;5;82m▀[0m/g
s/U/[107;38;5;82m▞[0m/g
# Wheels
s/S/[107;38;5;0m◉[0m/g
s/F/[107;38;5;0m○[0m/g
# Background
s/B/[107m [0m/g
# Finish
s/Q/[107;38;5;33m▶[0m/g
s/q/[107;38;5;33m▏[0m/g
:test
i\
[H
/died$/ {
	s/died$/You're dead!\n/
	p;q
}
/win$/ {
	s/win$/Congratulations!/
	p;q
}
p
