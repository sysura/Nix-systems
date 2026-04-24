{ pkgs, ... }:

{
  config = {
    systemSettings = {
      users = [ "mx" ];

       games.enable = true;
       i18n.enable = true;
       networking.enable = true;
       sddm.enable = true;
    };

    users.users.mx = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };

    environment.systemPackages = with pkgs; [];

    system.stateVersion = "25.11";

    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
