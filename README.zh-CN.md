# wheels

为 **Muthur Command OS** 栈镜像（Alpine / musl）构建带 **musllinux** 标签的 Python wheel。供 CI 与组合式 **`action.yml`** 入口使用。

<https://peps.python.org/pep-0656/>

## 平台标签

编译相关工具：

- build-base
- cmake
- git
- linux-headers
- autoconf
- automake
- cargo

### Python 3.13 / musllinux_1_2

基于 Alpine 3.22 构建  
镜像：`ghcr.io/muthur-command/wheels/ARCH/musllinux_1_2/cp313:VERSION`

系统构建版本：

- GCC 14.2.0
- Cython 3.2.2
- numpy 2.3.3
- scikit-build 0.18.1
- cffi 2.0.0

### Python 3.14 / musllinux_1_2

基于 Alpine 3.22 构建  
镜像：`ghcr.io/muthur-command/wheels/ARCH/musllinux_1_2/cp314:VERSION`

系统构建版本：

- GCC 14.2.0
- Cython 3.2.2
- numpy 2.3.3
- scikit-build 0.18.1
- cffi 2.0.0

## 其他

```sh
$ python3 -m builder \
    --index https://wheels.muthur-command.com \
    --requirement requirements_all.txt \
    --upload rsync \
    --remote user@server:/wheels
```

## 支持的文件传输

- rsync

## 索引目录的文件夹结构

`/musllinux/*`

## 来源说明

- **上游：** [home-assistant/wheels](https://github.com/home-assistant/wheels) — Home Assistant 的 musl wheels 构建工具，本仓库由此移植而来。
- **本仓库：** **Muthur Command** 维护此 fork，用于 **Muthur Command OS** 的 CI 与 wheel 索引；行为可能随时间上与上游产生差异。
- **许可：** 自上游继承的代码仍为 **Apache-2.0**；详见 [`LICENSE`](./LICENSE) 与 [`NOTICE`](./NOTICE)。
