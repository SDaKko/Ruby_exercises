class Student
	attr_accessor :name, :surname, :patronymic, :id
	attr_reader :phone, :tg, :email, :git, :surname_inits, :contact

	def initialize(surname:, name:, patronymic:, id: nil, phone: nil, tg: nil, email: nil, git: nil)
		@id = id
		@surname = surname
		@name = name
		@patronymic = patronymic
		if phone && !Student.valid_phone_number?(phone)
			raise ArgumentError, "Неверный формат номера телефона: #{phone}"
   		end
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

	def self.valid_phone_number?(phone_number)
		if phone_number == nil
			return false
		end
		return phone_number.match?(/^\+7\d{10}$/)
	end

	def self.valid_tg?(tg)
		if tg == nil
			return false
		end
		return tg.match?(/^\@[a-zA-Z0-9_]{5,32}$/)
	end

	def self.valid_email?(email)
		if email == nil
			return false
		end
		return email.match?(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z_-]+$/)
	end

	def self.valid_git?(git)
		if git == nil
			return false
		end
		return git.match?(/^(https:\/\/)?github.com\/[a-zA-Z0-9_-]+$/)
	end

	def self.valid_id?(id)
		if id == nil
			return false
		end
		return id.match?(/^[0-9]+$/)
	end

	def validate()
		return Student.valid_git?(@git) && (Student.valid_phone_number?(@phone) || Student.valid_tg?(@tg) || Student.valid_email?(@email))
	end

	def set_contacts(phone: nil, tg: nil, email: nil)
		if Student.valid_phone_number?(phone)
			@phone = phone
		end
		if Student.valid_tg?(tg)
			@tg = tg
		end
		if Student.valid_email?(email)
			@email = email
		end
	end

	def get_info
		@surname_inits = "#{@surname} #{@name[0]}. #{patronymic[0]}."
		str = "ФИО = #{surname_inits}"
		if @git
			str += ", git = #{git}"
		end
		contact = ""
		if @phone
			contact += ", phone = #{@phone}"
			@contact = @phone
		elsif @email
			contact += ", email = #{@email}"
			@contact = @email
		elsif @tg
			contact += ", tg = #{@tg}"
			@contact = @tg
		end
		str += contact
		return str
	end
end



class Student_short
	attr_reader :id, :surname_inits, :git, :contact 

	def initialize(student)
		@id = student.id
		@surname_inits = student.surname_inits
		@git = student.git
		@contact = student.contact
	end

end