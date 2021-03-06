# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "1.3.0"
# github "boxen", "2.0.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "gcc",           "1.0.0"
github "git",           "1.2.2"
github "homebrew",      "1.1.2"
github "hub",           "1.0.0"
github "inifile",       "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "ruby",          "3.3.1"
github "stdlib",        "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",          "1.0.0"
     
## System
github "osx",           "1.1.0"
github "zsh",           "1.0.0"
github "xquartz",     	"1.1.0"

## Programming
github "sublime_text_2",        "1.1.0"
github "java",                  "1.0.6"
github "heroku",                "1.0.0"
github "intellij",              "1.1.3"
github "ctags",                 "1.0.0"
github "github_for_mac",        "1.0.1"

## Browsers
github "chrome",                "1.1.0" 
github "firefox",               "1.0.5"

## Applications
github "dropbox",               "1.1.0" 
github "mou",                   "1.0.0"
github "iterm2",                "1.0.1"
github "onepassword",           "1.0.0"
github "handbrake",             "1.0.0"
github "hipchat",               "1.0.1"
github "slate",                 "1.0.0"
github "cyberduck",             "1.0.0"
github "crashplan",             "1.0.1"
github "spotify",               "1.0.0"
github "magican",               "1.0.1"
github "vim",                   "1.0.2"
github "virtualbox",            "1.0.1"
github "crashplan",             "1.0.1"
github "istatmenus4",           "1.0.0"
github "secondbar",             "1.0.1"
github "macvim",                "1.0.0" 
github "vlc",                   "1.0.0" 
github "transmit",              "1.0.0"
#github "better_touch_tools",    "1.0.0"
github "reflector",             "1.0.0", :repo => "LudereSolutions/puppet-reflector"
github "appcode",               "0.0.1", :repo => "LudereSolutions/puppet-appcode"
