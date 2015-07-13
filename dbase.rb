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
	#Creating a new user
	def self.create_new(u_id, n, sn)
		@user = Users.find_by(id: u_id)
		if @user == nil
			@user = Users.create(id: u_id, name: n, surname: sn, deposit: 0)
		end
	end

	#Getting user's info
	def self.read(u_id)
		string = '<?xml version="1.0" encoding="utf-8"?>'

		@user = Users.find_by(id: u_id)
		if @user != nil
			string += "<doc><user name='#{@user.name}' surname='#{@user.surname}' deposit='#{@user.deposit}'/></doc>"
		else
			string += "<doc><status st='error'/></doc>"
		end
		string
	end

	#Deleting user by id
	def self.del(u_id)
		string = '<?xml version="1.0" encoding="utf-8"?>'
		@user = Users.find_by(id: u_id)
		if (@user != nil)
   			@user.destroy
			string += "<doc><status st='deleted'/></doc>"
		else
			string += "<doc><status st='error'/></doc>"
		end
		string

	end

	#To the future (after this method let's check return value and create a new building
	def self.buy(u_id, w_type)
		string = '<?xml version="1.0" encoding="utf-8"?>'
		buying_building = Shop.find_by(work_type: w_type)
		@user = Users.find_by(id: u_id)
		if @user.deposit - buying_building.price >= 0
			@user.deposit -= price
			string += "<doc><status st='done'/></doc>"
		else
			string += "<doc><status st='error'/></doc>"
		end
	end
end


class Buildings < ActiveRecord::Base
  	@building
	#Creating a new building
	def self.create_new(o_id, w_type, xx, yy)
		check = Buildings.find_by(x: xx, y: yy, owner: o_id)
		if check == nil
			@building = Buildings.create(owner: o_id, work_type: w_type, x: xx, y: yy).valid?
		end
		
	end

	#Getting user's buildings info
	def self.read(o_id)
		@user
		string = '<?xml version="1.0" encoding="utf-8"?><doc>'
		@user = Users.find_by(id: o_id)	
		string += "<doc><user name='#{@user.name}' surname='#{@user.surname}' deposit='#{@user.deposit}'/></doc>"
		@building = Buildings.where("owner = ?", o_id)
		if @building!= nil
			@building.each do |building|	
				string += "<building id='#{building.id}' work_type='#{building.work_type}' x='#{building.x}' y='#{building.y}'/>"
			end
			string += "</user></doc>"
		end
		string
	end
	
	#Moving building
	def self.move(b_id, o_id, xx, yy)
		check = Buildings.find_by(owner: o_id, x: xx, y: yy)	
		if check == nil
			@building = Buildings.find_by(id: b_id)	
			@building.x = xx
			@building.y = yy
			@building.save
		end	
	end

	#Delete by id 
	def self.del(b_id, o_id)
		@building = Buildings.find_by(id: b_id, owner: o_id)
		if (@building != nil)
  			@building.destroy
		end
	end
end

