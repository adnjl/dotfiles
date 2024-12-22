{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font.name = "CaskaydiaCove Nerd Font";
    settings = {
      font_size = 12;
      window_padding_width = "8 8 0";
      confirm_os_window_close = -1;
      shell_integration = "enabled";
      enable_audio_bell = "no";
      # background_opacity = "0.9";
      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/kitty";
      # action_alias = "kitty_scrollback_nvim kitten /home/youwen/.local/share/nvim/lazy/kitty-scrollback.nvim/python/kitty_scrollback_nvim.py";
      scrollback_pager = ''nvim --noplugin -c "set signcolumn=no showtabline=0" -c "silent write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "'';
    };
    keybindings = {
      # "kitty_mod+h" = "kitty_scrollback_nvim";
      # "kitty_mod+g" = "kitty_scrollback_nvim --config ksb_builtin_last_cmd_output";
      "kitty_mod+h" = "show_scrollback";
    };
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    shell = "${pkgs.fish}/bin/fish";
    shortcut = "a";
    keyMode = "vi";
    extraConfig = ''

    set-option -g default-command fish 

    # set -g default-terminal "screen-256color"
# set -ag terminal-overrides ",screen-256color:RGB"

# plugins
    set -g @plugin 'thewtex/tmux-mem-cpu-load'
    set -g @plugin 'tmux-plugins/tpm'
    set -g @plugin 'tmux-plugins/tmux-resurrect'

# Remap prefix to C-a
    set -g prefix 'C-a'

    unbind-key C-b
    unbind-key C-a

# open windows in same directory
    bind '"' split-window -c "#{pane_current_path}"
    bind % split-window -h -c "#{pane_current_path}"
    bind c new-window -c "#{pane_current_path}"

# vi-like keybindings
    set-window-option -g mode-keys vi

    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R

# mouse passthrough
    set -g mouse on

    unbind -T copy-mode MouseDragEnd1Pane
    bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

# status bar config
    set-option -g status on
    set-option -g status-interval 1
    set-option -g status-justify centre
    set-option -g status-keys vi
    set-option -g status-position bottom
    # set-option -g status-style fg='#dc5e95',bg='#161616'
    set-option -g status-left-length 30
    set-option -g status-left-style default
    # set-option -g status-left "#[fg=#ef85b4]#(whoami)#[default]"
    set-option -g status-right-length 140
    set-option -g status-right-style default
    set-option -g status-right "#[fg=green,bg=default,bright]#(tmux-mem-cpu-load -a 0) "
    set-window-option -g window-status-style fg=colour244
    set-window-option -g window-status-style bg=default
    set-window-option -g window-status-current-style fg=colour166
    set-window-option -g window-status-current-style bg=default

    # set -g pane-border-style fg='#525252'
    set -g pane-active-border-style fg=white
    set -g pane-border-lines heavy 

    run '~/.tmux/plugins/tpm/tpm'
    '';
  };

  programs.starship = {
    enable =  true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
	#    settings = {
	#      package.disabled = true;
	#      character = {
	# #success_symbol = "[ ](#363644)";
	# #error_symbol = "[ ](#363644)"; 
	#      };
	#    };
  };
  home.file.".config/starship.toml".text = builtins.readFile ./custom.toml;

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

  programs.zoxide = {
    enable = true;
    # enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
