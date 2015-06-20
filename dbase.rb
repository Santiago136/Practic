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

	def create(n, sn)
		last_user = Users.last
		if last_user != nil
			@user = Users.create(id: last_user.id+1, name: "#{n}", surname: "#{sn}", num_of_buildings: 0).valid?
		else
			@user = Users.create(id: 1, name: "#{n}", surname: "#{sn}", num_of_buildings: 0).valid?	
		end
		"Created"
	end

	def read(u_id)
		@user = Users.find_by(id: u_id)
		"#{@user.name}, #{@user.surname}, #{@user.id}"
	end

	def delete(u_id)
		@user = Users.find_by(id: u_id)
		if (@user != nil)
   			@user.destroy
			"User and user's buildings were deleted"
		else
			"There were nothing to delete"
		end
	end
	
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
end


class Buildings < ActiveRecord::Base
	validates :id, presence: true
  	@building

	def create(o_id, xx, yy, w_type)
		last_building = Buildings.last
		if last_building != nil
		  	@building = Buildings.create(id: last_building.id+1, owner_id: o_id, x: xx, y: yy, work_type: w_type).valid?
		else
			@building = Buildings.create(id: 1, owner_id: o_id, x: xx, y: yy, work_type: w_type).valid?
		end
		"Created"
	end

	def read(b_id)
		@building = Buildings.find_by(id: b_id)
		"#{@building.id}, #{@duilding.type}, #{@duilding.x}, #{@duilding.y}"
	end
	
	#Удаление по id 
	def delete(b_id)
		@building = Buildings.find_by(id: b_id)
		if (@building != nil)
  			@building.destroy
		else
			"Delete error"
		end
	end

	#Удаление по хозяину
	def delete_by_owner(o_id)
		@building = Buildings.find_by(owner_id: o_id)
		if (@building != nil)
  			@building.destroy
		end
	end
end

