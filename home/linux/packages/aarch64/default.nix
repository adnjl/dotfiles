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
      modrinth-app
      inputs.nvchad4nix.packages.${pkgs.system}.nvchad
    ]);
} 

