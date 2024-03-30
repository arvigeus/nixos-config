{...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = ["erasedups" "ignoredups"];
  };
}
