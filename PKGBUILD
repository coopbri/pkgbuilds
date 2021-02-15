# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Westofer Raymond <westoferraymond@gmail.com>
pkgname=athens-git
_pkgname=athens
pkgver=v1.0.0.beta.38.r8.ge073e5cc9
pkgrel=1
pkgdesc="Athens is an open-source and local-first alternative to Roam Research. Athens lets you take notes... Master branch "
arch=('i686' 'x86_64')
url="https://github.com/athensresearch/athens"
license=('Eclipse Public License - v 1.0') #TODO
groups=()
depends=("electron")
makedepends=("git" "nodejs" "leiningen" "yarn" "jq")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#replaces=()
#backup=()
#options=()
install=
source=('athens::git+https://github.com/athensresearch/athens')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${_pkgname}"
    # electron builder enforces email and homepage!
    jq '.author|={"name":"athensresearch" , "email":"athensresearch@gmail.com"}' package.json  > tmp.json && mv tmp.json package.json
    jq '.homepage="https://github.com/athensresearch/athens"' package.json > tmp.json && mv tmp.json package.json
    yarn upgrade electron@"$(</usr/lib/electron/version)"
}

build() {
    cd "$srcdir/${_pkgname}"
    local i686=ia32 x86_64=x64

    yarn --cache-folder "${srcdir}/yarn-cache"
    lein compile 

    yarn --cache-folder "${srcdir}/yarn-cache" run \
        electron-builder --linux --"${!CARCH}" --dir \
        -c.electronDist=/usr/lib/electron \
        -c.electronVersion="$(</usr/lib/electron/version)"

}

#check() {
#cd "$srcdir/${_pkgname}"
#make -k check
#}

package() {
    #desktop file
    cd "$startdir"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"

    cd "$srcdir/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 "build/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

}

