{ lib, buildLinux, ... } @ args:

let
  version = "6.5";
  src = ./src;

  args' = (builtins.removeAttrs args ["branch"]) // {
    inherit src version;

    modDirVersion = lib.versions.pad 3 version;
    extraMeta.branch = "6.5";
  } // (args.argsOverride or {});
in
buildLinux args'
