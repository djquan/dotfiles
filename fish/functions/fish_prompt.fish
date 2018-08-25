function fish_prompt --description 'Write out the prompt'
    echo ""
    switch "$status"
    case "0"
      set_color green
      echo -n ":) "
    case "*"
      set_color red
      echo -n ":( "
    end

    set_color purple
    echo -n "[$USER@"(prompt_hostname)"] "
    set_color brblue
    echo -n (prompt_pwd)

    set_color purple
    echo -n (__fish_git_prompt) 

    if jobs > /dev/null
      set_color bryellow
      echo -n "  ("(jobs -p | wc -l | tr -d " ")")"
    end

    set_color red
    echo ""
    echo -n "❤  "

    set_color white
end
