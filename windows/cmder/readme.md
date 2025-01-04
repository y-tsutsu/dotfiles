# How to create patch files

```console
$ cd /path/to/cmder
$ git diff > cmder.patch
```

# How to use patch files

```console
$ cd /path/to/cmder
$ patch -p1 < .\cmder.patch
```
