##
# Simple toplevel Makefile to build rcswitch package
#
# Stefan Wendler, sw@kaltpost.de
# Pascal Bach, pascal.bach@nextrem.ch
##

all: build

build:
	make -C module

modules_install: build
	make -C module modules_install

clean:
	make -C module clean
	rm -rf deploy

deploy: build
	mkdir -p deploy/opt/rcswitch/modules
	cp module/rcswitch.ko deploy/opt/rcswitch/modules/
	(cd deploy && tar -zcvf rcswitch-kmod.tgz opt/)