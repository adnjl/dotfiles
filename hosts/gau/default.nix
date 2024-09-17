{
  inputs,
  system,
  ...
}: {
  imports = with inputs; [
    ./configuration.nix

    apple-silicon.nixosModules.apple-silicon-support
  ];
}
