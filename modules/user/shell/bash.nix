{ config, pkgs, lib, ... }:

let
  cfg = config.userSettings.bash;
in
{
  options = {
    userSettings.bash = {
      enable = lib.mkEnableOption "Enable bash shell";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      package = pkgs.bash;
      shellAliases = {
        ll = "ls -l";
        ".." = "cd ..";
        nv = "nvim";
        ff = "fastfetch";
      };
      bashrcExtra = ''eval "$(starship init bash)"'';
    };
  };
}
