maintainer="aou <anonymous.online.user@protonmail.com>"

name="yuzu-mainline-bin-git"
pkgname="yuzu-mainline-bin"
pkgdir="/usr/src/pacstall/${name}"
description="Yuzu Switch Emu (bin release)"
url="https://github.com/tooelitepete/yuzu.pacscript/releases/download/1.0/yuzu-mainline-bin.zip"
##url="https://github.com/tooelitepete/yuzu.pacscript.git"##
build_depends="qt5-base opus hicolor-icon-theme"
breaks="${pkgname}"
gives="yuzu.desktop yuzu.svg"

prepare() {
  true
}

build() {
  true
}

install() {

  # Install binary
  sudo install -Dm755 "yuzu-mainline-bin.zip" "${pkgdir}/usr/bin/${pkgname}"

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
  
  }
# vim:set ft=sh ts=2 sw=2 et:
