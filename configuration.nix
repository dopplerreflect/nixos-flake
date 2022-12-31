{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # workaround to fix sound issue
  # https://github.com/NixOS/nixpkgs/issues/198180
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.extraHosts = "10.42.0.1 wfbase";
  
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.utf8";
  console.keyMap = "dvorak";

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "ctrl:nocaps";
  };
  services.gnome.gnome-browser-connector.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  users.users.doppler = {
    isNormalUser = true;
    description = "doppler";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "plugdev" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  system.stateVersion = "22.05"; # Did you read the comment?

  security.sudo.wheelNeedsPassword = false;
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [ "googleearth-pro-7.3.4.8248" ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

}
