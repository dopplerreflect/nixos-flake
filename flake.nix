{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hosts.url = "github:StevenBlack/hosts";
  };

  outputs = { self, nixpkgs, hosts }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            hosts.nixosModule {
              networking.stevenBlackHosts.enable = true;
            }
          ];
        };
      };
    };
}
    
