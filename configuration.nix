{ config, pkgs, lib, inputs, ... }:

  let
    textEditor = "nvim.desktop";
    imgViewer = "feh.desktop";
    mediaViewer = "mpv.desktop";

    sys = ./modules/system;
    importDir = dir:
      let
        files = builtins.readDir dir;
        isNix = name: type: type == "regular" && lib.hasSuffix ".nix" name;
        nixFiles = lib.attrNames (lib.filterAttrs isNix files);
      in
        map (f: dir + "/${f}") nixFiles;

    dirs = ["gaming" "japanese" "security" "theme"];
    autoImports = lib.concatMap (d: importDir (sys + "/${d}")) dirs;
  in
{
  imports =
    [
      inputs.sops-nix.nixosModules.sops
      ./hardware-configuration.nix
    ] ++ autoImports;

  systemSettings = {
    # gaming/
    games.enable = true;

    # japanese/
    i18n.enable = true;

    # security/
    networking.enable = true;

    # theme/
    sddm.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "ayu";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Stylix
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  # Sops config
  sops.defaultSopsFile = ./secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/mx/.config/sops/age/keys.txt";

  sops.secrets.example-key = { };
  sops.secrets."myservice/my_subdir/my_secret" = { };


  # Power settings
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "lock";
    HandleLidSwitchDocked = "ignore";
  };

  services.power-profiles-daemon.enable = true;
  services.system76-scheduler.enable = true;

  services.displayManager.defaultSession = "hyprland";


  hardware.graphics = {
    enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  services.blueman.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-mauve";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.pam.services.hyprlock = {};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  #services.flatpak.enable = true;

  xdg.mime.enable = true;

  xdg.mime.defaultApplications = {
    "text/plain" = [ textEditor ];
    "image/png" = [ imgViewer ];
    "image/jpeg" = [ imgViewer ];
    "image/jpg" = [ imgViewer ];
    "video/webm" = [ mediaViewer ];
    "video/mp4" = [ mediaViewer ];
    "video/mpv" = [ mediaViewer ];
    "audio/ogg" = [ mediaViewer ];
    "audio/mp3" = [ mediaViewer ];
    "audio/wav" = [ mediaViewer ];
    "audio/flac" = [ mediaViewer ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mx = {
    isNormalUser = true;
    description = "mx";
    extraGroups = [ "networkmanager" "wheel" "wireshark" ];
    packages = with pkgs; [
      catppuccin-sddm
      peazip
      bitwarden-desktop
      jellyfin-desktop
      libreoffice
      anki
      syncthing
      talosctl
      distrobox
      ollama
      thunar
      signal-desktop
      protonmail-bridge
   ];
  };

  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  services.gnome.gnome-keyring = {
    enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #programs.niri.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = false;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wget
     git
     btop
     brightnessctl
     ncdu
     playerctl
     sops
     vim
 ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    font-awesome
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "25.11";

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
