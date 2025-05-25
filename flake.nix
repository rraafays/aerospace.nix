{
  description = "Aerospace window manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, ... }: {
    darwinModules.desktop = { pkgs, ... }: {
      imports = [ ./desktop.nix ];
    };

    darwinConfigurations.aerospace = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ self.darwinModules.aerospace ];
    };
  };
}
