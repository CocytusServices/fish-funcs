function fish_prompt
    eval $global_go_bin/powerline-go -error $status -colorize-hostname -modules venv,user,node,termtitle,host,cwd,perms,git,jobs,exit,root -jobs (jobs -p | wc -l)
end
