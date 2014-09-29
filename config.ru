require 'rubygems'
require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'] || 'development')

require './config/boot'

map('/') { run RootController }
map('/documents') { run DocumentController }
map('/users') { run UserController }
map('/versions') { run VersionController }
map('/session') { run SessionController }
map('/permissions') { run PermissionController }
