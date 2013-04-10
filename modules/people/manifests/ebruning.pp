class people::ebruning {
  notice ("Bootstrapping for ${::luser}")

  notice ("Default packages")
  notice ("Installing Dropbox")
  include dropbox

  notice ("Installing Chrome")
  include chrome
  
  notice ("Installing Sublime Text 2")
  include sublime_text_2

  notice ("Installing Mou")
  include mou
  
  notice ("Installing iTerm")
  include iterm2::stable

  notice ("Installing ZSH")
  include zsh

  notice ("Installing 1Password")
  include onepassword

  notice ("Installing Handbrake")
  include handbrake

  notice ("Installing Java")
  include java

  notice ("Installing Spotify")
  include spotify

  notice ("Installing Vim")
  include vim

  notice ("Installing Firefox")
  include firefox

  notice ("Installing Intelli-J")
  class { 'intellij':
    edition => 'ultimate',
  }

  notice ("Installing specific applications for ${::hostname}")  
  case $::hostname {
    'ebruning-imac': {
      notice ("Installing Crashplan")
      include crashplan

      notice ("Installing Mailplane")
      include mailplane::beta
    }
    
    'ebruning-mbp': { 
      notice ("Installing Mailplane")
      include mailplane::stable   

      notice ("Installing XQuartz")
      include xquartz  

      notice ("Installing Secondbar")
      include secondbar  
    }
    
    default: {
      notice ("Unknown hostname")
    }
  }

  # TODO: Get these working  
#  include launchbar
  include vlc
  include istatmenus4
#  include github_for_mac
}
