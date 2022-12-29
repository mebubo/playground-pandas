{
  description = "Play with pandas";

  inputs = {
    nixpkgs.url = "github:mebubo/nixpkgs/nixos-unstable-with-updates";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    devShells.x86_64-linux.default = import ./shell.nix { pkgs = nixpkgs.legacyPackages.x86_64-linux; };

  };
}
