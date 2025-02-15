{
  inputs,
  config,
  pkgs,
  system,
  lib,
  ...
}:
{
  imports = [
    ../../home/core.nix
    ../../home/darwin/shell
    ../../home/packages/${system}
    ../../home/programs
  ];
  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [
  #   neofetch
  #
  #   # archives
  #   zip
  #   xz
  #   unzip
  #   p7zip
  #
  #   # utils
  #   nurl # helps fetch git data for nixpkgs
  # ];
  #
  home.homeDirectory = lib.mkForce "/Users/soems";
  programs.git.extraConfig.commit.gpgsign = "false";
  programs.fish.enable = true;
  # programs.bash.enable = true;
  # programs.zsh.enable = true;

  # programs.kitty = {
  #   enable = true;
  #   # theme = "Oxocarbon";
  #   font.name = "CaskaydiaCove Nerd Font";
  #   settings = {
  #     font_size = 13;
  #     window_padding_width = "8 8 0";
  #     confirm_os_window_close = -1;
  #     shell_integration = "enabled";
  #     enable_audio_bell = "no";
  #     background_opacity = "0.8";
  #     hide_window_decorations = "titlebar-only";
  #     background_blur = 32;
  #   };
  # };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "24.05";
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
