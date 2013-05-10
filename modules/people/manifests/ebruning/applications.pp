class people::ebruning::applications {
  include dropbox
  include chrome
  include sublime_text_2
  include mou
  include iterm2::stable
  include zsh
  include onepassword
  include handbrake
  include spotify
  include vim
  include vlc
  include istatmenus4
  include transmit
  include macvim

  notice ("Installing specific applications for ${::hostname}")  
  case $::hostname {
    'ebruning-imac': {
      include crashplan
      include mailplane::beta
      include appcode
    }
    
    'ebruning-mbp': { 
      include mailplane::stable   
      include xquartz  
      include secondbar
      include reflector  
    }
    
    default: {
      notice ("Unknown hostname")
    }
  }
}
