require 'pg'

connection = PG.connect(
	dbname: 'Students_Ruby',
	user: "postgres",
	password: "password",
	host:"localhost",
	port:5432
)

result = connection.exec("SELECT * FROM student")

result.each{|row| puts row}