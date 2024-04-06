{lib, ...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$os"
        "[](fg:#2d344a bg:#394260)"
        "$directory"
        "[ ](#394260)"
        "$fill"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$docker_context"
        "$package"
        "$cmake"
        "$deno"
        "$dotnet"
        "$nodejs"
        "$rust"
        "$nix_shell"
        "$azure"
        "$jobs"
        "$container"
        "$line_break"
        "$character"
      ];

      os = {
        format = "[ $symbol ](fg:#9ECBFF bg:#2d344a)";
        disabled = false;

        symbols = {
          Linux = " ";
          NixOS = " ";
          Unknown = " ";
        };
      };

      directory = {
        home_symbol = " ";
        truncation_length = 2;
        truncation_symbol = "▦ ";
        format = "[ $read_only$path ]($style)";
        style = "fg:#a0a9cb bg:#394260";
        read_only = "󰌾 ";

        substitutions = {
          Documents = " 󰈙 ";
          Downloads = "  ";
          Music = "  ";
          Pictures = "  ";
          Videos = " 󰈰 ";
        };
      };

      fill = {
        symbol = "-";
        style = "bold bright-black";
      };

      character = {
        format = "$symbol";
        success_symbol = "[❯ ](bold green)";
        error_symbol = "[❯ ](bold red)";
      };

      git_branch = {
        symbol = "[󰊢](bold #f15639)";
        format = "[ $symbol $branch(:$remote_branch)]($style)";
        style = "bold white";
      };

      git_status = {
        style = "bold white";
        format = " ([$ahead_behind$staged$modified$untracked$renamed$deleted$conflicted$stashed]($style))";
        conflicted = "[◪◦](bold bright-magenta)";
        ahead = "[▲│[\${count}](bold white)│](bold green)";
        behind = "[▽│[\${count}](bold white)│](bold red)";
        diverged = "[◇ ▲┤[\${ahead_count}](regular white)│▽┤[\${behind_count}](regular white)│](bold bright-magenta)";
        untracked = "[◌◦](bold bright-yellow)";
        stashed = "[◦◫◦](bold white)";
        modified = "[●◦](bold yellow)";
        staged = "[■┤[$count](bold white)│](bold bright-cyan)";
        renamed = "[◎◦](bold bright-blue)";
        deleted = "[✕](bold red)";
      };

      jobs = {
        symbol = "[▶](blue bold)";
        format = " [$symbol $number]($style)";
        style = "white";
      };

      docker_context = {
        symbol = " ";
        format = " [](fg:#0895e7)[$symbol $context](italic fg:black bg:#0895e7)[](fg:#0895e7)";
      };

      nix_shell = {
        symbol = " ";
        format = " [$symbol $state $name]($style)";
      };

      nodejs = {
        symbol = "";
        format = " [](fg:#84ba64)[$symbol ($version)](italic fg:black bg:#84ba64)[](fg:#84ba64)";
      };

      deno = {
        symbol = "∫";
        format = " [](fg:#6af2a6)[$symbol $version](italic fg:black bg:#6af2a6)[](fg:#6af2a6)";
      };

      package = {
        symbol = "󰏗";
        format = " [](fg:#ffc832)[$symbol $version](italic fg:black bg:#ffc832)[](fg:#ffc832)";
      };

      rust = {
        symbol = "";
        format = " [](fg:#994d0d)[$symbol $version](italic fg:black bg:#994d0d)[](fg:#994d0d)";
      };

      azure = {
        symbol = " ";
      };

      dotnet = {
        symbol = "󰪮";
        format = " [](fg:#7114e7)[$symbol ($version)](italic fg:black bg:#7114e7)[](fg:#7114e7)";
      };
    };
  };
}
