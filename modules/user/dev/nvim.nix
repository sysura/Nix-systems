{config, pkgs, lib, ...}:

let
  cfg = config.userSettings.neovim;
in
{
  options = {
    userSettings.neovim = {
      enable = lib.mkEnableOption "Enable neovim editor";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;
      defaultEditor = true;
      plugins = [];
      withRuby = false;
      withPython3 = false;
    };
  };
}
