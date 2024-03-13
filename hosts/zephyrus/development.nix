
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    nixpkgs-fmt
    lapce
    helix
    dotnet-sdk
    nodejs_18
    rustup
    meld
    fira-code
    noto-fonts
    devbox
    distrobox
    bruno
    delta
    diffutils
  ];
}

