# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools qmake-utils

DESCRIPTION="QMidiRoute is a filter/router for MIDI events"
HOMEPAGE="https://alsamodular.sourceforge.net"
SRC_URI="https://downloads.sourceforge.net/alsamodular/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"

BDEPEND="
	dev-qt/linguist-tools:5
	virtual/pkgconfig
"
RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	media-libs/alsa-lib
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-drop-qtopengl.patch
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	export PATH="$(qt5_get_bindir):${PATH}"
	econf --enable-qt5
}
