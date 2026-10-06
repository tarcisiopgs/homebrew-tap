# Homebrew tap

Formulae for [devsweep](https://github.com/tarcisiopgs/devsweep), on macOS and Linux.

```sh
brew install tarcisiopgs/tap/devsweep
```

The formula installs the binary each devsweep release ships (Apple silicon
and Intel on macOS, arm64 and x64 on Linux). `brew upgrade` brings the next
version.

`scripts/update.sh` rewrites the formula for the latest release. The
`Update formula` workflow runs it a few times a day, installs and tests the
result, and commits it.
