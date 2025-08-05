{
  pkgs,
  lib,
  username,
  inputs,
  ...
}:
{

  # ============================= User related =============================
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    ignoreShellProgramCheck = true;
    shell = pkgs.fish;

  };

  security.wrappers.gsr-kms-server = {
    source = lib.getExe' pkgs.gpu-screen-recorder "gsr-kms-server";
    capabilities = "cap_sys_admin+ep";
    owner = "root";
    group = "root";
  };
  # security.sudo.wheelNeedsPassword = false;
  # given the users in this list the right to specify additional substituters via:
  #    1. `nixConfig.substituers` in `flake.nix`
  #    2. command line args `--options substituers http://xxx`
  nix.settings.trusted-users = [ username ];

  # customise /etc/nix/nix.conf declaratively via `nix.settings`
  nix.settings = {
    # enable flakes globally
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Allow unfree packages
  nixpkgs = {
    config.allowUnfree = true;
  };
}
