{
  description = "Rethil's NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs :
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
  in
  {
    nixosConfigurations = {
      vm = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system nixpkgs; };

        modules = [
          ./hosts/vm/configuration.nix

          ./modules/base/packages.nix

          ./modules/extra/sddm.nix
          ./modules/extra/hyprland.nix
        ];
      };
    };
  };
}
