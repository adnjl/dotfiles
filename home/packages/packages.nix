# environment.systemPackages = with pkgs; [
#   neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#
#   wget
#   curl
#   git
#   sysstat
#   lm_sensors # for `sensors` command
#   # minimal screen capture tool, used by i3 blur lock to take a screenshot
#   # print screen key is also bound to this tool in i3 config
#   scrot
#   neofetch
#   xfce.thunar # xfce4's file manager
#   nnn # terminal file manager
# ];
#

pkgs: with pkgs; [
  #core
  neofetch
  # wl-clipboard
  # grim
  # slurp
  # swappy
  # pavucontrol
  # waypaper
  # swaybg
  # pamixer
  # brightnessctl
  neovim

  # bibata-cursors
  # libsForQt5.qtstyleplugin-kvantum
  # libsForQt5.qt5ct
  # papirus-icon-theme
  # libsForQt5.qt5ct

  # archives
  zip
  xz
  unzip
  p7zip

  # utils
  nnn
  git
  nurl # helps fetch git data for nixpkgs
  wget
  curl
  nix-output-monitor

  # system tools
  # pciutils # lspci
  # usbutils # lsusb

  # desktop utils
  # xfce.thunar

  # desktop apps
  # firefox-devedition
  vesktop

  # fun
  ani-cli

  # gcc
  # languages
  go
  cargo
  SDL2
  mupdf
  tytanic
]
