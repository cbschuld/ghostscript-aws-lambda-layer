TARGET_DIR=/build/

## dev tool istallation
init:

## GHOSTSCRIPT (https://www.ghostscript.com/)
## 10.01.1 - https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10011/ghostscript-10.01.1.tar.gz
## 10.0.0 - https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs1000/ghostscript-10.0.0.tar.gz
## 9.55.0 - https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9550/ghostscript-9.55.0.tar.gz
## -------------------------------------------------------------------------------------------------------
GHOSTSCRIPT_VERSION=10.01.1
GHOSTSCRIPT_VERSION_DIR=gs$(subst .,,$(GHOSTSCRIPT_VERSION))
GHOSTSCRIPT_SRC_FILE=ghostscript-${GHOSTSCRIPT_VERSION}.tar.gz
GHOSTSCRIPT_SRC_DIR=$(subst .tar.gz,,$(GHOSTSCRIPT_SRC_FILE))

$(GHOSTSCRIPT_SRC_FILE):
	curl -OL https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/${GHOSTSCRIPT_VERSION_DIR}/${GHOSTSCRIPT_SRC_FILE}

gs $(TARGET_DIR)bin/gs: $(GHOSTSCRIPT_SRC_FILE)
	tar -zxf $<
	cd ${GHOSTSCRIPT_SRC_DIR}
	./configure \
		--without-luratech \
		--prefix=$(TARGET_DIR)
	make all
	make install

all: $(TARGET_DIR)bin/gs
