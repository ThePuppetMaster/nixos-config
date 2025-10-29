{
  description = "Rethil's NixOS";

  # This is the standard format for flake.nix; `inputs` are the dependencies
  # of the flake. I view them as "external sources" to be pulled, build and
  # passed later to outputs.
  inputs = {
    # Official NixOS package source; using nixos's unstable branch by default.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # NixOS home-manager - used for managing user configuration.
    home-manager = {
      url = "github:nix-community/home-manager/master";

      # The `follows` is used for inheritance; `inputs.nixpkgs` is kept
      # consistent with the `inputs.nixpkgs` of the current flake, to avoid
      # problems caused by different versions of nixpkgs dependencies.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # QT6 Theme Provider for Hyprland. Compatible with KDE, replaces qt6ct.
    # https://github.com/hyprwm/hyprqt6engine
    hyprqt6engine = {
      url = "github:hyprwm/hyprqt6engine";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    stylix,
    hyprqt6engine,
    ...
  }:
  let
    # Custom libs.
    inherit (inputs.nixpkgs) lib;
    mylib = import ./lib { inherit lib; };

    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;

      # Flake has overlays so package could be "injected" as
      # pkgs.hyprqt6engine; to check for overlays in this case use:
      # `nix flake show github:hyprwm/hyprqt6engine`.
      overlays = [ hyprqt6engine.overlays.default ];
    };
  in
  {
    # Used with `nixos-rebuild --flake .#<hostname>`
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit mylib stylix; };
      modules = [
        ./hosts/vm/configuration.nix
        ./modules/base

        # Makes home-manager a module of nixos so that home-manager
        # configuration will be deployed automatically when executing
        # `nixos-rebuild switch`.
        home-manager.nixosModules.home-manager {
          home-manager.extraSpecialArgs = { inherit mylib; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.developer = import ./home/users/developer/home.nix;
        }
      ];
    };
  };
}
