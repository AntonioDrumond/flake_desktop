# FZF Utils
alias fzf='fzf --preview="bat --color=always {}"'
alias ff='cd $(find * -type d | fzf)'
alias vzf='vi $(fzf)'

# OS Utils
# alias nixconf='sudo -E vim /etc/nixos/configuration.nix'
alias rebSwitch='sudo nixos-rebuild switch --flake ~/repos/flake_desktop/'
alias rebBoot='sudo nixos-rebuild boot --flake ~/repos/flake_desktop/'

# Other
alias la='ls -a'
alias radeontop='radeontop --color'

# Ricing
alias imgcat='wezterm imgcat'
alias ls='exa --icons --group-directories-first'

# alias nvim="nix run 'github:antoniodrumond/nixvim'"

export EDITOR="vim"

# nerd
# neofetch
