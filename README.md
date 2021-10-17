
# shclrz - shell colorizer

shclrz (as in **SH**ell **C**o**L**o**R**i**Z**er) is a simple shell script with
the goal to simplify creating colorful output in the shell.
You can pipe text into it or generate ANSI escape sequences through a menu.

## Usage

```
shclrz [OPTIONS]
```

| option           | alternative     | function                 |
|------------------|-----------------|--------------------------|
| `-h`             | `--help`        | Print help               |
| `-v`             | `--version`     | Print program version    |
| `-g`             | `--generate`    | Generate ANSI sequence   |
| `-s SOURCE_FILE` | `--source-file` | read from file           |
| `-f COLOR`       | `--foreground`  | specify foreground color |
| `-b COLOR`       | `--background`  | specify background color |

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

### Uninstallation

On Arch-based distros: `sudo pacman -R shclrz-git`

On other distros: go to place where you cloned the git repo to and
`sudo make uninstall`

## How do I pronounce shclrz?

Finally we have a program that is more difficult to pronounce as
[sxhkd](https://github.com/baskerville/sxhkd)! However just say "shell
colorizer", that's easier...

## TODOs

 - [ ] 256-color support

