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
	def create
		@user = Users.create(user_id: '1', name: 'alex', surname: 'safa')
	end

	def read
		@user = Users.first
		"#{@user}"
	end

	def delete
		@user = Users.find_by(user_id: '1')
  		@user.destroy
	end
end



class Buldings < ActiveRecord::Base
	def create
		@building = Buldings.create(bulding_id: '1', owner_id: '1')		
	end
	
	def read
		@bulding = Buldings.first
		"#{@bulding}"
	end

	def delete
		@bulding = Buldings.find_by(owner_id: '1')
  		@bulding.destroy
	end
end


