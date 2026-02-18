{ pkgs, ... }:
{
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "ventoy-1.1.07" /*"qtwebengine-5.15.19"*/ ];
    };

    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        jetbrains-mono
        nerd-fonts.jetbrains-mono
        font-awesome
    ];

    environment.systemPackages = with pkgs; [

        #CLI -> Essential
        vim
        git
        wezterm
        kitty
        fzf
        zip
        unzip
        rar
        unrar
        killall
        # inputs.nixvim.packages.${pkgs.system}.default # NixVim

        #CLI -> Pretty and shiny :D
        bat
        tree
        eza # -> better to do in programs. but couldnt yet
        neofetch
        fastfetch
        superfile
        dust
        yazi
        gemini-cli

        #Hyprland
        waybar
        hyprcursor
        hyprshot
        hyprpaper
        hypridle
        rofi

        #Image stuff
        pix
        rawtherapee
        krita
        vlc
        # davinci-resolve

        #Non raw text
        obsidian
        mcomix
        pdfslicer

        #Torrenting and stuff
        # qbittorrent
        # mullvad

        #Nonfree entertainment
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
        amdgpu_top
        mesa
        pavucontrol
        brightnessctl
        playerctl
        distrobox

        #Other
        kdePackages.kcalc
        cava
        jetbrains-mono
        mars-mips
        blender-hip
        pureref

        # Gaming
        prismlauncher
    ];
}
