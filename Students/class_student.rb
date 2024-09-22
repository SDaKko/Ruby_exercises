class Student
	attr_accessor :name, :surname, :patronymic, :id, :number, :tg, :email, :git

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

end