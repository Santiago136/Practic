require 'sinatra'
require 'sinatra/activerecord'
require "#{File.dirname(__FILE__)}/dbase.rb"


db = Dbase.new
db.connect

user = Users.new
building = Buildings.new

get '/crt_u' do
	#dbase.connect
	user = User.create
  	#user.save
  	"Created: name: #{user.name}, id: #{user.user_id}"
end

get '/read_u' do
	#dbase.connect
 	user = User.read 
end

get '/del_u' do
	#dbase.connect
  	user = User.delete
  	"Deleted"
end

##############################################################
get '/crt_b' do
	building.create
end

get '/read_b' do
	bulding.read
end

get '/del_b' do
	bulding.delete
end
