{ config, pkgs, ... }:

  let
    textEditor = "nvim.desktop";
    imgViewer = "feh.desktop";
    mediaViewer = "mpv.desktop";
  in
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/system/gaming/games.nix
      ./modules/system/theme/sddm.nix
    ];

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

  services.blueman.enable = true;
 
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-mauve";
  };  

  services.printing.enable = true;
  
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.tailscale = {
    enable = true;
    # useRoutingFeatures = client;
  };

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
  
  services.flatpak.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      zed-editor
      tmux
      catppuccin-sddm
      obsidian
      peazip
      calcure
      protonvpn-gui
      bitwarden-desktop
      jellyfin-desktop
   ];
  };

  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;

  programs.yazi.enable = true;

  programs.thunar.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
	
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wget
     git
     kitty
     btop
     fastfetch
     brightnessctl
     ncdu
     playerctl
 ];

  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts-cjk-sans
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.11"; # Did you read the comment?

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
