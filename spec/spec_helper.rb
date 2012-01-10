require 'rubygems'
require 'bundler/setup'

require 'mongoid'
Bundler.require(:default, :development, :test)
require 'rolify'
require 'ammeter/init'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("godfather")
end

load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'
load File.dirname(__FILE__) + '/support/data.rb'