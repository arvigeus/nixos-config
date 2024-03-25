{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        bookmarks = { };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          multi-account-containers
          ublock-origin
          ublacklist
          bitwarden
          enhancer-for-youtube
          plasma-integration
          search-by-image
        ];
        bookmarks = { };
        settings = {
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "identity.fxaccounts.enabled" = false;
          "privacy.trackingprotection.enabled" = true;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "browser.startup.page" = 3; # Restore session
          "browser.tabs.inTitlebar" = 0;
        };
        # userChrome = ''
        #   .titlebar-buttonbox-container {display:none !important;}
        # '';
      };
    };
  };
}