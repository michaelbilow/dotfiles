smart() {
  on=$(defaults read NSGlobalDomain NSAutomaticDashSubstitutionEnabled)
  if [ "$on" -eq "1" ]; then
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
    echo "Smart quotes/dashes disabled"
  else
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool true
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool true
    echo "Smart quotes/dashes enabled"
  fi
}
