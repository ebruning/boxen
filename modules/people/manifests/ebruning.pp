################################################################################
# Personal manifest file
# 
# TODO: Add symlinking for dotfiles
################################################################################

class people::ebruning {

  $home = "/Users/${::luser}"
  $dotfiles = "${home}/dotfiles"

  osx_chsh { $::luser:
    shell => '/opt/boxen/homebrew/bin/zsh',
    require => Package['zsh'],
  }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/zsh",
    require => Package['zsh'],
  }

  notice ("Bootstrapping for ${::luser}")
  notice ("Installing default packages")

  include people::ebruning::applications
  include people::ebruning::development
 
  # Configure git
  git::config::global { 
    'user.email':
    value  => 'ebruning@gmail.com';
    'user.name':
    value => 'Ethan Bruning';
    'push.default':
    value => 'simple'
  }

  # Download dotfiles
  repository { $dotfiles:
    source => 'ebruning/dotfiles'
  }
  
  file { "${home}/.zshrc":
    ensure => 'link',
    target => "${dotfiles}/zshrc"
  }

  file { "${home}/.vimrc":
    ensure => 'link',
    target => "${dotfiles}/vimrc"
  }

  # Create and copy themes for Xcode
  file { "${home}/Library/Developer/Xcode/UserData/FontAndColorThemes":
    ensure => "directory",
    owner  => "ebruning",
    group  => "staff",
    mode   => 750,
  }
}
