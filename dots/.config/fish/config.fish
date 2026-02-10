# function fish_prompt -d "Write out the prompt"
#     # This shows up as USER@HOST /home/user/ >, with the directory colored
#     # $USER and $hostname are set by fish, so you can just use them
#     # instead of using `whoami` and `hostname`
#     printf '%s@%s %s%s%s > ' $USER $hostname \
#         (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
# end

if status is-interactive
    # Commands to run in interactive sessions can go here
        #	set -U SPACEFISH_PROMPT_ADD_NEWLINE false
    set -U SPACEFISH_EXIT_CODE_SHOW true
    set -U SPACEFISH_EXIT_CODE_SYMBOL
    set -U FZF_LEGACY_KEYBINDINGS 0
    set -U SPACEFISH_TIME_SHOW true

    alias hddd='sudo hdparm -y /dev/sdb /dev/sdd /dev/sde'
    alias hdds='sudo hdparm -C /dev/sdb /dev/sdd /dev/sde'
    alias venv='python -m venv'
    alias venv38='python3.8 -m venv'
    alias activate='source bin/activate.fish'
    alias ls='ls --color=auto'
    alias getpass='pwgen -ysBv'
    alias lsd='lsd -l'
    alias pamcan=pacman
    alias ls='eza --icons'
    alias pamcan pacman
    alias clear "printf '\033[2J\033[3J\033[1;1H'" # fix: kitty doesn't clear properly
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"


    # No greeting
    set fish_greeting

    alias ls 'eza --icons'
    alias pamcan pacman
    alias q 'qs -c ii'

    set fish_greeting

end

# starship init fish | source

#if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
#    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
#end

# Aliases
