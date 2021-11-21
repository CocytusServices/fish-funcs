function wsl_gpg_extra -d "Set GPG agent to GPG4Win agent"
  export GPG_AGENT_SOCK=$HOME/.gnupg/S.gpg-agent.extra
  export GPG_AGENT_WIN=/mnt/c/Users/micro/AppData/Roaming/gnupg/S.gpg-agent.extra
  set GPGA_ALREADY_RUNNING (ps -auxww | grep -q "[n]piperelay.exe -v -ep -ei -s -a $HOME/.gnupg/tmp-gpg-extra"; echo $status)
  if test "$GPGA_ALREADY_RUNNING" -gt 0
    rm -f $GPG_AGENT_SOCK
    rm -f $HOME/.gnupg/tmp-gpg-extra
    cp $GPG_AGENT_WIN $HOME/.gnupg/tmp-gpg-extra
    socat UNIX-LISTEN:"$GPG_AGENT_SOCK,fork" EXEC:"$HOME/.config/fish/functions/npiperelay.exe -v -ep -ei -s -a $HOME/.gnupg/tmp-gpg-extra",nofork &> /dev/null &
    disown
  end
end
