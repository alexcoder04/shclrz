
# shclrz

shclrz (as in **SH**ell **C**o**L**o**R**i**Z**e) is a simple shell script with
the goal to simplify creating colorful output in the shell.

## Usage

```
shclrz [OPTIONS]
```

| option | alternative                         | function                 |
|--------|-------------------------------------|--------------------------|
| -h     | --help, help                        | Print help               |
| -v     | --version, version                  | Print program version    |
| -f     | --foreground, f, foreground [COLOR] | specify foreground color |
| -b     | --background, b, background [COLOR] | specify background color |

### Note:
  you cannot use foreground and background at the same time

### List of colors:
  black         blue
  red           magenta
  green         cyan
  yellow        white


## TODOs

 - [X] read stdin and output colorized version to stdout
 - [ ] a menu with choosing a color, that outputs the appropriate ANSI sequence
 - [ ] 256 color support

