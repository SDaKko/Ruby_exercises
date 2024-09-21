class Student
	attr_accessor :name, :surname, :patronymic, :id, :number, :tg, :email, :git

	def initialize(surname, name, patronymic, id = nil, phone = nil, tg = nil, email = nil, git = nil)
		@id = id
		@surname = surname
		@name = name
		@patronymic = patronymic
		@phone = phone
		@tg = tg
		@email = email
		@git = git
	end

	def to_s
		str = "surname = #{@surname}, name = #{@name}, patronymic = #{@patronymic}"
		str += ", id = #{@id}" if @id
	    str += ", phone = #{@phone}" if @phone
	    str += ", tg = #{@tg}" if @tg
	    str += ", email = #{@email}" if @email
	    str += ", git = #{@git}" if @git
	    return str
	end

end
