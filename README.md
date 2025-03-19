# frida-musl

## Goals
This repo is an exercise in building modern Frida to run on the earliest release of OpenWRT 
More specifically, our goals are to provide
- Custom GCC compiler with musl libc for our RPi 1 target running OpenWRT.
- Semi-complete, custom, mini-rootfs with latest Frida 16.6.6 and Python 13 bindings.
- Since we know that /root is the home directory, we choose /root/pack as the target installation directory.
- All libraries and tools should have RPATH pointing to /root/pack/lib.
- All executables should use the native c runtime in /lib/libc.so.
- Everything should be built with one make invocation.

## Toolchain
As we have elaborated on earlier, we have the following requirements for the toolchain
- ARMv6. It should generate code for the ARMv6 architecture, or more specifically ARMv6kz, optionally tuned for ARM1176JZF-S.
- musl. The libc should be the version used by the target OpenWRT version, which is v1.1.16. It is worth pointing out that the 1.2.x and 1.1.x series are binary incompatible
- Latest GCC. We want to use a new GCC release, otherwise we might not be successful building the latest version of Frida and its dependencies. 
This toolchain is one-of-a-kind; combining the latest GCC with quite an old musl libc, which targets a vintage 32-bit ARM architecture.

## TLDR; type 'make' a couple of times
- 'cross' folder; the toolchain configuration and makefile
- Top-level Makefile; recursive makefile to build all Frida components.

```
$ cd frida-musl/cross && make && make install
```
Set your $PATH to the toolchain
```
$ cd frida-musl && make && make install
```

## More documentation
More details are provided in the blog artcle found here: https://zetier.com/blog/