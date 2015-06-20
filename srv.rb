require 'sinatra'
require 'sinatra/activerecord'
require "#{File.dirname(__FILE__)}/dbase.rb"


db = Dbase.new
db.connect

user = Users.new
building = Buildings.new

#Actions with users
get '/new_u' do
  	user.create(params[:name], params[:surname])
end

get '/read_u' do
  	user.read(params[:id])
end

get '/del_u' do
	building.delete_by_owner(params[:id])
  	user.delete(params[:id])
end

#Actions with buildings
get '/new_b' do
	building.create(params[:id], params[:x], params[:y], params[:type])
	user.inc(params[:id])
end

get '/read_b' do
	building.read(params[:id])
end

get '/del_b' do
	building.delete(params[:id])
	user.dec(params[:owner_id])
end
