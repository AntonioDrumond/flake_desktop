{ pkgs, ... }:
{
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

    hardware.enableAllFirmware = true;
    boot.extraModprobeConfig = ''
        options snd-intel-dspcfg dsp_driver=1
    '';
}
