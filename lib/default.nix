{ lib }:

{
  loadModules = import ./loadModules.nix { inherit lib; };
}
