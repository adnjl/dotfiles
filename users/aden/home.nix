{
  pkgs,
  inputs,
  system,
  ...
}:
{
  imports = [
    ../../home/core.nix
    ../../home/system-env/${system}
    ../../home/packages/${system}
  ];
}
