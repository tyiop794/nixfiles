{ config, lib, pkgs, inputs, ...}:
{
  fonts.packages = with pkgs; [
      nerd-fonts.noto
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.ubuntu
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
  ];
}
