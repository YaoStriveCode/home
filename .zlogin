# Display fortune
if which fortune >/dev/null 2>&1 && [ ! -f ~/.hushlogin ] && [ ! -f ~/.no_fortune_motd ]; then
  echo
  fortune -a | sed -e 's/^/    /'
  echo
fi
