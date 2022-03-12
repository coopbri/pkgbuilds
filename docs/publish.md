# Publishing an AUR Package

The update version script (`scripts/update-version.sh`) can be used to automatically apply a new version to an AUR package's `PKGBUILD`, as long as that package is present in this repository. For example, to upgrade `my-package` to version `2.0.0`:

```sh
./scripts/update-version.sh my-package 2.0.0
```

After this is done, manually commit:

```sh
git commit -m "my-package: upgrade to 2.0.0"
```

The rest of the process (e.g. `.SRCINFO` generation, publishing to AUR) is handled by the [`aurpublish` binary](https://man.archlinux.org/man/aurpublish), with the following usage:

`aurpublish my-package`

After this point, you can go outside and get some fresh air. ☀️