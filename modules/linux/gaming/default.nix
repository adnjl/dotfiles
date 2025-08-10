{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonup
    protonup-qt

    osu-lazer
  ];

  programs.gamescope.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

}
