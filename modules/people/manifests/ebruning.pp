class people::ebruning {
  notice ("Bootstrapping for ${::luser}")

  notice ("Default packages")
  include dropbox
  include chrome
  include sublime_text_2
  include mou
  include iterm2::stable
  include zsh
  include onepassword
  include handbrake
  include java
  include spotify
  include vim
  include firefox
  include ctags 
  include vlc
  include istatmenus4
  include github_for_mac
  class { 'intellij':
    edition => 'ultimate',
  }

  notice ("Installing specific applications for ${::hostname}")  
  case $::hostname {
    'ebruning-imac': {
      include crashplan
      include mailplane::beta
    }
    
    'ebruning-mbp': { 
      include mailplane::stable   
      include xquartz  
      include secondbar  
    }
    
    default: {
      notice ("Unknown hostname")
    }
  }
}
