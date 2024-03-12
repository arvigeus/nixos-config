{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      corefonts # Microsoft free fonts
      dejavu_fonts
      inconsolata # monospaced
      nerdfonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      ubuntu_font_family
      unifont # some international languages
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Source Code Pro" ];
        sansSerif = [ "Source Sans Pro" ];
        serif = [ "Source Serif Pro" ];
      };
    };
    fontDir.enable = true; # allow Flatpak apps to use system fonts
  };
}

