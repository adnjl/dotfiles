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
      zoxide
      eza
      neofetch
    ]);
}
