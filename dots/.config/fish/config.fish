# Commands to run in interactive sessions can go here
if status is-interactive
    # No greeting
    set fish_greeting
    set -U SPACEFISH_EXIT_CODE_SHOW true
    set -U SPACEFISH_EXIT_CODE_SYMBOL
    set -U FZF_LEGACY_KEYBINDINGS 0
    set -U SPACEFISH_TIME_SHOW true
#    set -gx PUB_HOSTED_URL https://pub-azs.ir
#    set -gx FLUTTER_STORAGE_BASE_URL https://pub-azs.ir
#    set -gx PUB_HOSTED_URL https://mirror-flutter.runflare.com
#    set -gx FLUTTER_STORAGE_BASE_URL https://mirror-flutter.runflare.com
#    set -x HTTP_PROXY socks5://127.0.0.1:2334
#    set -x HTTPS_PROXY socks5://127.0.0.1:2334
#    set -x NO_PROXY git.hiveai.ir,130.185.77.224,localhost,127.0.0.1
    set -gx CHROME_EXECUTABLE chromium
    set -gx ANDROID_HOME /home/hossein/Android/Sdk
    set -gx ANDROID_SDK_ROOT /home/hossein/Android/Sdk
    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != "linux"
         starship init fish | source
        enable_transience
   end

    # Colors
   # if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    #    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    # end

    # Aliases
    # kitty doesn't clear properly so we need to do this weird printing
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias pamcan pacman
    alias q 'qs -c ii'
    if test "$TERM" != "linux"
        alias ls 'eza --icons'
    end
    if test "$TERM" = "xterm-kitty"
        alias ssh 'kitten ssh'
    end
end
