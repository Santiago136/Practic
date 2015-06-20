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
	validates :user_id, presence: true
	@user

	def create(n, sn)
		last_user = Users.last
		if last_user != nil
			@user = Users.create(user_id: last_user.user_id+1, name: "#{n}", surname: "#{sn}").valid?
		else
			@user = Users.create(user_id: 1, name: "#{n}", surname: "{sn}").valid?	
		end
		#"Created: #{@user.name} #{@user.surname} with number: #{@user.user_id} "
		"Created"
	end

	def read
		@user = Users.last
		"#{@user.name}"
	end

	def delete(id)
		@user = Users.find_by(user_id: id)
		if (@user != nil)
   			@user.destroy
			"User and user's buildings were deleted"
		else
			"There were nothing to delete"
		end
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
		#"Created: id: #{@building.id}, owner: #{@building.owner_id}, x: #{@building.x}, y: #{@building.y}"
		"Created"
	end

	def read
		@building = Buildings.last
		"#{@building.id}"
	end
	
	#Удаление по id 
	def delete(b_id)
		@building = Buildings.find_by(id: b_id)
  		@building.destroy
		"Building deleted"
	end

	#Удаление по хозяину
	def delete_by_owner(o_id)
		@building = Buildings.find_by(owner_id: o_id)
		if (@building != nil)
  			@building.destroy
		end
	end
end

