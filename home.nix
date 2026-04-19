{ config, pkgs, lib, ... }:
let
  usr = ./modules/user;
  importDir = dir:
    let
      files = builtins.readDir dir;
      isNix = name: type: type == "regular" && lib.hasSuffix ".nix" name;
      nixFiles = lib.attrNames (lib.filterAttrs isNix files);
    in
      map (f: dir + "/${f}") nixFiles;

  dirs = ["hypr" "env" "media" "terminal" "dev" "shell"];
  autoImports = lib.concatMap (d: importDir (usr + "/${d}")) dirs;
in
{
  imports = [
    ./modules/user/browsers.nix
  ] ++ autoImports;

  userSettings = {
    neovim.enable = true;
    obsidian.enable = true;
    zed.enable = true;
    bash.enable = true;
  };

  home = {
    username = "mx";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.11";
    packages = with pkgs; [
       waybar
       wofi
       networkmanagerapplet
       hyprsunset
       hyprpaper
       pavucontrol
       feh
       mpv
       starship
       trayscale
       gcr
       thunderbird
       ripgrep
    ];
    sessionVariables = {};
  };

  ### User Services ###
  services = {
    gnome-keyring.enable = true;
  };


  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
