pkgs:
with pkgs;[
  #core
  neofetch
  wl-clipboard
  grim
  slurp
  swappy
  pavucontrol
  waypaper
  swaybg
  pamixer
  brightnessctl
  neovim

  bibata-cursors
  libsForQt5.qtstyleplugin-kvantum
  libsForQt5.qt5ct
  papirus-icon-theme
  libsForQt5.qt5ct

  # archives
  zip
  xz
  unzip
  p7zip

  # utils
  nurl # helps fetch git data for nixpkgs
  wget
  curl
  nix-output-monitor

  # system tools
  pciutils # lspci
  usbutils # lsusb

  # desktop utils
  xfce.thunar

  # desktop apps
  dolphin
  firefox-devedition
  vesktop
  spotify

  # fun
  ani-cli

  gcc
]
