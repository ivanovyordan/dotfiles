function copy --description "Copy stdin to clipboard"
    if type -q pbcopy
        pbcopy
    else if type -q xclip
        xclip -sel clip
    else
        kitty +kitten clipboard
    end
end
