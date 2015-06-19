require 'sinatra'
require 'sinatra/activerecord'
require "#{File.dirname(__FILE__)}/dbase.rb"


db = Dbase.new
db.connect

user = Users.new
building = Buildings.new

#Actions with users
get '/crt_u' do
  	user.create
end

get '/read_u' do
  	user.read
end

get '/del_u' do
  	user.delete
  	"Deleted"
end

#Actions with buildings
get '/crt_b' do
	building.create
end

get '/read_b' do
	building.read
end

get '/del_b' do
	building.delete
end
