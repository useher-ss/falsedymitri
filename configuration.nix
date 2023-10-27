# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  hardware.opengl.driSupport32Bit = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "America/Phoenix";


  # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.autorun = true;
   services.xserver.displayManager.lightdm.enable = true;
   services.xserver.displayManager.autoLogin.enable = true; 
   services.xserver.displayManager.autoLogin.user = "ss";
   services.xserver.libinput.enable = true;
   services.xserver.libinput.touchpad.tapping = false;
   services.xserver.desktopManager.xfce.enable = true;
   services.xserver.displayManager.defaultSession = "xfce";
   services.picom.enable = true; 
  # Configure keymap in X11
   services.xserver.layout = "us";

  # Enable sound.
   sound.enable = true;
   hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.ss = {
     isNormalUser = true;
     extraGroups = [ "wheel" "sudo" "networkmanager"]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox
       tree
     ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   #=Albert=//
    albert
   #=Editors=//    
    vim 
    wget
    emacs
   #=Doom=//
    fd
    git
   #=fonts=//
    ubuntu_font_family
   #=Terminals=/
    guake
    terminator
   #=AV=//
    obs-studio
    olive-editor
    krita
    feh
    soundkonverter
    yt-dlp
    tartube-yt-dlp
   #=$=//
    zsh
    nix-zsh-completions
    zsh-better-npm-completion
    zsh-syntax-highlighting
    zsh-system-clipboard
    zsh-completions
    zsh-clipboard
    zsh-fast-syntax-highlighting 
    oh-my-zsh
    any-nix-shell 
    zi
   #=Theme=//
    oranchelo-icon-theme
    colloid-icon-theme
    yaru-theme
    rose-pine-gtk-theme
    colloid-gtk-theme
 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
   system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

