function fish_ssh_agent -d "Set SSH agent to Windows SSH agent"
  export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
  set ALREADY_RUNNING (ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $status)
  if test "$ALREADY_RUNNING" -gt 0
    rm -f $SSH_AUTH_SOCK
    setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"/mnt/c/PATH/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &
  end
end
