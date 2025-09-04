{ pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      ipafont
      kochi-substitute
      proggyfonts
      (google-fonts.override { fonts = [ "Lora" ]; })
    ];
  };
}
