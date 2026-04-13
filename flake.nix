{

  description = "Main flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      ayu = lib.nixosSystem {
        inherit system;
	specialArgs = { inherit inputs; };
        modules = [ 
	  ./configuration.nix
	  inputs.stylix.nixosModules.stylix
	];
      };
    };

    homeConfigurations = {
      mx = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	#specialArgs = { inherit inputs; };
	modules = [ ./home.nix ];
      };
    };
  };
}
