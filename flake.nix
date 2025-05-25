{
  description = "Aerospace window manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, ... }: {
    darwinModules.desktop = { pkgs, ... }: {
      imports = [ ./default.nix ];
    };

    darwinConfigurations.aerospace = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ self.darwinModules.aerospace ];
    };
  };
}
