require 'sinatra'
require 'sinatra/activerecord'


class Dbase
	def connect
		ActiveRecord::Base.establish_connection(
  			:adapter  => 'postgresql',
  			:host     => 'localhost',
				:port 	  => '5432',
   			:username => 'santiago',
   			:password => '136',
  			:database => 'game',
   			:encoding => 'utf8'
		)
	end
end


class Users < ActiveRecord::Base
	@user
	def create
		@user = Users.create(user_id: 1, name: "alex", surname: "safronov")
    "Created: name: #{@user.name}, id: #{@user.user_id}"
	end

	def read
		@user = Users.first
		"#{@user.name}"
	end

	def delete
		@user = Users.find_by(user_id: 1)
    @user.destroy
	end
end


class Buildings < ActiveRecord::Base
  @building
	def create
		  @building = Buildings.create(building_id: 1, owner_id: 1)
	end

	def read
		  @building = Buildings.first
		  "#{@building.id}"
	end

	def delete
		  @building = Buildings.find_by(owner_id: 1)
  		@building.destroy
	end
end


