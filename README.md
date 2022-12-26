
# shclrz - shell colorizer

**Note:**
There is a more heavy version of this project with more features written in Go.
Check it out: [alexcoder04/golored](https://github.com/alexcoder04/golored).

shclrz (as in **SH**ell **C**o**L**o**R**i**Z**er) is a simple shell script with
the goal to simplify creating colored output in the shell. You don't need to
remember the ANSI escape sequences anymore, you can just pipe your text into
`shclrz` and the output will be colored.

## Usage

### As standalone program

```
shclrz [OPTIONS]
```

| option           | alternative                 | function                  |
|------------------|-----------------------------|---------------------------|
| `-h`             | `--help`                    | print help                |
| `-v`             | `--version`                 | print program version     |
| `-i`             | `--info`                    | print color codes         |
| `-s SOURCE_FILE` | `--source-file SOURCE_FILE` | read from file            |
| `-f COLOR`       | `--foreground COLOR`        | specify foreground color  |
| `-b COLOR`       | `--background COLOR`        | specify background color  |
| `-F FORMATTING`  | `--formatting OPTION`       | specify formatting option |

#### Examples:

```
shclrz -f red -F underline <file.txt
```

Outputs the content of file.txt underlined and with red foreground.

```
ls | shclrz -b blue
```

Colors the output of ls with blue background.

#### List of colors:

`black`, `blue`, `red`, `magenta`, `green`, `cyan`, `yellow`, `white`

#### List of formatting options:

`bold`, `dim`, `italic`, `underline`

### As a shell library

You can also `source` shclrz. In that case, it will define a `colorize` function, into which you can pipe text which then will be colored.
You can control the formatting with following variables: `$SHCLRZ_FOREGOUND`, `$SHCLRZ_BACKGROUND`, `$SHCLRZ_FORMATTING`.
These variables have to be set to the number of the color/options; these numbers are available in `shclrz --info`.

Also, it defines variables for all the colors and formatting options. Example:

```sh
source shclrz

# red foreground
echo -e "${FG_RED}Hello World${RESET}" # -e flag is only necessary for Bash, not for POSIX shells
# blue background
echo -e "${BG_BLUE}Hello World${RESET}"
# bold text
echo -e "${FRM_BOLD}Hello World${RESET}"
```

#### List of variables

`FG_BLACK`, `FG_RED`, `FG_GREEN`, `FG_YELLOW`, `FG_BLUE`, `FG_MAGENTA`, `FG_CYAN`, `FG_WHITE`

`BG_BLACK`, `BG_RED`, `BG_GREEN`, `BG_YELLOW`, `BG_BLUE`, `BG_MAGENTA`, `BG_CYAN`, `BG_WHITE`

`FRM_BOLD`, `FRM_DIM`, `FRM_ITALIC`, `FRM_UNDERLINE`

`RESET`

## Installation

### Arch and Arch-based distros

```
wget https://raw.githubusercontent.com/alexcoder04/shclrz/main/PKGBUILD
makepkg -cf
sudo pacman -U shclrz-git-*.pkg.tar.zst
```

### Debian-based distros (Debian, Ubuntu, Linux Mint, ...)

```
sudo apt update && sudo apt install make git
git clone https://github.com/alexcoder04/shclrz.git
cd shclrz
sudo make install
```

### Other distros

1. Install `git` and `make`
2. `git clone https://github.com/alexcoder04/shclrz.git`
3. `cd shclrz`
4. `sudo make install`

### Uninstallation

On Arch-based distros: `sudo pacman -R shclrz-git`

On other distros: go to place where you cloned the git repo to and
`sudo make uninstall`

## How do I pronounce shclrz?

Finally we have a program that is more difficult to pronounce as
[sxhkd](https://github.com/baskerville/sxhkd)! However just say "shell
colorizer", that's easier...
