{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    mutableExtensionsDir = false;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    extensions = with pkgs.open-vsx;
      [
        # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/open-vsx-latest.json

        # Essentials
        mikestead.dotenv
        editorconfig.editorconfig

        # Interface Improvements
        eamodio.gitlens
        usernamehw.errorlens
        pflannery.vscode-versionlens
        yoavbls.pretty-ts-errors
        wix.vscode-import-cost
        gruntfuggly.todo-tree
        zhuangtongfa.material-theme

        # Web Dev
        # dbaeumer.vscode-eslint
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

        # Bash
        mads-hartmann.bash-ide-vscode
        mkhl.shfmt

        # Testing
        vitest.explorer
        ms-playwright.playwright
        firefox-devtools.vscode-firefox-debug
        ms-vscode.test-adapter-converter
        mtxr.sqltools
        mtxr.sqltools-driver-pg
      ]
      ++ (with pkgs.vscode-marketplace; [
        # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/vscode-marketplace-latest.json
        dbaeumer.vscode-eslint
        mtxr.sqltools-driver-sqlite
        ms-vscode-remote.vscode-remote-extensionpack
        ms-vscode.remote-explorer
        ms-vsliveshare.vsliveshare
        codeforge.remix-forge
        amodio.toggle-excluded-files
      ]);

    userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "One Dark Pro Flat";
      "editor.fontFamily" = "'FiraCode Nerd Font', 'FiraCode Nerd Font Mono', 'monospace', monospace";
      "editor.inlineSuggest.enabled" = true;

      "testExplorer.useNativeTesting" = true; # TODO: doesn't seem to be a valid option

      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableCommitSigning" = true;

      "[html]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[css]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[markdown]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[jsonc]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
      "[scss]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";

      "nix.enableLanguageServer" = true;
      "nix.formatterPath" = "${pkgs.alejandra}/bin/alejandra";
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      "nix.serverSettings"."nil"."formatting"."command" = ["${pkgs.alejandra}/bin/alejandra"];

      "bashIde.shellcheckPath" = "${pkgs.shellcheck}/bin/shellcheck";
      "shfmt.executablePath" = "${pkgs.shfmt}/bin/shfmt";

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
}
