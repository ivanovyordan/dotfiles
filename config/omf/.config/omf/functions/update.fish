function __update_apt
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean
end

function __update_flatpak
    flatpak update -y
    flatpak uninstall --unused -y
end

function __update_brew
    brew update
    brew upgrade
    brew cleanup
end

function update --description "Update OS packages"
    set kernel_name (uname -s | tr -d '\n')

    if test $kernel_name = "Linux"
        __update_apt
        __update_flatpak
    else
        __update_brew
    end

    omf update
end
