{ pkgs, ... }:
{

  programs.kitty = {
    enable = true;
    themeFile = "Kanagawa_dragon";
    font.name = "CaskaydiaCove Nerd Font";
    settings = {
      shell = "${pkgs.fish}/bin/fish";
      font_size = 11;
      window_padding_width = "20";
      confirm_os_window_close = -1;
      shell_integration = "no-sudo";
      allow_remote_control = "socket-only";
      background_opacity = 0.95;
      hide_window_decorations = "titlebar-only";
      background_blur = 32;
    };
    extraConfig = ''
      if command -v zoxide > /dev/null
        zoxide init fish | source
      end
    '';

    keybindings = {
      "kitty_mod+h" = "show_scrollback";
    };
  };

  # home.file.".config/kitty/kitty.conf".text = builtins.readFile ./kitty.conf;

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    extraConfig = builtins.readFile ./wezterm.lua;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    # shell = "${pkgs.fish}/bin/fish";
    shortcut = "a";
    keyMode = "vi";
    # plugins = with pkgs; [
    #   # {
    #   #   plugin = tmux-super-fingers;
    #   #   extraConfig = "set -g @super-fingers-key f";
    #   # }
    #   # tmuxPlugins.better-mouse-mode
    #   # tmuxPlugins.tmux-mem-cpu-load
    #   pkgs.tmuxPlugins.tpm
    #   pkgs.tmuxPlugins.tmux-resurrect
    # ];
    extraConfig = builtins.readFile ./.tmux.conf;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  home.file.".config/starship.toml".text = builtins.readFile ./starship.toml;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza -l --icons=auto";
      vim = "nvim";
    };
    interactiveShellInit = ''
      fish_vi_key_bindings
      set -g fish_greeting
    '';
    # eval "$(/opt/homebrew/bin/brew shellenv)"
    plugins = [
      {
        name = "autopair";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
          hash = "sha256-qt3t1iKRRNuiLWiVoiAYOu+9E7jsyECyIqZJ/oRIT1A=";
        };
      }
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
          hash = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
        };
      }
      {
        name = "sponge";
        src = pkgs.fetchFromGitHub {
          owner = "meaningful-ooo";
          repo = "sponge";
          rev = "384299545104d5256648cee9d8b117aaa9a6d7be";
          hash = "sha256-MdcZUDRtNJdiyo2l9o5ma7nAX84xEJbGFhAVhK+Zm1w=";
        };
      }
      {
        name = "done";
        src = pkgs.fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "eb32ade85c0f2c68cbfcff3036756bbf27a4f366";
          hash = "sha256-DMIRKRAVOn7YEnuAtz4hIxrU93ULxNoQhW6juxCoh4o=";
        };
      }
    ];
  };

}
