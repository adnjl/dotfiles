{
  inputs,
  system,
  ...
}: {
  imports = with inputs; [
    ./configuration.nix
    ../../modules/linux/audio    
    ../../modules/linux/core
    ../../modules/linux/desktop-portal
    ../../modules/linux/greeter
    ../../modules/linux/fonts
    ../../modules/linux/gaming
    ../../modules/linux/stylix
  ];
}
