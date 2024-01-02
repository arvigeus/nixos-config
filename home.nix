{ config, pkgs, ... }: {

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
