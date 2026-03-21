function update --description "Update OS packages"
    if type -q brew
        brew update
        brew upgrade
        brew cleanup
    else if type -q paru
        paru -Syu --noconfirm
    end
    omf update
end
