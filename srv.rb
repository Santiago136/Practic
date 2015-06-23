require 'sinatra'
require 'sinatra/activerecord'
require "#{File.dirname(__FILE__)}/dbase.rb"


db = Dbase.new
db.connect

user = Users.new
building = Buildings.new

#Actions with users
get '/new_u/:name-:surname' do
  	user.create(params[:name], params[:surname])
end

get '/read_u/:id' do
  	user.read(params[:id])
end

get '/del_u/:id' do
	building.delete_by_owner(params[:id], user.find_num(params[:id]))
  	user.delete(params[:id])
end

#Actions with buildings
get '/new_b/:id-:x-:y-:work_type' do
	user.inc(params[:id])
	out = building.create(params[:id], params[:x], params[:y], params[:work_type])
end

get '/read_b/:owner_id' do
	building.read(params[:owner_id], user.find_num(params[:owner_id]))
end

get '/move/:id-:x-:y' do
	buildind.move(params[:id], params[:x], params[:y])
end

get '/del_b/:id' do
	user.dec(building.find_owner(:id) )
	building.delete(params[:id])
end


