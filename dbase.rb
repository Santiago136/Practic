require 'sinatra'
require 'sinatra/activerecord'


class Dbase
	def connect
		ActiveRecord::Base.establish_connection(
  			:adapter  => 'postgresql',
  			:host     => 'localhost',
			:port 	  => '5432',
   			:username => 'santiago',
   			:password => '940412',
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
		@user = Users.all
		"#{@user.name}"
	end

	def delete(id)
		@user = Users.find_by(user_id: id)
   		@user.destroy
		"User and table were deleted"
	end
end


class Buildings < ActiveRecord::Base
  	@building
	def create
		  @building = Buildings.create(building_id: 1, owner_id: 1, x: 0, y: 0)
		  "Created: id: #{@building.building_id}, owner: #{@building.owner_id}, x: #{@building.x}, y: #{@building.y}"
	end

	def read
		  @building = Buildings.all
		  "#{@building.id}"
	end
	
	#Удаление по id 
	def delete(b_id)
		@building = Buildings.find_by(building_id: b_id)
  		@building.destroy
		"Building deleted"
	end
	#Удаление по хозяину
	def delete_by_owner(o_id)
		@building = Buildings.find_by(owner_id: o_id)
  		@building.destroy
	end
end

