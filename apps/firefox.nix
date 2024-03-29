{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        # https://github.com/nix-community/nur-combined/blob/master/repos/rycee/pkgs/firefox-addons/generated-firefox-addons.nix
        extensions = (with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          multi-account-containers
          bitwarden
          plasma-integration

          react-devtools
          wappalyzer
          # web-developer
          # webhint

          enhancer-for-youtube
          search-by-image
          grammarly
          
          honey
          # cultivate
          # the-camelizer
        ]);
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
        search = {
          force = true; # allows this setting to work
          engines = {
            "Phind" = {
              urls = [{ template = "https://www.phind.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://www.phind.com/favicon.ico";
              # updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
            
            "MyNixOS" = {
              urls = [{
                template = "https://mynixos.com/search";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];
              iconUpdateURL = "https://mynixos.com/favicon.ico";
              definedAliases = [ "@np" ];
            };

            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@nw" ];
            };

            "Kagi" = {
              urls = [{ template = "https://www.kagi.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://www.kagi.com/favicon.ico";
              # updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@k" ];
            };

            "Bing".metaData.hidden = true;
            "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
          };
        };
      };
    };
  };
}