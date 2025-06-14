{ pkgs, ... }:
{
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
}
