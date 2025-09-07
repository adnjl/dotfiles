{
  inputs,
  pkgs,
  system,
  ...
}:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    image = "${inputs.wallpapers}/shrine-dark.jpg";
    base16Scheme = {
      system = "base16";
      name = "kanagawa";
      author = "rebelot";
      variant = "dragon";
      palette = {
        base00 = "181616";
        base01 = "0d0c0c";
        base02 = "2d4f67";
        base03 = "a6a69c";
        base04 = "7fb4ca";
        base05 = "c5c9c5";
        base06 = "938aa9";
        base07 = "c5c9c5";
        base08 = "c4746e";
        base09 = "e46876";
        base0A = "c4b28a";
        base0B = "8a9a7b";
        base0C = "8ea4a2";
        base0D = "8ba4b0";
        base0E = "a292a3";
        base0F = "7aa89f";
        # base00 = "161616";
        # base01 = "262626";
        # base02 = "393939";
        # base03 = "525252";
        # base04 = "dde1e6";
        # base05 = "f2f4f8";
        # base06 = "ffffff";
        # base07 = "08bdba";
        # base08 = "3ddbd9";
        # base09 = "78a9ff";
        # base0A = "ee5396";
        # base0B = "33b1ff";
        # base0C = "ff7eb6";
        # base0D = "ededed"; # border
        # base0E = "be95ff";
        # base0F = "82cfff";
      };
    };
    polarity = "dark";
    opacity.popups = 0.9;

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
