{ config, pkgs, ... }:

{
  home.username = "doppler";
  home.homeDirectory = "/home/doppler";

  home.packages = with pkgs; [
    alacritty bitwarden btop deno ffmpeg firefox gimp git 
    gnome.dconf-editor gnome3.gnome-tweaks google-chrome 
    heroku imagemagick imv inkscape mpv nodejs slack unzip 
    vim virt-manager vscode yarn
  ];

  home.file = {
    ".config/alacritty/alacritty.yml".text = builtins.readFile ./config/alacritty/alacritty.yml;
  };
  
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

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/doppler/flake/Metatron.png";
      picture-uri-dark = "file:///home/doppler/flake/Metatron.png";
      picture-options = "zoom";
    };
  };
  home.stateVersion = "22.05";

}
