{config, ...}: {
  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "open";
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    kwin = {
      titlebarButtons = {
        left = ["close" "maximize" "minimize" "application-menu"];
        right = ["help" "on-all-desktops" "keep-above-windows"];
      };
    };

    shortcuts = {
      "services/asusctl.desktop"."_launch" = "Launch (4)"; # Fn + F5
      "services/zephyrusctl.desktop"."_launch" = "Launch (1)"; # M4
      "services/org.kde.kcalc.desktop"."_launch" = []; # KCalc is very eager to hijack M4
    };

    configFile = {
      "ksmserverrc"."General"."loginMode".value = "emptySession";
      "dolphinrc"."General"."BrowseThroughArchives".value = true;
      "kdeglobals"."General"."accentColorFromWallpaper".value = true;
      "kglobalshortcutsrc"."KDE Keyboard Layout Switcher"."_k_friendly_name".value = "Keyboard Layout Switcher";
      "kglobalshortcutsrc"."asusctl.desktop"."_k_friendly_name".value = "sprofile -n && notify-send \"Power Profile\" \"$(asusctl profile -p)\"";
      "kglobalshortcutsrc"."zephyrusctl.desktop"."_k_friendly_name".value = "zephyrusctl";
      "kscreenlockerrc"."Greeter"."WallpaperPlugin".value = "org.kde.potd";
      "kscreenlockerrc"."Greeter/Wallpaper/org.kde.potd/General"."Provider".value = "bing";
      "ksplashrc"."KSplash"."Engine".value = "none";
      "kwalletrc"."Wallet"."First Use".value = false;
      "kwinrc"."Windows"."BorderlessMaximizedWindows".value = true;
      "kwinrc"."Xwayland"."Scale".value = 1;
      "kwinrulesrc"."1"."Description".value = "Window settings for firefox";
      "kwinrulesrc"."1"."above".value = true;
      "kwinrulesrc"."1"."aboverule".value = 2;
      "kwinrulesrc"."1"."position".value = "1280,842";
      "kwinrulesrc"."1"."positionrule".value = 4;
      "kwinrulesrc"."1"."size".value = "768,384";
      "kwinrulesrc"."1"."sizerule".value = 4;
      "kwinrulesrc"."1"."skiptaskbar".value = true;
      "kwinrulesrc"."1"."skiptaskbarrule".value = 2;
      "kwinrulesrc"."1"."title".value = "Picture-in-Picture";
      "kwinrulesrc"."1"."titlematch".value = 1;
      "kwinrulesrc"."1"."types".value = 1;
      "kwinrulesrc"."1"."wmclass".value = "firefox";
      "kwinrulesrc"."1"."wmclassmatch".value = 1;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."Description".value = "Window settings for firefox";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."above".value = true;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."aboverule".value = 3;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."position".value = "1353,833";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."positionrule".value = 4;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."size".value = "683,384";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."sizerule".value = 4;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."title".value = "Picture-in-Picture";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."titlematch".value = 1;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."types".value = 1;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."wmclass".value = "firefox";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."wmclasscomplete".value = true;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."wmclassmatch".value = 1;
      "kwinrulesrc"."General"."count".value = 1;
      "kwinrulesrc"."General"."rules".value = 1;
      "kxkbrc"."Layout"."DisplayNames".value = ",";
      "kxkbrc"."Layout"."LayoutList".value = "us,bg";
      "kxkbrc"."Layout"."Options".value = "terminate:ctrl_alt_bksp,grp:alt_shift_toggle";
      "kxkbrc"."Layout"."ResetOldOptions".value = true;
      "kxkbrc"."Layout"."SwitchMode".value = "Window";
      "kxkbrc"."Layout"."Use".value = true;
      "kxkbrc"."Layout"."VariantList".value = ",phonetic";
      "plasma-localerc"."Formats"."LANG".value = "en_US.UTF-8";
    };
  };

  programs.konsole = {
    enable = true;

    defaultProfile = "default.profile";
    profiles.default = {
      name = "default";
      font = {
        name = "FiraCode Nerd Font Mono";
      };
    };
  };

  # TODO: Set font (https://github.com/pjones/plasma-manager/issues/87)
  # programs.kate = {
  #   enable = true;
  # };

  home = {
    # Fix Wayland cursor size for some apps
    file."${config.xdg.dataHome}/icons/default/index.theme".text = ''
      [Icon Theme]
      Inherits=breeze_cursors
    '';
  };
}
