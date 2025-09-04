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
    inputs.spicetify-nix.homeManagerModules.default
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

  services.syncthing = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {

      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        ncsVisualizer
      ];
      # enabledSnippets = with spicePkgs.snippets; [
      #   rotatingCoverart
      #   pointer
      # ];
      theme = lib.mkForce spicePkgs.themes.catppuccin;
      colorScheme = lib.mkForce "mocha";
    };
}
