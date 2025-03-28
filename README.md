# Devshell-Rust

A nix flake based development environment for the Rust programming language with `rust-toolchain` and `cargo` support.

## How to use

This devshell is intended to be pulled into your project as a git submodule. The idea is to manage changes in a separate and centralized repository. If different versions need to be maintained then those should be stored on separate branches.

To use `devshell-rust` and assuming you are using `nix-direnv`:

1. Add is as a git submodule `git submodule add https://github.com/99linesofcode/devshell-rust ./devshell`
1. Define a `.envrc` in your project root folder `echo use flake ./devshell >> .envrc`
3. Run `direnv allow`

## Contributing

Please review our [Contribution Guidelines](https://github.com/99linesofcode/.github/blob/main/.github/CONTRIBUTING.md).

## Code of Conduct

In order to ensure that the community is welcoming to all, please review and abide by the [Code of Conduct](https://github.com/99linesofcode/.github?tab=coc-ov-file).

## Security Vulnerabilities

Please review [our security policy](https://github.com/99linesofcode/.github?tab=security-ov-file) on how to report security vulnerabilities.

## License

This software is open source and licensed under the [MIT license](https://github.com/99linesofcode/.github?tab=MIT-1-ov-file)
