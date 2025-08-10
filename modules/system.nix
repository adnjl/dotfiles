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
  security.sudo.wheelNeedsPassword = false;
  nix.settings.trusted-users = [ username ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
  };
}
