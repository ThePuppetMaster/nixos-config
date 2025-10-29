# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/vda";
        useOSProber = false;
      };
    };
    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Enable zram.
  zramSwap.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  i18n = {
    defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.
    extraLocaleSettings = {
      LC_ADDRESS = "pl_PL.UTF-8";
      LC_IDENTIFICATION = "pl_PL.UTF-8";
      LC_MEASUREMENT = "pl_PL.UTF-8";
      LC_MONETARY = "pl_PL.UTF-8";
      LC_NAME = "pl_PL.UTF-8";
      LC_NUMERIC = "pl_PL.UTF-8";
      LC_PAPER = "pl_PL.UTF-8";
      LC_TELEPHONE = "pl_PL.UTF-8";
      LC_TIME = "pl_PL.UTF-8";
    };
  };

  # Configure console keymap.
  console.keyMap = "pl2";

  # Configure networking.
  networking = {
    hostName = "nixos-vm"; # Define your hostname.
    networkmanager.enable = true; # Enable networking.
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    firewall = {
      #enable = false; # Disable firewall altogether.

      # Open ports in the firewall.
      allowedTCPPorts = [ 22 ];
      #allowedUDPPorts = [ ... ];
    };

    # Configure network proxy if necessary.
    proxy = {
      #default = "http://user:password@proxy:port/";
      #noProxy = "127.0.0.1,localhost,internal.domain";
    };
  };

  # Define a user accounts. Don't forget to set a password with ‘passwd’.
  users.users = {
    developer = {
      isNormalUser = true;
      description = "Developer";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  services = {
    # Configure keymap in X11
    xserver.xkb = {
      layout = "pl";
      variant = "";
    };

    # Enable the OpenSSH daemon.
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no"; # disable root login
        #PasswordAuthentication = false; # disable password login
      };
    };

    spice-vdagentd.enable = true; # Whether to enable Spice guest vdagent daemon.
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
