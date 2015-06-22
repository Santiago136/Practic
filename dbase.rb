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
	validates :id, presence: true
	@user

	#Creating a new user
	def create(n, sn)
		check = Users.find_by(name: n, surname: sn)
		if check == nil
			last_user = Users.last
			if last_user != nil
				@user = Users.create(id: last_user.id+1, name: "#{n}", surname: "#{sn}", num_of_buildings: 0).valid?
			else
				@user = Users.create(id: 1, name: "#{n}", surname: "#{sn}", num_of_buildings: 0).valid?	
			end
			"Created"
		else
			"There is a user with these name and surname"
			#Should return error value for client 
		end
	end

	#Getting user's info
	def read(u_id)
		@user = Users.find_by(id: u_id)
		if @user != nil
			string = '<?xml version="1.0" encoding="utf-8"?>'
			File.open('info.xml', 'w'){ |file| file.write string }
			string = "<doc><name>#{@user.name}</name><br><surname>#{@user.surname}</surname><br><id>#{@user.id}</id></doc>"
			File.open('info.xml', 'a'){ |file| file.write string }
			string = File.open('info.xml', 'r'){ |file| file.read }
			string

		else
			"There is no user with this ID"
			#Should return error value for client 
		end
	end

	#Deleting user by id
	def delete(u_id)
		@user = Users.find_by(id: u_id)
		if (@user != nil)
   			@user.destroy
			"User and user's buildings were deleted"
		else
			"There is nothing to delete"
			#Should return error value for client 
		end
	end
	
	#Additional methods
	def inc(u_id)
		@user = Users.find_by(id: u_id)
		@user.num_of_buildings = @user.num_of_buildings + 1
		@user.save
	end
	
	def dec(u_id)
		@user = Users.find_by(id: u_id)
		@user.num_of_buildings = @user.num_of_buildings - 1
		@user.save
	end

	def find_num(u_id)
		@user = Users.find_by(id: u_id)
		if @user != nil
			@user.num_of_buildings
		else 
			"error"
		end
	end	
end


class Buildings < ActiveRecord::Base
	validates :id, presence: true
  	@building
	
	#Creating a new building
	def create(o_id, xx, yy, w_type)
		check = Buildings.find_by(x: xx, y: yy, owner_id: o_id)
		if check == nil
			last_building = Buildings.last
			if last_building != nil
			  	@building = Buildings.create(id: last_building.id+1, owner_id: o_id, x: xx, y: yy, work_type: w_type).valid?
			else
				@building = Buildings.create(id: 1, owner_id: o_id, x: xx, y: yy, work_type: w_type).valid?
			end
			"Created"
		else
			"There is a building on this point"
			#Should return error value for client 
		end
		
	end

	#Getting building's info
	def read(b_id)
		@building = Buildings.find_by(id: b_id)
		if @building != nil
			string = '<?xml version="1.0" encoding="utf-8"?>'
			File.open('info.xml', 'w'){ |file| file.write string }
			string = "<doc><id>#{@building.id}</id><br><work_type>#{@building.work_type}</work_type><br><x>#{@building.x}</x><br><y>#{@building.y}</y></doc>"
			File.open('info.xml', 'a'){ |file| file.write string }
			string = File.open('info.xml', 'r'){ |file| file.read }
			string

		else
			"There is no building with this ID"
			#Should return error value for client 
		end
	end
	
	#Delete by id 
	def delete(b_id)
		@building = Buildings.find_by(id: b_id)
		if (@building != nil)
  			@building.destroy
			"Building deleted"
		else
			"There is nothing to delete"
			#Should return error value for client 
		end

	end

	#Additional methods
	def find_owner(b_id)
		@building = Buildings.find_by(id: b_id)
		@building.owner_id
	end

	#Delete by owner
	def delete_by_owner(o_id, num_of_buildings)
		if num_of_buildings != "error"
			num_of_buildings.downto(0) {
				@building = Buildings.find_by(owner_id: o_id)
				if (@building != nil)
					@building.destroy
				end
			}
		end
	end
end

