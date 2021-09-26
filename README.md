
# shclrz - shell colorizer

shclrz (as in **SH**ell **C**o**L**o**R**i**Z**e) is a simple shell script with
the goal to simplify creating colorful output in the shell.

## Usage

```
shclrz [OPTIONS] [COLOR]
```

| option | alternative                         | function                 |
|--------|-------------------------------------|--------------------------|
| -h     | --help, help                        | Print help               |
| -v     | --version, version                  | Print program version    |
| -g     | --generate, generate                | Generate ANSI sequence   |
| -f     | --foreground, f, foreground [COLOR] | specify foreground color |
| -b     | --background, b, background [COLOR] | specify background color |

### Examples:

```
shclrz -g
```

Opens an interactive menu to select the background/foreground color and enter
the text. Returns a string which contains the ANSI color sequence for chosen
color and text.

```
shclrz -f red <file.txt
```

Outputs the content of file.txt with red foreground.

```
ls | shclrz -b blue
```

Colors the output of ls with blue background.

### Note:

You cannot use foreground and background at the same time.

`-f` and `-b` options read the text from stdin; `-g` option provides an
interactive menu.

### List of colors:

`black` `blue` `red` `magenta` `green` `cyan` `yellow` `white`

## Installation

### Arch and Arch-based distros

```
wget https://raw.githubusercontent.com/alexcoder04/shclrz/main/PKGBUILD
makepkg -cf
sudo pacman -U shclrz-git-*.pkg.tar.zst
```

### Debian-based distros (Debian, Ubuntu, Linux Mint, ...)

```
sudo apt update && sudo apt install make git dialog
git clone https://github.com/alexcoder04/shclrz.git
cd shclrz
sudo make install
```

### **Un**installation

On Arch-based distros: `sudo pacman -R shclrz-git`

On other distros: go to place where you cloned the git repo to and
`sudo make uninstall`

## TODOs

 - [X] read stdin and output colorized version to stdout
 - [X] a menu with choosing a color, that outputs the appropriate ANSI sequence
 - [X] Makefile and PKGBUILD for installing
 - [X] manpage
 - [ ] 256-color support

