function update --description "Update OS packages"
    brew update
    brew upgrade
    brew cleanup
    omf update
end
