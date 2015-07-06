require 'sinatra'
require 'sinatra/activerecord'
require "#{File.dirname(__FILE__)}/dbase.rb"


db = Dbase.new
db.connect

#Actions with users
get '/new_u/:name-:surname' do
  	Users.create(params[:name], params[:surname])
end

get '/read_u/:id' do
  	Users.read(params[:id])
end

get '/del_u/:id' do
	Buildings.delete_by_owner(params[:id], Users.find_num(params[:id]))
  	Users.delete(params[:id])
end

#Actions with buildings
get '/new_b/:id-:work_type-:x-:y' do
	Users.inc(params[:id])
	Buildings.create(params[:id], params[:x], params[:y], params[:work_type])
end

get '/read_b/:owner_id' do
	Buildings.read(params[:owner_id], Users.find_num(params[:owner_id]))
end

get '/move/:id-:x-:y' do
	Buildings.move(params[:id], params[:x], params[:y])
end

get '/del_b/:id' do
	Users.dec(Buildings.find_owner(:id) )
	Buildings.delete(params[:id])
end


