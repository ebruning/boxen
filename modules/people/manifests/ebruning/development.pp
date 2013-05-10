class people::ebruning::development {
  include ruby::1_8_7
  include ruby::1_9_3
  include java
  include github_for_mac
  include ctags

  class { 'intellij':
    edition => 'ultimate',
  }
} 
