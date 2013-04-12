################################################################################
# Personal manifest file
# 
# TODO: Add symlinking for dotfiles
################################################################################

class people::ebruning {

  $home = "/Users/${::luser}"
  $dotfiles = "${home}/dotfiles"

  notice ("Bootstrapping for ${::luser}")
  notice ("Installing default packages")
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
  include transmit
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

  # Download dotfiles
  repository { $dotfiles:
    source => 'ebruning/dotfiles'
  }
}
