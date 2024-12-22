{ pkgs, ...}:

{
  hardware.pulseaudio.enable = false;

  services = {
    dbus.packages = [pkgs.gcr];

    geoclue2.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
