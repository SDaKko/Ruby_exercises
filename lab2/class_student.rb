class Student
	def name=(name_value)
		@name = name_value
	end
	def name
		@name
	end

	def surname=(surname_value)
		@surname = surname_value
	end
	def surname
		@surmame
	end

	def patronymic=(patronymic_value)
		@patronymic = patronymic_value
	end
	def patronymic
		@patronymic
	end

	def id=(id_value)
		@id = id_value
	end
	def id
		@id
	end

	def number=(number_value)
		@number = name_value
	end
	def number
		@number
	end

	def tg=(tg_value)
		@tg = tg_value
	end
	def tg
		@tg
	end

	def email=(email_value)
		@email = email_value
	end
	def email
		@email 
	end

	def git=(git_value)
		@git = git_value
	end
	def git
		@git
	end

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