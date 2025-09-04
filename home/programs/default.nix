{ pkgs, inputs, ... }:
{

  programs.bash.enable = true;

  programs.git = {
    enable = true;
    userName = "Aden Lung";
    userEmail = "soemscontact@gmail.com";
    delta.enable = true;

    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.paging = {
        colorArg = "always";
        pager = "delta --dark --paging=never";
      };
    };
  };

  programs.bat.enable = true;

  programs.ripgrep.enable = true;

  programs.readline = {
    enable = true;
    extraConfig = "set editing-mode vi";
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/aden/configs/dots";
  };

  programs.gh = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fd.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      theme_background = false;
    };
  };

  programs.htop.enable = true;

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    plugins = {
      mediainfo = pkgs.fetchFromGitHub {
        owner = "Ape";
        repo = "mediainfo.yazi";
        rev = "c69314e80f5b45fe87a0e06a10d064ed54110439";
        hash = "sha256-8xdBPdKSiwB7iRU8DJdTHY+BjfR9D3FtyVtDL9tNiy4=";
      };
    };
    settings = {
      plugin = {
        prepend_previewers = [
          {
            mime = "{image,audio,video}/*";
            run = "mediainfo";
          }
          {
            mime = "application/x-subrip";
            run = "mediainfo";
          }
        ];
      };
    };
  };
}
