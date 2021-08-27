function fish_title
  if [ $_ = 'fish' ]
    echo $USER'@'$hostname': '(prompt_pwd)
  else
    echo $_
  end
end
