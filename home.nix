{ config, pkgs, ... }:

{
  home.username = "doppler";
  home.homeDirectory = "/home/doppler";

  home.packages = with pkgs; [
    btop
    alacritty
    google-chrome
  ];

  home.stateVersion = "22.05";

}