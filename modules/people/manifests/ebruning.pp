class people::ebruning {
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

	class { 'intellij':
  	edition => 'ultimate',
	}

	#heroku::plugin { 'accounts':
  #		source => 'ddollar/heroku-accounts'
	#}

	#include vlc
	#include istatmenus4

}
