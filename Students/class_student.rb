class Main_Student
	attr_reader :id, :surname_inits, :git, :contact 

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

class Student < Main_Student
	attr_accessor :name, :surname, :patronymic
	attr_reader :phone, :tg, :email

	def initialize(surname:, name:, patronymic:, id: nil, phone: nil, tg: nil, email: nil, git: nil)
		if !Student.valid_surname?(surname)
			raise ArgumentError, "Неверный формат фамилии: #{surname}"
   		end
   		if !Student.valid_name?(name)
			raise ArgumentError, "Неверный формат имени: #{name}"
   		end
   		if !Student.valid_patronymic?(patronymic)
			raise ArgumentError, "Неверный формат отчества: #{patronymic}"
   		end
		if id && !Student.valid_id?(id)
			raise ArgumentError, "Неверный формат id: #{id}"
   		end
		if phone && !Student.valid_phone_number?(phone)
			raise ArgumentError, "Неверный формат номера телефона: #{phone}"
   		end
   		if tg && !Student.valid_tg?(tg)
			raise ArgumentError, "Неверный формат адреса телеграм: #{tg}"
   		end
   		if email && !Student.valid_email?(email)
			raise ArgumentError, "Неверный формат адреса электронной почты: #{email}"
   		end
   		if git && !Student.valid_git?(git)
			raise ArgumentError, "Неверный формат git: #{git}"
   		end
   		self.set_contacts(phone: phone, tg: tg, email: email)
   		@id = id
   		@surname = surname
		@name = name
		@patronymic = patronymic
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

	def self.is_git?(git)
		if git == nil
			return false
		end
		return true
	end	

	def self.is_phone_number?(phone)
		if phone == nil
			return false
		end
		return true
	end	

	def self.is_tg?(tg)
		if tg == nil
			return false
		end
		return true
	end	

	def self.is_email?(email)
		if email == nil
			return false
		end
		return true
	end	

	def self.valid_id?(id)
		if id == nil
			return false
		end
		return id.match?(/^[0-9]+$/)
	end

	def self.valid_surname?(surname)
		if surname == nil
			return false
		end
		return surname.match?(/^[A-ZА-ЯЁ][a-zа-яё]+$/)
	end

	def self.valid_name?(name)
		if name == nil
			return false
		end
		return name.match?(/^[A-ZА-ЯЁ][a-zа-яё]+$/)
	end

	def self.valid_patronymic?(patronymic)
		if patronymic == nil
			return false
		end
		return patronymic.match?(/^[A-ZА-ЯЁ][a-zа-яё]+$/)
	end

	def self.valid_phone_number?(phone_number)
		if !Student.is_phone_number?(phone_number)
			return false
		end
		return phone_number.match?(/^\+7\d{10}$/)
	end

	def self.valid_tg?(tg)
		if !Student.is_tg?(tg)
			return false
		end
		return tg.match?(/^\@[a-zA-Z0-9_]{5,32}$/)
	end

	def self.valid_email?(email)
		if !Student.is_email?(email)
			return false
		end
		return email.match?(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z_-]+$/)
	end

	def self.valid_git?(git)
		if !Student.is_git?(git)
			return false
		end
		return git.match?(/^(https:\/\/)?github.com\/[a-zA-Z0-9_-]+$/)
	end

	def validate() 
		return Student.is_git?(@git) && (Student.is_phone_number?(@phone) || Student.is_tg?(@tg) || Student.is_email?(@email))
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

end

class Student_short < Main_Student
	
	def initialize(student: nil, id: nil, info: nil)
		if(student)
			@id = student.id
			@surname_inits = student.surname_inits
			@git = student.git
			@contact = student.contact
		elsif (id && info)
			@id = id
			parse_str(info)
		end	
			
	end

	def parse_str(str)
		str.split(",").map do |part|
			piece = part.split("=")
			case piece[0].strip
			when "ФИО"
				@surname_inits = piece[1].strip
			when "git"
				@git = piece[1].strip
			when "phone"
				@contact = piece[1].strip
			when "tg"
				@contact = piece[1].strip
			when "email"
				@contact = piece[1].strip
			else
				raise ArgumentError, "Неверный формат строки."
			end
		end
	end
end