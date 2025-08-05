{
  pkgs,
  inputs,
  ...
}:
let
  createCommon = import ../packages.nix;
in
{
  home.packages =
    (createCommon pkgs)
    ++ (with pkgs; [
      bitwarden-desktop
      # modrinth-app-unwrapped
      prismlauncher
      lutris
      wine
      sbctl
      spotify
      r2modman
      signal-desktop
      google-chrome
      bitwarden-cli

      #core
      wl-clipboard
      grim
      slurp
      swappy
      pavucontrol
      waypaper
      swaybg
      pamixer
      brightnessctl

      bibata-cursors
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
      papirus-icon-theme
      libsForQt5.qt5ct

      # system tools
      pciutils # lspci
      usbutils # lsusb

      # desktop utils
      xfce.thunar

      # desktop apps
      vesktop

    ]);
}
