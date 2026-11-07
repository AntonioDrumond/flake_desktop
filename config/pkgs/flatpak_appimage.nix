{ ... }:
{
    services.flatpak = {
        enable = true;
        packages = [
            { appId = "com.spotify.Client"; origin = "flathub"; }
            { appId = "com.stremio.Stremio"; origin = "flathub"; }
            { appId = "md.obsidian.Obsidian"; origin = "flathub"; }
            { appId = "net.waterfox.waterfox"; origin = "flathub"; }
            { 
                flatpakref = "https://flatpak.chronicler.pro/chronicler.flatpakref";
                sha256 = "1h4rabnmvvnp1v6hisb7i5jwiwq1wbymlaf8425ksh1lzrhzgq67";
            }
        ];
    };
    programs.appimage = {
        enable = true;
        binfmt = true;
    };
}
