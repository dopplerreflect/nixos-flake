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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
  };

  home.stateVersion = "22.05";

}