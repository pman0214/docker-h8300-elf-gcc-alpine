FROM frolvlad/alpine-gxx

RUN set -x && \
	echo '### install build tools and download source files' && \
	apk update && \
	apk add --no-cache --virtual .build-tools make patch perl gawk bison flex m4 expect \
		texinfo mpc1-dev mpfr-dev gmp-dev isl-dev && \
	mkdir /src && \
	cd /src && \
	wget https://ftp.gnu.org/gnu/binutils/binutils-2.30.tar.bz2 && \
	wget ftp://ftp.gnu.org/gnu/gcc/gcc-5.5.0/gcc-5.5.0.tar.xz && \
	wget ftp://sourceware.org/pub/newlib/newlib-2.5.0.20171222.tar.gz && \
	wget "https://osdn.net/frs/redir.php?m=jaist&f=kz-h8write%2F57645%2Fkz_h8write-v0.2.1.zip" -O kz_h8write-v0.2.1.zip && \
	tar jxf binutils-2.30.tar.bz2 && \
	tar Jxf gcc-5.5.0.tar.xz && \
	tar zxf newlib-2.5.0.20171222.tar.gz && \
	unzip kz_h8write-v0.2.1.zip && \
	echo '### binutils' && \
	mkdir /src/binutils-build && \
	cd /src/binutils-build && \
	../binutils-2.30/configure --target=h8300-elf \
		--disable-multilib && \
	make && \
	make install && \
	echo '### gcc (1st build)' && \
	mkdir /src/gcc-build && \
	cd /src/gcc-build && \
	../gcc-5.5.0/configure \
		--target=h8300-elf \
		--enable-languages=c \
		--with-newlib \
		--disable-threads \
		--disable-nls && \
	make all-gcc && \
	make install-gcc && \
	echo '### newlib' && \
	mkdir /src/newlib-build && \
	cd /src/newlib-build && \
	../newlib-2.5.0.20171222/configure --target=h8300-elf \
		--disable-multilib && \
	make && \
	make install && \
	echo '### gcc (2nd build)' && \
	cd /src/gcc-build && \
	make all && \
	make install && \
	echo '### h8write' && \
	cd /src/PackageFiles/src && \
	make && \
	cp kz_h8write /usr/local/bin/ && \
	echo '### cleanup' && \
	apk del --purge .build-tools && \
	cd / && \
	rm -rf /src && \
	rm -rf /var/cache/apk && \
	mkdir /var/cache/apk

#--------------------------------------------------
WORKDIR /app
ENTRYPOINT ["/bin/sh", "-c"]
