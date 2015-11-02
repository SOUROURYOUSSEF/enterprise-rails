# add require for any concerns of other files that you need before starting rails

require 'concerns/user_associations'
require 'concerns/user_search'
# Need to call init.rb explictely since we are using it outside of main application
require 'sunspot/rails/init.rb'
