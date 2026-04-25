{ lib, ... }:

{
  options = {
    systemSettings = {
      users = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
      };
    };
  };
}
