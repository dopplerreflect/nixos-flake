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

  home.file = {
    ".config/alacritty/alacritty.yml".text = builtins.readFile ./config/alacritty/alacritty.yml;
    # ".config/alacritty/alacritty.yml".text = ''
    #   {
    #     "window": {
    #       "opacity": 0.8
    #     },
    #     "key_bindings": [
    #       { "key": "F", "mods": "Command|Control", "action": "ToggleFullscreen" },
    #       { "key": "W", "mods": "Command", "action": "CreateNewWindow" }
    #     ]
    #   }
    # '';
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

  home.stateVersion = "22.05";

}
