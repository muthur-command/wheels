# MCOS musl wheels builder

Builds **musllinux**-tagged wheels for **MCOS** stack images (Alpine/musl).  
Upstream lineage: Home Assistant wheels builder (Apache-2.0); see **NOTICE**.

https://peps.python.org/pep-0656/

## Platform tags

Compile utilities:

- build-base
- cmake
- git
- linux-headers
- autoconf
- automake
- cargo

### Python 3.13 / musllinux_1_2

Build with Alpine 3.22
Images: ghcr.io/muthur-command/wheels/ARCH/musllinux_1_2/cp313:VERSION

Version of system builds:

- GCC 14.2.0
- Cython 3.2.2
- numpy 2.3.3
- scikit-build 0.18.1
- cffi 2.0.0

### Python 3.14 / musllinux_1_2

Build with Alpine 3.22
Images: ghcr.io/muthur-command/wheels/ARCH/musllinux_1_2/cp314:VERSION

Version of system builds:

- GCC 14.2.0
- Cython 3.2.2
- numpy 2.3.3
- scikit-build 0.18.1
- cffi 2.0.0

## Misc

```sh

$ python3 -m builder \
    --index https://wheels.muthur-command.com \
    --requirement requirements_all.txt \
    --upload rsync \
    --remote user@server:/wheels
```

## Supported file transfer

- rsync

## Folder structure of index folder:

`/musllinux/*`
