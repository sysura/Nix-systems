{
  description = "Multi System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      # Standard pkgs instance
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # Automatically find hosts in the ./hosts directory
      hosts = builtins.filter (x: x != null) (
        lib.mapAttrsToList (name: value: if (value == "directory") then name else null) (
          builtins.readDir ./hosts
        )
      );
    in
    {
      nixosConfigurations = lib.genAttrs hosts (host: lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          # Set hostname based on folder name
          { networking.hostName = host; }

          # Machine-specific config
          (./hosts + "/${host}")

          # Shared modules
          ./modules/system
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops

          # Home Manager core setup
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      });

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [ go gopls go-tools delve ];
        shellHook = ''echo "Go development environment loaded"'';
      };
    };
}
