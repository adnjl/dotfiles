{
  inputs,
  system,
  ...
}: {
  imports = with inputs; [
    ./configuration.nix
  ];
}
