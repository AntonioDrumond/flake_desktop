{
  description = "NixOS System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    # unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # nixvim.url = "github:AntonioDrumond/nixvim";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, nvf, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          # Import configuration.nix file
          ./configuration.nix
          # NVF module and config file
          nvf.nixosModules.default
          ./nvf.nix
        ];
      };
    };
}
