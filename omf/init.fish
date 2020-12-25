# Disable greeting
function fish_greeting
end

# Enable vim mode
# fish_vi_key_bindings

alias kubedemo="kubectl --kubeconfig=/Users/ivanovyordan/.kube/demo_cluster.yml"
alias kubestaging="kubectl --kubeconfig=/Users/ivanovyordan/.kube/staging_cluster.yml"
alias kubeproduction="kubectl --kubeconfig=/Users/ivanovyordan/.kube/production_cluster.yml"
alias kubeinfrastructure="kubectl --kubeconfig=/Users/ivanovyordan/.kube/infrastructure_cluster.yml"

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)
starship init fish | source

source "$HOME/.dotfiles.local/init.fish"
