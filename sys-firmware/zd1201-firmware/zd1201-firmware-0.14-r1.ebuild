# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_P="zd1201-${PV}-fw"

DESCRIPTION="Firmware for ZyDAS 1201 based USB 802.11b Network WiFi devices"
HOMEPAGE="http://linux-lc100020.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/linux-lc100020/${MY_P}.tar.gz"

LICENSE="|| ( GPL-3 MPL-1.1 )"
SLOT="0"
KEYWORDS="amd64 ppc64 x86"

S="${WORKDIR}"/${MY_P}

src_compile() {
	:
}

src_install() {
	insinto /lib/firmware
	doins zd1201{,-ap}.fw
	dodoc README
}
