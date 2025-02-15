{
  pkgs,
  lib,
  username,
  inputs,
  ...
}:
{

  # ============================= User related =============================
  users.knownUsers = [ "soems" ];
  users.users.${username} = {
    description = username;
    uid = 501;
    home = "/Users/${username}";
    ignoreShellProgramCheck = true;
    shell = pkgs.fish;

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
