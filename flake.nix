{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # hosts.url = "github:StevenBlack/hosts";
  };

  outputs = inputs@{ 
    nixpkgs, 
    # hosts, 
    home-manager,
     ... 
     }: 
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
            # hosts.nixosModule {
            #   networking.stevenBlackHosts.enable = true;
            # }
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.doppler = import ./home.nix;
            }
          ];
        };
      };
    };
}
    
