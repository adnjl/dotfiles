{
  inputs,
  system,
  ...
}:
{
  imports = with inputs; [
    ./configuration.nix

    nix-homebrew.darwinModules.nix-homebrew
    ../../modules/darwin/brew
    ../../modules/darwin/skhd
    ../../modules/darwin/yabai

  ];
}
