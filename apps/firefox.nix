{ ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "widget.use-xdg-desktop-portal.file-picker" = 1;
        };
        # userChrome = ''
        #   .titlebar-buttonbox-container {display:none !important;}
        # '';
      };
    };
  };
}