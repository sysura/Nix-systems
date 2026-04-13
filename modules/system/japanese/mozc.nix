{config, pkgs, lib, ...}:

{
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocales = ["ja_JP.UTF-8/UTF-8"];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc-ut
      fcitx5-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    fcitx5-mozc-ut
  ];

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
  ];
}
