# -*- coding: utf-8 -*-

name "base"
description "Base server configuration"

# List of recipes
run_list("recipe[apt]",
         "recipe[runit]",
         "recipe[build-essential]",
         "recipe[screen]",
         "recipe[emacs]",
         "recipe[base]",
         )


override_attributes "base" => {
  "extra-packages"=> ["git-core", "python", "python-dev", "subversion", "htop", "libyaml-dev", "mercurial"]
}
