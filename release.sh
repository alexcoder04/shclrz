#!/bin/sh

# we dont want to proceed if something fails
set -e

REPO="https://github.com/alexcoder04/shclrz"

# check for unstaged changes
echo "Checking for unstaged changes..."
if [ ! -z "$(git status -s)" ]; then
  echo "You have unstaged changes, please commit them first"
  exit 1
fi

# get current version
echo "Finding current version..."
VERSION="$(grep -E '^_shclrz_version=.*$' ./shclrz | cut -d "=" -f2 | tr -d '"' )"
TAG_NAME="v$VERSION"

release_default(){
  echo "Creating default release"

  # check if this version already exists
  echo "Checking if $TAG_NAME already exists..."
  if git tag | grep -qE "^$TAG_NAME\$"; then
    echo "The tag $TAG_NAME already exists, please increase the version"
    exit 1
  fi

  # create new tag
  echo "Tagging..."
  git tag "$TAG_NAME"

  # push everything, pushing the tags will trigger release generation on github
  echo "Pushing..."
  git push
  git push --tags
}

release_arch(){
  # check if we are on arch
  if ! command -v makepkg >/dev/null; then
    echo "You are not on Arch, not updating PKGBUILD"
    exit 1
  fi

  echo "Creating Arch Linux release"

  echo "Checking if already the latest version..."
  VERSION_ARCH="$(grep -E '^pkgver=.*$' ".aur/PKGBUILD" | cut -d "=" -f2)"
  if [ "$VERSION_ARCH" = "$VERSION" ]; then
    echo "PKGBUILD already latest version"
    exit 1
  fi

  # download the .tar.gz for the tag from github and calculate the ms5sum
  echo "Calculating the md5sum..."
  cd "${TMPDIR:-/tmp}"
  wget -O "$TAG_NAME.tar.gz" "$REPO/archive/refs/tags/$TAG_NAME.tar.gz" || exit 1
  MD5SUM="$(md5sum "$TAG_NAME.tar.gz" | cut -d " " -f1)"
  cd "$OLDPWD"

  # change package version and md5sum for the PKGBUILD
  echo "Updating PKGBUILD..."
  sed -i "s/^pkgver=.*\$/pkgver=$VERSION/" ".aur/PKGBUILD"
  sed -i "s/^md5sums=('.*')\$/md5sums=('$MD5SUM')/" ".aur/PKGBUILD"

  # generate .SRCINFO
  cd ".aur"
  echo "Generating .SRCINFO"
  makepkg --printsrcinfo >.SRCINFO

  # push to AUR
  echo "Committing changes in the AUR package..."
  git add PKGBUILD .SRCINFO
  git commit -S -m "update to $TAG_NAME"
  echo "Pushing changes to the AUR..."
  git push
}

case "$1" in
  default) release_default ;;
  arch) release_arch ;;
  *)
    release_default
    # wait a little, so we are sure that the tag is on github
    sleep 5
    release_arch
    ;;
esac
