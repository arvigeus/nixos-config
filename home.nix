{ config, pkgs, ... }: {
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

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    mutableExtensionsDir = false;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    extensions = with pkgs.open-vsx; [
      # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/open-vsx-latest.json

      # Essentials
      mikestead.dotenv
      editorconfig.editorconfig

      # Interface Improvements
      eamodio.gitlens
      usernamehw.errorlens
      pflannery.vscode-versionlens
      wix.vscode-import-cost
      gruntfuggly.todo-tree
      zhuangtongfa.material-theme

      # Web Dev
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      csstools.postcss
      stylelint.vscode-stylelint
      bradlc.vscode-tailwindcss
      davidanson.vscode-markdownlint
      unifiedjs.vscode-mdx
      # zenclabs.previewjs # Error: EROFS: read-only file system

      # Deno
      denoland.vscode-deno

      # GraphQL
      graphql.vscode-graphql-syntax
      graphql.vscode-graphql

      # Nix
      jnoortheen.nix-ide
      jetpack-io.devbox
      arrterian.nix-env-selector

      # Testing
      vitest.explorer
      ms-playwright.playwright
      firefox-devtools.vscode-firefox-debug
      ms-vscode.test-adapter-converter
      mtxr.sqltools
      mtxr.sqltools-driver-pg
    ] ++ (with pkgs.vscode-marketplace; [
      # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/vscode-marketplace-latest.json
      mtxr.sqltools-driver-sqlite
      ms-vscode-remote.vscode-remote-extensionpack
      ms-vscode.remote-explorer
      ms-vsliveshare.vsliveshare
      codeforge.remix-forge
      jackardios.vscode-css-to-tailwindcss
      amodio.toggle-excluded-files
    ]);

    userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "One Dark Pro Flat";
      "editor.fontFamily" = "'Fira Code', 'Droid Sans Mono', 'monospace', monospace";
      "editor.inlineSuggest.enabled" = true;

      "testExplorer.useNativeTesting" = true; # TODO: doesn't seem to be a valid option

      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableCommitSigning" = true;

      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[json].editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[javascript].editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescript].editor.defaultFormatter" = "esbenp.prettier-vscode";
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

  programs.mpv = {
		enable = true;
		package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {}) { youtubeSupport = true; };
		scripts = with pkgs.mpvScripts; [ mpris uosc thumbfast sponsorblock quality-menu ];
		# config.force-window = "immediate";
		# bindings = {
		# 	"+" = "add volume 2";
		# 	"-" = "add volume -2";
		# };
		scriptOpts.uosc = {
      timeline_size = 10;
		# 	timeline_size_min = 1;
		# 	timeline_persistency = "paused,audio";
			controls = "menu,space,subtitles,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality";
		# 	# volume = "none";
		# 	window_border_size = 0;
		# 	# pause_indicator = "none";
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
