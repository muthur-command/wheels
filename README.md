# wheels

中文文档: [`README.zh-CN.md`](./README.zh-CN.md)

Builds **musllinux**-tagged Python wheels for **Muthur Command OS** stack images (Alpine / musl). Used by CI and the composite **`action.yml`** entrypoint.

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

## Folder structure of index folder

`/musllinux/*`

## Origin

- **Upstream:** [home-assistant/wheels](https://github.com/home-assistant/wheels) — Home Assistant musl wheels builder, from which this tree was ported.
- **In this repo:** **Muthur Command** keeps this fork for **Muthur Command OS** CI and wheel indexes; behavior may diverge from upstream over time.
- **License:** Code inherited from upstream remains **Apache-2.0**; see [`LICENSE`](./LICENSE) and [`NOTICE`](./NOTICE).
