{ config, pkgs, ... }:

{
  home.username = "doppler";
  home.homeDirectory = "/home/doppler";

  home.packages = with pkgs; [
    alacritty
    bitwarden
    btop
    firefox
    gimp
    google-chrome
    imagemagick
    inkscape
    slack
    vscode
  ];

  home.stateVersion = "22.05";

}