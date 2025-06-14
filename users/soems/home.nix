{
  inputs,
  config,
  pkgs,
  system,
  lib,
  ...
}:
{
  imports = [
    ../../home/core.nix
    ../../home/darwin/shell
    ../../home/packages/${system}
    ../../home/programs
  ];

  home.homeDirectory = lib.mkForce "/Users/soems";
  programs.git.extraConfig.commit.gpgsign = "false";
  programs.fish.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "24.05";
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
