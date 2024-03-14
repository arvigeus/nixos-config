{ config, pkgs, inputs, outputs, ... }:

{
  programs.plasma = {
    enable = true;

    shortcuts = {
      "asusctl.desktop"."_launch" = "Launch (6)"; # Fn + F5
      "zephyrusctl.desktop"."_launch" = "Launch (3)"; # M4
    };

    configFile = {
      "dolphinrc"."General"."BrowseThroughArchives" = true;
      "kcminputrc"."Libinput.1267.12699.ASUE120A:00 04F3:319B Touchpad"."TapToClick" = true;
      "kwinrulesrc"."1"."Description" = "Window settings for firefox";
      "kwinrulesrc"."1"."above" = true;
      "kwinrulesrc"."1"."aboverule" = 2;
      "kwinrulesrc"."1"."position" = "1280,842";
      "kwinrulesrc"."1"."positionrule" = 4;
      "kwinrulesrc"."1"."size" = "768,384";
      "kwinrulesrc"."1"."sizerule" = 4;
      "kwinrulesrc"."1"."skiptaskbar" = true;
      "kwinrulesrc"."1"."skiptaskbarrule" = 2;
      "kwinrulesrc"."1"."title" = "Picture-in-Picture";
      "kwinrulesrc"."1"."titlematch" = 1;
      "kwinrulesrc"."1"."types" = 1;
      "kwinrulesrc"."1"."wmclass" = "firefox";
      "kwinrulesrc"."1"."wmclassmatch" = 1;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."Description" = "Window settings for firefox";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."above" = true;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."aboverule" = 3;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."position" = "1353,833";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."positionrule" = 4;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."size" = "683,384";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."sizerule" = 4;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."title" = "Picture-in-Picture";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."titlematch" = 1;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."types" = 1;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."wmclass" = "firefox";
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."wmclasscomplete" = true;
      "kwinrulesrc"."78315bde-2c1a-488f-bbee-7b8dfbf4cc3a"."wmclassmatch" = 1;
      "kwinrulesrc"."General"."count" = 1;
      "kwinrulesrc"."General"."rules" = 1;
      "kxkbrc"."Layout"."Options" = "grp:alt_shift_toggle,terminate:ctrl_alt_bksp"; # Kill server
      "kxkbrc"."Layout"."DisplayNames" = ",";
      "kxkbrc"."Layout"."LayoutList" = "us,bg";
      "kxkbrc"."Layout"."ResetOldOptions" = true;
      "kxkbrc"."Layout"."SwitchMode" = "Window";
      "kxkbrc"."Layout"."Use" = true;
      "kxkbrc"."Layout"."VariantList" = ",phonetic";
      "plasma-localerc"."Formats"."LANG" = "en_US.UTF-8";
      "kglobalshortcutsrc"."asusctl.desktop"."_k_friendly_name" = "\sprofile -n && notify-send \"Power Profile\" \"$(asusctl profile -p)\"";
      "kglobalshortcutsrc"."zephyrusctl.desktop"."_k_friendly_name" = "zephyrusctl";
    };
  };

  home = {
    # Fix Wayland cursor size for some apps
    file."${config.xdg.dataHome}/icons/default/index.theme".text = ''
      [Icon Theme]
      Inherits=breeze_cursors
    '';
  };
}
