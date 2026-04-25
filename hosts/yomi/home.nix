{ pkgs, ... }:

{
  config = {
    userSettings = {

    };

    home = {
      username = "mx";
      homeDirectory = "/home/mx";
      #stateVersion = "25.11";
      packages = with pkgs; [];
      sessionVariables = {};
    };

    services = {

    };

    programs.home-manager.enable = true;
  };
}
