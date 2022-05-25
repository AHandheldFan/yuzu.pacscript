maintainer="aou <anonymous.online.user@protonmail.com>"

name="yuzu-mainline-bin-git"
pkgname="yuzu-mainline-bin"
pkgdir="/usr/src/pacstall/${name}"
description="Yuzu Switch Emu (bin release)"
url="https://github.com/tooelitepete/yuzu.pacscript/releases/download/1.0/yuzu-mainline-bin.tar.gz"
##url="https://github.com/tooelitepete/yuzu.pacscript.git"##
build_depends="qt5-base opus hicolor-icon-theme"
breaks="${pkgname}"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  # Build nessesary files
  make -j"$(nproc)"
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE-CLIENT" "LICENSE-LIB" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install bemenu-git
  sudo make install DESTDIR="${pkgdir}"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
