# Build Emacs recipe
# Usage: make -f emacs.mk [EMACS_VERSION=emacs-25.1] [PREFIX=/usr/local]

PREFIX:=${HOME}/opt

EMACS_VERSION=emacs-24.4
EMACS_ARCHIVE=${EMACS_VERSION}.tar.xz
EMACS_ARCHIVE_URL=http://ftpmirror.gnu.org/emacs/${EMACS_ARCHIVE}

default: build install

${EMACS_ARCHIVE}:
	curl -L -O ${EMACS_ARCHIVE_URL}

build: ${EMACS_ARCHIVE}
	tar xf ${EMACS_ARCHIVE}
	cd ${EMACS_VERSION} && ./configure --without-all --without-x --prefix=${PREFIX}
	cd ${EMACS_VERSION} && make -j9

install:
	cd ${EMACS_VERSION} && make install-strip

.PHONY: build install
