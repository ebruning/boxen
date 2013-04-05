class people::ebruning {
  notice ( "Bootstrapping for ${::luser}" )

  include dropbox
  include adium
  include chrome
  include sublime_text_2
  include mou
  include iterm2::stable
  include zsh
  include onepassword
  include handbrake
  include java
  include spotify
  include cyberduck
  include vim
  include firefox

  class { 'intellij':
    edition => 'ultimate',
  }

  notify { "Installing specific applications for ${::hostname}": }  
  case $::hostname {
    'ebruning-imac': {
      include crashplan
      include mailplane::beta
    }
    
    'ebruning-mbp': { 
      include mailplane::stable   
      include xquartz  
    }
    
    default: {
      notify { "Error: Unknown hostname": }
    }
  }

  # TODO: Get these working  
  #include launchbar
  #include vlc
  #include istatmenus4
  #include github_for_mac
}
