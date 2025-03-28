{
  description = "Development environment configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      forEachSystem = f: nixpkgs.lib.genAttrs systems f;
    in
    {
      formatter = forEachSystem (s: nixpkgs.legacyPackages.${s}.nixfmt-rfc-style);

      devShells = forEachSystem (
        s:
        with nixpkgs.legacyPackages.${s};
        let
          overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
        in
        {
          default = mkShell {
            strictDeps = true;

            nativeBuildInputs = [
              rustup
              rustPlatform.bindgenHook
            ];

            buildInputs = [
              gcc
              pkg-config
              cargo
              openssl
              sqlite
            ];

            packages = [
              markdownlint-cli2
              rustfmt
              rust-analyzer
              vale
              valeStyles.alex
              valeStyles.google
              valeStyles.proselint
            ];

            RUSTC_VERSION = overrides.toolchain.channel;

            # https://github.com/rust-lang/rust-bindgen#environment-variables
            shellHook = ''
              export PATH="''${CARGO_HOME: -~/.cargo}/bin":"$PATH"
              export PATH="''${RUSTUP_HOME: -~/.rustup}/toolchains/$RUSTC_VERSION-${stdenv.hostPlatform.rust.rustcTarget}/bin":"$PATH"
            '';
          };
        }
      );
    };
}
