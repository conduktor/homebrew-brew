<img src="./cdk-logo-lime.svg" width="256"> <img src="https://brew.sh/assets/img/homebrew-256x256.png" height="72">

# The Conduktor Homebrew Tap

This is a custom [Homebrew](https://brew.sh) tap for the official Conduktor software. Primarily, [Conduktor CLI](https://github.com/conduktor/ctl) and the sunsetted product, [Conduktor Desktop](https://conduktor.io/desktop).

## Get Started

Add the custom tap in a MacOS terminal session using:

```bash
brew tap conduktor/brew
```

## Install Conduktor CLI

The Conduktor CLI gives you the ability to perform some operations directly from your command line or a CI/CD pipeline.

Check the [reference documentation](https://docs.conduktor.io/guide/conduktor-in-production/automate/cli-automation#automate-with-cli).

```bash
# For the first time
$ brew install conduktor-cli

# If you already installed it
$ brew update conduktor-cli
```

## Documentation

For more information, please reference the documentation at <https://docs.conduktor.io/>

## Contact

If you're having issues with the Conduktor application, CLI, or tap please [contact us](https://www.conduktor.io/contact/).

## Deprecated Tooling

### Install Conduktor Desktop

This is our previous Conduktor Desktop product (a Desktop Kafka UI):

```
brew install conduktor
```
