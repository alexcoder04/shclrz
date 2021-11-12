
# shclrz - shell colorizer

shclrz (as in **SH**ell **C**o**L**o**R**i**Z**er) is a simple shell script with
the goal to simplify creating colored output in the shell. You don't need to
remember the ANSI escape sequences anymore, you can just pipe your text into
`shclrz` and the output will be colored.

## Usage

```
shclrz [OPTIONS]
```

| option           | alternative                 | function                  |
|------------------|-----------------------------|---------------------------|
| `-h`             | `--help`                    | Print help                |
| `-v`             | `--version`                 | Print program version     |
| `-i`             | `--info`                    | Print color codes         |
| `-s SOURCE_FILE` | `--source-file SOURCE_FILE` | read from file            |
| `-f COLOR`       | `--foreground COLOR`        | specify foreground color  |
| `-b COLOR`       | `--background COLOR`        | specify background color  |
| `-F FORMATTING`  | `--formatting OPTION`       | specify formatting option |

### Examples:

```
shclrz -f red -F underline <file.txt
```

Outputs the content of file.txt underlined with red foreground.

```
ls | shclrz -b blue
```

Colors the output of ls with blue background.

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

