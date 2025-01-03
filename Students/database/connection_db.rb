require 'pg'

class ConnectionDB
	private attr_accessor :connection

	def initialize()
		self.connection = PG.connect(
			dbname: 'Students_Ruby',
			user: "postgres",
			password: "password",
			host:"localhost",
			port:5432
		)
	end

	def query(query, params=[])
		self.connection.exec_params(query, params)
	end
    
	def close()
		self.connection.close
	end

end
