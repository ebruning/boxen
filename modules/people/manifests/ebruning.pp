################################################################################
# Personal manifest file
# 
# TODO: Add symlinking for dotfiles
################################################################################

class people::ebruning {

  $home = "/Users/${::luser}"
  $dotfiles = "${home}/dotfiles"
  $vim_bundles = "${home}/.vim/bundle"

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
  include macvim
  
  class { 'intellij':
    edition => 'ultimate',
  }

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
  repository { 
    $dotfiles:
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

  # Install plugins for vim
  repository { 
    'vim-ios':
      path      => "${vim_bundles}/vim-ios",
      source    => 'eraserhd/vim-ios',
      provider  => 'git';
    'vim-kiwi':
      path      => "${vim_bundles}/vim-kiwi",
      source    => 'eraserhd/vim-kiwi',
      provider  => 'git';
    'nerdtree':
      path      => "${vim_bundles}/nerdtree",
      source    => 'scrooloose/nerdtree',
      provider  => 'git';
    'vim-easytags':
      path      => "${vim_bundles}/vim-easytags",
      source    => 'xolox/vim-easytags',
      provider  => 'git';
    'vim-fugitive':
      path      => "${vim_bundles}/vim-fugitive",
      source    => 'tpope/vim-fugitive',
      provider  => 'git';
    'vim-rake':
      path      => "${vim_bundles}/vim-rake",
      source    => 'tpope/vim-rake',
      provider  => 'git';
    'vim-commentary':
      path      => "${vim_bundles}/vim-commentary",
      source    => 'tpope/vim-commentary',
      provider  => 'git';
    'vim-bundler':
      path      => "${vim_bundles}/vim-bundler",
      source    => 'tpope/vim-bundler',
      provider  => 'git';
    'tabular':
      path      => "${vim_bundles}/tabular",
      source    => 'godlygeek/tabular',
      provider  => 'git'
  }

  # repository { $dotfiles:
  #   source => 'ebruning/dotfiles'
  # }

  # repository { $dotfiles:
  #   source => 'ebruning/dotfiles'
  # }

  # repository { $dotfiles:
  #   source => 'ebruning/dotfiles'
  # }

  # repository { $dotfiles:
  #   source => 'ebruning/dotfiles'
  # }

  # repository { $dotfiles:
  #   source => 'ebruning/dotfiles'
  # }

  # repository { $dotfiles:
  #   source => 'ebruning/dotfiles'
  # }

  # repository { $dotfiles:
  #   source => 'ebruning/dotfiles'
  # }

  # repository { $dotfiles:
  #   source => 'ebruning/dotfiles'
  # }

  # Need to check if sublime is installed before and dropbox is 
  # synced running this
  # Create symlinks for Sublime
  # $sublime_home = "${home}/Library/Application Support/Sublime Text 2"
  # file { "${sublime_home}/Packages":
  #   ensure => 'link',
  #   target => "${home}/Dropbox/AppData/SublimeText2/Packages"
  # }

  # file { "${sublime_home}/Settings":
  #   ensure => 'link',
  #   target => "${home}/Dropbox/AppData/SublimeText2/Settings"
  # }

  # file { "${sublime_home}/Installed Packages":
  #   ensure => 'link',
  #   target => "${home}/Dropbox/AppData/SublimeText2/Installed Packages"
  # }

  # file { "${sublime_home}/Prestine Packages":
  #   ensure => 'link',
  #   target => "${home}/Dropbox/AppData/SublimeText2/Prestine Packages"
  # }

  # Create default folders
  # Themes for Xcode
  file { "${home}/Library/Developer/Xcode/UserData/FontAndColorThemes":
    ensure => "directory",
    owner  => "ebruning",
    group  => "staff",
    mode   => 750,
  }

  exec { "curl -o ${home}/Library/Developer/Xcode/UserData/FontAndColorThemes/ObsidianCode.dvtcolortheme https://dl.dropboxusercontent.com/s/ifsok48ihf98ik2/ObsidianCode.dvtcolortheme?token_hash=AAHQiEQFrcO827CHynn1OdAQsNX2tb4biYcn8X5fqsK3Zg&dl=1":
          creates => "${home}/Library/Developer/Xcode/UserData/FontAndColorThemes/ObsidianCode.dvtcolortheme",
  }

  file { "${home}/bin":
    ensure => "directory",
    owner  => "ebruning",
    group  => "staff",
    mode   => 755,
  }
}
