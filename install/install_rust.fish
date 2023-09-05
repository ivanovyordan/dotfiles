set -Ux RUSTUP_HOME $HOME/.apps/rust/rustup
set -Ux CARGO_HOME $HOME/.apps/rust/cargo

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

omf install rustup
omf reload

sudo apt install -y libssl-dev
cargo install cargo-edit just cargo-workspaces
