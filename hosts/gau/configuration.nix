# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../modules/system.nix
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      # systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
    kernelParams = ["apple.dcp.show_notch=1"];
    # kernelPackages = pkgs.linuxPackages_zen;
  };

  hardware = {
    asahi = {
      peripheralFirmwareDirectory = ./firmware;
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "driver";
      setupAsahiSound = false;
      withRust = true;
    };
    graphics = {
      enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  networking.hostName = "gau"; # Define your hostname.
  
  nixpkgs.overlays = let
    stablepkgs = inputs.stablepkgs.legacyPackages.${pkgs.system};
  in [
	    inputs.apple-silicon.overlays.apple-silicon-overlay
  ];


# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Enable networking
  networking.networkmanager.enable = true;

  services.flatpak.enable = true;

# Enable the X11 windowing system.
  services.xserver.enable = false;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.dconf.enable = true;
  programs.hyprland.enable = true;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
