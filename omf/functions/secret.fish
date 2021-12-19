function secret
    set bw_status (bw status | jq -r '.status')

    if test $bw_status = 'locked'
        set session (bw unlock --raw)

        if not test $status -eq 0
            echo "Error: Bitwarden is not unlocked!"
            exit 1
        end

        set -Ux BW_SESSION $session
    end

    bw $argv
end
