# GitHub Reusable Workflows
- [![Lazarus Main Workflow](https://github.com/gcarreno/re-usable-workflows/actions/workflows/main.lazarus.yml/badge.svg?branch=main)](https://github.com/gcarreno/re-usable-workflows/actions)
- [![C++ Main Workflow](https://github.com/gcarreno/re-usable-workflows/actions/workflows/main.cpp.yml/badge.svg?branch=main)](https://github.com/gcarreno/re-usable-workflows/actions)

[![Supports Windows](https://img.shields.io/badge/support-Windows-blue?logo=Windows)](https://github.com/gcarreno/re-usable-workflows/releases/latest)
[![Supprts Linux](https://img.shields.io/badge/support-Linux-yellow?logo=Linux)](https://github.com/gcarreno/re-usable-workflows/releases/latest)
[![License](https://img.shields.io/github/license/gcarreno/re-usable-workflows)](https://github.com/gcarreno/re-usable-workflows/blob/master/LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/gcarreno/re-usable-workflows?label=latest%20release)](https://github.com/gcarreno/re-usable-workflows/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/gcarreno/re-usable-workflows/total)](https://github.com/gcarreno/re-usable-workflows/releases)

Collection of GitHub reusable workflows for a variety of languages

# Warning

I have not yet implemented sane defaults and error detection.
I've also made a hard coded dependency on [git-cliff](https://git-cliff.org/) to produce the release notes.
The next phase will be to get all this corrected and/or made optional, somehow.

# Languages

## Object Pascal: Lazarus

- [main](.github/workflows/main.lazarus.yml)
  This is the one you should copy to your Lazarus repository, and customise, because it calls the ones bellow
- [build](.github/workflows/build.lazarus.yml)
  This one takes care of compiling the app itself and uploading the compiled binaries as an artefact. It's called remotely from the main one above
- [test](.github/workflows/test.lazarus.yml)
  This one takes care of compiling the test app and running it. It's called remotely from the main one above
- [release](.github/workflows/release.lazarus.yml)
  This one takes care of downloading the artefacts and then creating a release with archived binaries. It's called remotely from the main one above

### The `JSON` config string

Example:

```json
{
  "app-name": "helloworld",
  "lpi-path": "lazarus/src",
  "bin-path": "lazarus/bin",
  "build-mode": "Release",
  "lazarus-packages": "",
  "matrix": {
    "os": [
      "ubuntu-latest",
      "windows-latest",
      "macos-latest"
    ],
    "include":[
      {
        "os": "ubuntu-latest",
        "triplet": "x86_64-linux"
      },
      {
        "os": "windows-latest",
        "triplet": "x86_64-win64"
      },
      {
        "os": "macos-latest",
        "triplet": "x86_64-darwin"
      }
    ],
    "lazarus-versions": [
      "stable",
      "2.0.12"
    ]
  }
}
```

#### `app-name`

The application name.

This field is used to find the `.lpi` file one the [`lpi-path`](#lpi-path) folder and also the binary on [`bin-path`](#bin-path).

#### `lpi-path`

The path where the `.lpi` file resides.

Example value: "src"

#### `bin-path`

The path where the compiled binary can be found.

Example value: "bin"

#### `build-mode`

The name of one of the build modes you've defined on your `.lpi` file.

Example values: "Default", "Release", "Debug"

#### `matrix`

A `JSON` representation of the matrix to allow parallel compiling for various platforms and Lazarus versions.

**NOTE**: Needs more explanation
