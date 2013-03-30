#
# Cookbook Name:: base
# Recipe:: redis
#
# Copyright 2013, Alexandr Lispython (alex@oout.ru)
#
# All rights reserved - Do Not Redistribute
#

(node['base']['packages'] + node['base']['extra-packages']).uniq.each do |pkg|
    package pkg
end
