{pkgs, ...}: {
  home.packages = with pkgs; [
    zk

    nixpkgs-review # Used to check rebuilds caused by changes to nixpkgs

    cargo # Package manager
    rustc # Compiler
  ];

  programs.helix = {
    enable = true;

    settings = {
      theme = "onedark";
      editor = {
        bufferline = "multiple";
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
        };
        indent-guides.render = true;
        cursorline = true;
        cursorcolumn = true;
        color-modes = true;
        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
            "separator"
            "file-modification-indicator"
          ];
          right = [
            "diagnostics"
            "separator"
            "file-type"
            "separator"
            "selections"
            "separator"
            "position"
            "file-encoding"
          ];
          separator = "";
        };
      };
    };

    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      shellcheck # More diagnostics for language server

      omnisharp-roslyn

      nodePackages.typescript-language-server

      nil # lsp

      rust-analyzer # Language server
      rustfmt # Formatter

      pkgs.nodePackages.prettier
    ];
    languages = {
      language-server = {
        zk = {
          command = "zk";
          args = ["lsp"];
        };
        rust-analyzer = {
          config = {
            checkOnSave.command = "clippy";
            # Careful! If you enable this, then a lot of errors
            # will no longer show up in Helix. Do not enable it.
            # cargo.allFeatures = true; <- do NOT enable me
          };
        };
      };
      language = [
        {
          name = "bash";
          auto-format = true;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          formatter.command = "${pkgs.shfmt}/bin/shfmt";
        }
        {
          name = "c-sharp";
          auto-format = true;
        }
        {
          name = "javascript";
          auto-format = true;
        }
        {
          name = "typescript";
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
          auto-format = true;
        }
        {
          name = "json";
          formatter = {
            command = "prettier";
            args = ["--parser" "json"];
          };
          auto-format = true;
        }
        {
          name = "markdown";
          auto-format = true;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          # Use zk instead of default lsp
          roots = [".zk"];
          language-servers = ["zk"];
        }
        {
          name = "html";
          formatter = {
            command = "prettier";
            args = ["--parser" "html"];
          };
        }
        {
          name = "css";
          formatter = {
            command = "prettier";
            args = ["--parser" "css"];
          };
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
        }
      ];
    };
  };
}
