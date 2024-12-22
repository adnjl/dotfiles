{
  pkgs,
  inputs,
  ...
}: let
  createCommon = import ../packages.nix;
in {
  home.packages =
    (createCommon pkgs)
    ++ (with pkgs; [
      bitwarden-desktop
      modrinth-app
      lutris
      wine
      sbctl
      spotify
      r2modman
      signal-desktop
      google-chrome
      bitwarden-cli
      inputs.zen-browser.packages.${pkgs.system}.default
      inputs.nvchad4nix.packages.${pkgs.system}.nvchad
    ]);
  # home.sessionVariables = {
  #   DEFAULT_BROWSER = "${pkgs.zen-browser}/bin/zen";
  # };
} 

