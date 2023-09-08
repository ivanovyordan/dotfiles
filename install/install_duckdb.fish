function install_duckdb_macos
    brew install duckdb
end

function install_duckdb_linux
    curl -LO https://github.com/duckdb/duckdb/releases/latest/download/duckdb_cli-linux-amd64.zip
    unzip duckdb_cli-linux-amd64.zip
    mv duckdb $HOME/.local/bin
    rm duckdb_cli-linux-amd64.zip
end

function main
    if test $argv[1] = Darwin
        install_duckdb_macos
    else
        install_duckdb_linux
    end
end

main $argv
