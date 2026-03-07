{config, lib, pkgs, ...}:

{
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
      #font  = "Noto Sans";
      #fontSize = "9";
      #background = "${../../../../Wallpapers/vertigo.png}";
      #loginBackground = true;
    }
  )];
}
