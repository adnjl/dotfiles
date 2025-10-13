{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ../../modules/system.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "maau";

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };

  boot = {
    loader = {
      timeout = 20;
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
        theme = lib.mkForce ../../components/grub-themes/virtuaverse;
      };
    };
    kernelParams = [ "nvidia_drm.modeset=1" ];
    # kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxPackages_latest_xen_dom0;
    # kernelPackages = pkgs.linuxPackages_zen;
    kernelPackages = pkgs.linuxPackages_cachyos-gcc;
  };

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

    bluetooth = {
      enable = true;
    };

    cpu.amd = {
      updateMicrocode = true;
      ryzen-smu.enable = true;
    };

    opentabletdriver.enable = true;
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  networking.networkmanager.enable = true;
  # networking.wireless.iwd.enable = true;
  # networking.networkmanager.wifi.backend = "iwd";

  services.xserver = {
    enable = true;
    xkbOptions = "ctrl:nocaps";
    videoDrivers = [ "nvidia" ];
    displayManager.startx.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver.xkb = {
    layout = "us";
    options = "";
    variant = "";
  };

  services.blueman.enable = true;
  # Enable Podman
  virtualisation.podman.enable = true;

  # Install distrobox
  environment.systemPackages = with pkgs; [
    distrobox
  ];

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
