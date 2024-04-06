{pkgs, ...}: {
  home.packages = with pkgs; [eza];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = ["erasedups" "ignoredups"];
    shellAliases = {
      ls = "eza --icons -F -H --group-directories-first --git -1";
      ll = "ls -alF";
    };
  };
}
