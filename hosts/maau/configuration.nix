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
    ../../modules/system.nix
    ./hardware-configuration.nix
  ];

  # Bootloader.
  # boot.loader = {
  #   efi.canTouchEfiVariables = true;
  #   timeout = 15;
  #   # Lanzaboote currently replaces the systemd-boot module.
  #   # This setting is usually set to true in configuration.nix
  #   # generated at installation time. So we force it to false
  #   # for now.
  #   systemd-boot = {
  #     enable = lib.mkForce false;
  #     consoleMode = "auto";
  #   };
  # };

  # boot.lanzaboote = {
  #   enable = true;
  #   pkiBundle = "/etc/secureboot";
  # };
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };
  boot = {
    loader = {

      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = false;
        consoleMode = "auto";
      };
      grub = {
        enable = true;
        useOSProber = true;
        copyKernels = true;
        efiSupport = true;
        device = "nodev";
        configurationLimit = 10;
        extraEntries = ''
          menuentry "Reboot" {
            reboot
          }
          menuentry "Shutdown" {
            halt
          }
        '';
      };
    };
    kernelParams = [ "nvidia_drm.modeset=1" ];
    # kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxPackages_latest_xen_dom0;
    # kernelPackages = pkgs.linuxPackages_zen;
    kernelPackages = pkgs.linuxPackages_cachyos;
  };
  networking.hostName = "maau";

  hardware = {
    graphics = {
      enable = true;
    };

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
    };
    opentabletdriver.enable = true;
  };

  powerManagement.cpuFreqGovernor = "performance";

  networking.networkmanager.enable = true;
  # networking.wireless.iwd.enable = true;
  # networking.networkmanager.wifi.backend = "iwd";

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    displayManager.startx.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    options = "";
    variant = "";
  };

  # Miscellaneous
  programs.hyprland.enable = true;
  services.flatpak.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
