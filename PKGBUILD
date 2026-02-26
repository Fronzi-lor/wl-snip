# Maintainer: Fronzi marcelkowalski103@gmail.com
pkgname=wl-snip
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal Wayland screenshot tool using grim and slurp"
arch=('x86_64')
url="https://github.com/Fronzi-lor/wl-snip"
license=('MIT')
depends=('grim' 'slurp' 'wl-clipboard' 'libnotify')
source=("wl-snip" "config.example")
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 wl-snip "$pkgdir/usr/bin/wl-snip"
    
    install -Dm644 config.example "$pkgdir/usr/share/doc/wl-snip/config.example"
}
