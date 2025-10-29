{ lib }:

let
  scanPaths = path:
    let
      entries = builtins.readDir path; # Read directory.
      filtered = lib.filterAttrs (name: type: # Filter only things of interest...
        (type == "directory") || # ...including directories...
        (type == "regular" && # ...and files...
          lib.hasSuffix ".nix" name && # ...that are actually nix files!
          name != "default.nix") # Ignore default.nix, duh.
      ) entries;

      paths = lib.mapAttrsToList (name: type: # Process elements...
        let fullPath = path + "/${name}"; in # ...in path.
        if type == "directory" then
          scanPaths fullPath # Recursively call `scanPaths` on directories.
        else [ fullPath ]
      ) filtered;
    in lib.concatLists paths;
in
dir:
  map import (scanPaths dir)
