{ inputs, ... }:
{
  nix-homebrew = {
    enable = true;
    user = "soems";

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };

    mutableTaps = false;
  };
}
