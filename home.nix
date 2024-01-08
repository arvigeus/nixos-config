{ config, pkgs, ... }: {
  programs.plasma = {
    enable = true;

    configFile = {
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
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/vscode/extensions/default.nix
      jnoortheen.nix-ide
      firefox-devtools.vscode-firefox-debug
      denoland.vscode-deno
      mikestead.dotenv
      editorconfig.editorconfig
      usernamehw.errorlens
      dbaeumer.vscode-eslint
      graphql.vscode-graphql
      davidanson.vscode-markdownlint
      unifiedjs.vscode-mdx
      zhuangtongfa.material-theme
      bradlc.vscode-tailwindcss
      # csstools.postcss
      # pflannery.vscode-versionlens
      # amodio.toggle-excluded-files
      gruntfuggly.todo-tree
      # swellaby.vscode-rust-test-adapter
      # hbenl.vscode-test-explorer
      # stylelint.vscode-stylelint

      ms-vsliveshare.vsliveshare
      # ms-playwright.playwright
      # ms-vscode-remote.vscode-remote-extensionpack
      # ms-vscode.remote-explorer
      # mtxr.sqltools
      # mtxr.sqltools-driver-pg
      # mtxr.sqltools-driver-sqlite
      # ms-vscode.test-adapter-converter
    ];

    userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "One Dark Pro Flat";
      "editor.fontFamily" = "'Fira Code', 'Droid Sans Mono', 'monospace', monospace";
      "editor.inlineSuggest.enabled" = true;

      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableCommitSigning" = true;

      "[json].editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[javascript].editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescriptreact].editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[jsonc].editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[markdown].editor.defaultFormatter" = "esbenp.prettier-vscode";

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      #"nix.formatterPath" = "nixpkgs-fmt";

      "errorLens.gutterIconsEnabled" = true;
      "errorLens.messageMaxChars" = 0;

      "todo-tree.general.statusBar" = "total";
      "todo-tree.highlights.highlightDelay" = 0;
      "todo-tree.highlights.customHighlight.TODO.type" = "text";
      "todo-tree.highlights.customHighlight.TODO.foreground" = "black";
      "todo-tree.highlights.customHighlight.TODO.background" = "green";
      "todo-tree.highlights.customHighlight.TODO.iconColour" = "green";
      "todo-tree.highlights.customHighlight.TODO.icon" = "shield-check";
      "todo-tree.highlights.customHighlight.TODO.gutterIcon" = true;
      "todo-tree.highlights.customHighlight.FIXME.type" = "text";
      "todo-tree.highlights.customHighlight.FIXME.foreground" = "black";
      "todo-tree.highlights.customHighlight.FIXME.background" = "yellow";
      "todo-tree.highlights.customHighlight.FIXME.iconColour" = "yellow";
      "todo-tree.highlights.customHighlight.FIXME.icon" = "shield";
      "todo-tree.highlights.customHighlight.FIXME.gutterIcon" = true;
      "todo-tree.highlights.customHighlight.HACK.type" = "text";
      "todo-tree.highlights.customHighlight.HACK.foreground" = "black";
      "todo-tree.highlights.customHighlight.HACK.background" = "red";
      "todo-tree.highlights.customHighlight.HACK.iconColour" = "red";
      "todo-tree.highlights.customHighlight.HACK.icon" = "shield-x";
      "todo-tree.highlights.customHighlight.HACK.gutterIcon" = true;
      "todo-tree.highlights.customHighlight.BUG.type" = "text";
      "todo-tree.highlights.customHighlight.BUG.foreground" = "black";
      "todo-tree.highlights.customHighlight.BUG.background" = "orange";
      "todo-tree.highlights.customHighlight.BUG.iconColour" = "orange";
      "todo-tree.highlights.customHighlight.BUG.icon" = "bug";
      "todo-tree.highlights.customHighlight.BUG.gutterIcon" = true;
    };
  };

  home = {
    # Fix Wayland cursor size for some apps
    file."${config.xdg.dataHome}/icons/default/index.theme".text = ''
      [Icon Theme]
      Inherits=breeze_cursors
    '';
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";
}
