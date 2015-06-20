require 'sinatra'
require 'sinatra/activerecord'
require "#{File.dirname(__FILE__)}/dbase.rb"


db = Dbase.new
db.connect

user = Users.new
building = Buildings.new

#Actions with users
get '/new_u' do
  	user.create("Santiago", "Safronov")
end

get '/read_u' do
  	user.read
end

get '/del_u' do
	building.delete_by_owner(1)
  	user.delete(1)
end

#Actions with buildings
get '/new_b' do
	building.create(100500, 10, 10, "factory")
end

get '/read_b' do
	building.read
end

get '/del_b' do
	building.delete(1)
end
