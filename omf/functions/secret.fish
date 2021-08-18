function secret
    if not set -q BW_SESSION
        set -lx session (bw unlock --raw)
        
        if test $status -eq 0
            set -Ux BW_SESSION $session
        else
            echo $session
            return 1
        end
    end

    bw $argv
end
