function fish_prompt
    set_color brwhite
    echo ""
    if test $status -eq 0
        echo -n "😃"
    else
        echo -n "😞"
    end
    echo -n " "
    echo -n (prompt_pwd --dir-length=0)
    set_color bryellow
    set -g __fish_git_prompt_showupstream auto
    echo (fish_vcs_prompt)
    set_color green
    echo -n "> "
end
