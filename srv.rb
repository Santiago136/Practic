require 'sinatra'
require 'pg'
require 'sinatra/activerecord'

##############################################################
get '/' do
	ActiveRecord::Base.establish_connection(
  		:adapter  => 'postgresql',
  		:host     => 'localhost',
      :port 		=> '5432',
   		:username => 'santiago',
   		:password => '136',
  		:database => 'game',
   		:encoding => 'utf8'
	)
  "Connected"
end

##############################################################
get '/crt_u' do
	class Users < ActiveRecord::Base
	end
	user = Users.create(user_id: '1', name: 'alex', surname: 'safa')
  user.save
  "Created: name: #{user.name}, id: #{user.user_id}"
end

get '/read_u' do
	class Users < ActiveRecord::Base
	end
  user = Users.first
  user.to_s
end

get '/del_u' do
	class Users < ActiveRecord::Base
	end
  user = Users.find_by(user_id: '1')
  user.destroy
  "Deleted"
end

##############################################################
get '/crt_b' do
	class Buldings < ActiveRecord::Base
	end
	bulding = Buldings.create(bulding_id: '1', owner_id: '1')
	bulding.save
	"Created builig: id: #{user.name}, owner: #{user.user_id}"
end

get '/read_b' do
	class Buldings < ActiveRecord::Base
	end
	bulding = Buldings.first
	temp = "bulding.to_s"
end

get '/del_b' do
	class Buldings < ActiveRecord::Base
	end
	bulding = Buldings.find_by(owner_id: '1')
  bulding.destroy
end
