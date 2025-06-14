# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ../../modules/darwin-system.nix
  ];
  networking.hostName = "tou"; # Define your hostname.
  nixpkgs.hostPlatform = "aarch64-darwin";
  programs.fish.enable = true;
  ids.gids.nixbld = 350;
  launchd.user.agents = {
    yabai.serviceConfig.EnvironmentVariables.SHELL = "/bin/dash";
    skhd.serviceConfig.EnvironmentVariables.SHELL = "/bin/dash";
  };
  system.stateVersion = 4;
}
