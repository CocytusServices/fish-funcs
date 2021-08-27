function fish_prompt
    eval ~/.config/fish/functions/powerline-go -error $status -colorize-hostname -modules venv,user,node,termtitle,host,cwd,perms,git,jobs,exit,root -jobs (jobs -p | wc -l)
end
