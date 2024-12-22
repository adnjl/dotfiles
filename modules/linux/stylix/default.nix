
{ inputs, pkgs, system, ... }:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    image = "${inputs.wallpapers}/deer.png";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/oxocarbon.yaml";
    base16Scheme = {
      system = "base16";
      name = "oxocarbon-dark";
      author = "shaunsingh/IBM";
      variant = "dark";
      palette = {
        base00= "161616";
        base01= "262626";
        base02= "393939";
        base03= "525252";
        base04= "dde1e6";
        base05= "f2f4f8";
        base06= "ffffff";
        base07= "08bdba";
        base08= "3ddbd9";
        base09= "78a9ff";
        base0A= "ee5396";
        base0B= "33b1ff";
        base0C= "ff7eb6";
        base0D= "ededed"; # border
        base0E= "be95ff";
        base0F= "82cfff";
      };
    };
    polarity = "dark";

    fonts = {
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };
      monospace = {
        name = "CaskaydiaCove Nerd Font";
        package = pkgs.nerd-fonts.caskaydia-cove;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 26;
    };
  };
}
