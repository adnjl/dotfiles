{
  pkgs,
  lib,
  inputs,
  ...
}:
let
  commonPrograms = import ../default.nix { inherit pkgs inputs; };
in
{
  imports = [
    commonPrograms
    ./swaync.nix
    ./rofi
  ];
  # services.dunst = {
  #   enable = true;
  # };

  services.easyeffects = {
    enable = true;
    package = pkgs.easyeffects;
  };

  programs.fzf = {
    enable = true;
  };

}
