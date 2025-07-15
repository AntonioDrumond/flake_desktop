{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time = {
    timeZone = "America/Sao_Paulo";
    # timeZone = "Europe/Dublin";
    # timeZone = "Atlantic/Reykjavik";
    hardwareClockInLocalTime = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services = {
    xserver = {
      enable = true;
      wacom.enable = true;
      xkb.layout = "us";
      videoDrivers = [ "amdgpu" ];
    };
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
    };
    desktopManager.plasma6.enable = true;
  };

  # Configure console keymap
  # console.keyMap = "br-abnt2";
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable sound
  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };

  # Audio fix
  hardware.enableAllFirmware = true;
  boot.extraModprobeConfig = ''
    options snd-intel-dspcfg dsp_driver=1
  '';

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.antonio = {
    isNormalUser = true;
    description = "Antonio Drumond";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "video"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  programs = {
    # Firefox
    firefox.enable = true;

    # Steam
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    # Starship
    starship = {
      enable = true;
      settings = {
        add_newline = true;
        # "$schema" = "https://starship.rs/config-schema.json";
        character = {
          success_symbol = "[❯](bold green)";
          error_symbol = "[❯](bold bright green)";
        };
        nix_shell = {
          symbol = " ";
          heuristic = false;
        };
        username = {
          show_always = true;
          style_user = "green bold";
          style_root = "bright-red bold";
        };
        os.disabled = false;
        # palette = "catppuccin_${"mocha"}";
      };
    };

  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "ventoy-1.1.05" ];
  };

  # Global system packages
  environment.systemPackages = with pkgs; [

    #CLI -> Essential
    vim
    git
    wezterm
    ghostty
    fzf
    zip
    unzip
    inputs.nixvim.packages.${pkgs.system}.default # NixVim

    #CLI -> Pretty and shiny :D
    bat
    tree
    eza # -> better to do in programs. but couldnt yet
    neofetch
    superfile
    du-dust

    #Image stuff
    pix
    rawtherapee
    krita

    #Non raw text
    obsidian
    foliate
    vscode

    #Torrenting and stuff
    # qbittorrent
    # mullvad

    #Nonfree entertainment
    stremio
    discord
    spotify

    #Virtual Machine
    quickemu
    spice

    #Hardware/Libs
    ventoy
    gparted
    fan2go
    radeontop
    btop
    passmark-performancetest
    amdgpu_top
    amdvlk
    mesa

    #Other
    kdePackages.kcalc
    cava
    librewolf-bin
    jetbrains-mono
    floorp
    mars-mips
    blender-hip
  ];

  environment.localBinInPath = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # DO NOT CHANGE
  system.stateVersion = "24.11"; # Did you read the comment?

}
