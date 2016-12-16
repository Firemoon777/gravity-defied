# Gravity defied written on sed
Gravity defied clone written on GNU sed with only one (but hardcore) level.  
It's not perfect, but you can give it a try  
[Click here to watch demo video](https://asciinema.org/a/ddfusaite83m32k8vblg10iil)

## How to play

### Requirements

- GNU sed
- sleep with floating point time / usleep

### Installation
```
git clone https://github.com/Firemoon777/gravity-defied.git
cd gravity-defied
```
### Running
```
./play.sh
```
### Gameplay

- ```w``` or ```8``` -- move forward
- ```s``` or ```2``` -- move backward
- ```a``` or ```4``` -- rotate counterclockwise
- ```d``` or ```6``` -- rotate clockwise
- ```r``` -- restart game
- ```q``` -- quit game

## Known issues
- Sometimes bike doesn't fall on rotating
- No fast restart
Possible solution:
```
while true; do ./play.sh ; done
```
- Incorrect colors
