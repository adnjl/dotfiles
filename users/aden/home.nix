{
  pkgs,
  inputs,
  system,
  ...
}:
{
  imports = [
    ../../home/core.nix
    ../../home/platform-configs/${system}
    ../../home/packages/${system}
  ];
}
