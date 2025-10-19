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
      # Programs
      bitwarden-desktop
      prismlauncher
      lutris
      wine
      sbctl
      r2modman
      signal-desktop
      google-chrome
      bitwarden-cli

      # Core
      wl-clipboard
      grim
      slurp
      swappy
      pavucontrol
      waypaper
      swaybg
      pamixer
      brightnessctl
      chafa
      hyprlandPlugins.hyprscrolling

      # Theming
      bibata-cursors
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
      papirus-icon-theme
      libsForQt5.qt5ct

      # System Tools
      pciutils
      usbutils
      # xfce.thunar
      kdePackages.dolphin
      kdePackages.qtsvg

      # Desktop Apps
      vesktop
      inputs.zen-browser.packages.${pkgs.system}.default
      zoom-us
    ]);
}
