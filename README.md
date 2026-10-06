# Homebrew tap

Formulae for [devsweep](https://github.com/tarcisiopgs/devsweep) and
[otto](https://github.com/tarcisiopgs/otto), on macOS and Linux.

```sh
brew install tarcisiopgs/tap/devsweep
brew install tarcisiopgs/tap/otto
```

Each formula installs the binary its project's release ships (Apple silicon
and Intel on macOS, arm64 and x64 on Linux). `brew upgrade` brings the next
version.

`scripts/update.sh <name>` rewrites a formula for the latest release of its
project. The `Update formula` workflow runs it for every formula a few times
a day, installs and tests what changed, and commits it.
