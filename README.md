# pman0214/h8300-elf-gcc-alpine

> H8/300 GCC on Alpine

[![Docker Build](https://img.shields.io/docker/cloud/automated/pman0214/h8300-elf-gcc-alpine.svg)](https://hub.docker.com/r/pman0214/h8300-elf-gcc-alpine/)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Content](#content)
- [License](#license)

## Install

```bash
docker pull pman0214/h8300-elf-gcc-alpine
```

## Usage

Default WORKDIR is ``/app``.

```bash
$ docker run --rm -it -v $PWD:/app pman0214/alpine-texlive-ja-epspdf 'gcc -o test test.c'

```

## Content

This docker image is based on [frolvlad/alpine-gxx](https://hub.docker.com/r/frolvlad/alpine-gxx).
The image contains:

* gcc 5.5.0
* binutils 2.30
* newlib 2.5.0.20171222
* [kz_h8write](https://osdn.net/projects/kz-h8write/) 0.2.1

## License

This Docker image is released under the BSD 3-clause license.
See ``License.txt``.

* Copyright (c) 2020 Shigemi ISHIDA
