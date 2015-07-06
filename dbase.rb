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
	def self.create(n, sn)
		string = '<?xml version="1.0" encoding="utf-8"?><doc>'
		last_user = Users.last
		if last_user != nil
			@user = Users.create(id: last_user.id+1, name: "#{n}", surname: "#{sn}", num_of_buildings: 0, deposit: 0).valid?
		else
			@user = Users.create(id: 1, name: "#{n}", surname: "#{sn}", num_of_buildings: 0, deposit: 0).valid?	
		end
		string = "<status st='Created'/></doc>"
		string
	end

	#Getting user's info
	def self.read(u_id)
		string = '<?xml version="1.0" encoding="utf-8"?>'

		@user = Users.find_by(id: u_id)
		if @user != nil
			string += "<doc><user name='#{@user.name}' surname='#{@user.surname}' deposit='#{@user.deposit}'/></doc>"
		else
			string += "<doc><status st='Error'/></doc>"
		end
		string

	end

	#Deleting user by id
	def self.delete(u_id)
		string = '<?xml version="1.0" encoding="utf-8"?>'

		@user = Users.find_by(id: u_id)
		if (@user != nil)
   			@user.destroy

			string += "<doc><status st='Deleted'/></doc>"
		else
			string += "<doc><status st='Error'/></doc>"
		end
		string

	end
	
	#Additional methods
	def self.inc(u_id)
		@user = Users.find_by(id: u_id)
		@user.num_of_buildings = @user.num_of_buildings + 1
		@user.save
	end
	
	def self.dec(u_id)
		@user = Users.find_by(id: u_id)
		@user.num_of_buildings = @user.num_of_buildings - 1
		@user.save
	end

	def self.find_num(u_id)
		@user = Users.find_by(id: u_id)
		if @user != nil
			@user.num_of_buildings
		else 
			"error" 
		end
	end	

	#To the future (after this method let's check return value and create a new building
	def self.buy(u_id, w_type)
		buying_building = Shop.find_by(work_type: w_type)
		@user = Users.find_by(id: u_id)
		if @user.deposit - buying_building.price >= 0
			@user.deposit -= price
			true
		else
			false
		end
	end
end


class Buildings < ActiveRecord::Base
	validates :id, presence: true
  	@building
	
	#Creating a new building
	def self.create(o_id, xx, yy, w_type)
		string = '<?xml version="1.0" encoding="utf-8"?><doc>'
		check = Buildings.find_by(x: xx, y: yy, owner_id: o_id)
		if check == nil
			last_building = Buildings.last
			if last_building != nil
			  	@building = Buildings.create(id: last_building.id+1, owner_id: o_id, x: xx, y: yy, work_type: w_type).valid?
			else
				@building = Buildings.create(id: 1, owner_id: o_id, x: xx, y: yy, work_type: w_type).valid?
			end
			string = "<status st='Created'/></doc>" 
		else
			string = "<status st='Error'/></doc>"
		end
		string
		
	end

	#Getting user's buildings info
	def self.read(o_id, num_of_buildings)
		string = '<?xml version="1.0" encoding="utf-8"?><doc>'
		if num_of_buildings != nil
			string = "<user id='#{o_id}'>"
			@building = Buildings.where("owner_id = ?", o_id)
			if @building!= nil
				@building.each do |building|	
					string += "<building id='#{building.id}' work_type='#{building.work_type}' x='#{building.x}' y='#{building.y}'/><br>"
				end
			string += "</user>"
			end
			string += "</doc>"
		else
			string += "<status st='Error'/></doc>"
		end
		string
	end
	
	#Moving building
	def self.move(b_id, xx, yy)
		check = Buildings.find_by(x: xx, y: yy)	

		if check == nil
			@building = Buildings.find_by(id: b_id)	
			@building.x = xx
			@building.y = yy
			@building.save
		else
			string = '<?xml version="1.0" encoding="utf-8"?><doc>'
			string += "<status st='Error'/></doc>"
		end	
	end

	#Delete by id 
	def self.delete(b_id)
		string = '<?xml version="1.0" encoding="utf-8"?><doc>'
		@building = Buildings.find_by(id: b_id)
		if (@building != nil)
  			@building.destroy
			string = "<status st='Deleted'/></doc>"
		else
			string = "<status st='Error'/></doc>"
		end

	end

	#Additional methods
	def self.find_owner(b_id)
		@building = Buildings.find_by(id: b_id)
		@building.owner_id
	end

	#Delete by owner
	def self.delete_by_owner(o_id, num_of_buildings)
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
