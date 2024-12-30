require 'pg'

connection = PG.connect(
	dbname: 'Students_Ruby',
	user: "postgres",
	password: "password",
	host:"localhost",
	port:5432
)