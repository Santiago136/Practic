require 'sinatra'
require 'sinatra/activerecord'
require "#{File.dirname(__FILE__)}/dbase.rb"
set :public_folder, 'public'


db = Dbase.new
db.connect

#Actions with users

get '/enter/:id-:name-:surname' do
	Users.create_new(params[:id], params[:name], params[:surname])
	Buildings.read(params[:id])
end

get '/read_u/:id' do
  	Users.read(params[:id])
end

get '/del_u/:id' do
  	Users.del(params[:id])
end

#Actions with buildings
get '/new_b/:id-:work_type-:x-:y' do
	Buildings.create_new(params[:id],params[:work_type], params[:x], params[:y])
	Buildings.read(params[:id])
end

get '/read_b/:owner' do
	Buildings.read(params[:owner])
end

get '/move/:id-:owner-:x-:y' do
	Buildings.move(params[:id], params[:owner], params[:x], params[:y])
	Buildings.read(params[:owner])
end

get '/del_b/:id-:owner' do
	Buildings.del(params[:id], params[:owner])
	Buildings.read(params[:owner])
end


