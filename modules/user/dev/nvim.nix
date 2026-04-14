{config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    plugins = [];
    withRuby = false;
    withPython3 = false;
  };
}
