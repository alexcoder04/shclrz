# Maintainer: alexcoder04 <https://github.com/alexcoder04>
pkgname=shclrz-git
_pkgname=shclrz
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="coloring output in the shell"
arch=('any')
url="https://github.com/alexcoder04/shclrz.git"
license=('GPL3')
groups=()
depends=(git)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
  cd "$_pkgname"
  NAME="$pkgname" DESTDIR="$pkgdir/" make install
}

