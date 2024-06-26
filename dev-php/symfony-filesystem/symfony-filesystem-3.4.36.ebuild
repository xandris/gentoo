# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Symfony Filesystem Component"
HOMEPAGE="https://github.com/symfony/filesystem"
SRC_URI="https://github.com/symfony/filesystem/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-lang/php:*
	dev-php/fedora-autoloader"
DEPEND="test? ( ${RDEPEND} <dev-php/phpunit-6 )"

S="${WORKDIR}/filesystem-${PV}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}/autoload.php" "${S}/autoload-test.php" || die
	fi
}

src_install() {
	insinto "/usr/share/php/Symfony/Component/Filesystem"
	doins -r Exception
	doins *.php "${FILESDIR}/autoload.php"
	dodoc CHANGELOG.md README.md
}

src_test() {
	phpunit --bootstrap "${S}/autoload-test.php" \
		--exclude-group network || die 'test suite failed'
}
