class MainStudent
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

class Student < MainStudent
	attr_accessor :name, :surname, :patronymic
	attr_reader :phone, :tg, :email

	def surname=(surname)
		if (!surname.nil? && Student.valid_surname?(surname))
			@surname = surname
		else
			raise ArgumentError, "Неверный формат фамилии: #{surname}"
 		end   
    end
    def name=(name)
		if (!name.nil? && Student.valid_name?(name))
			@name = name
		else
			raise ArgumentError, "Неверный формат имени: #{name}"
 		end   
    end
    def patronymic=(patronymic)
		if (!patronymic.nil? && Student.valid_patronymic?(patronymic))
			@patronymic = patronymic
		else
			raise ArgumentError, "Неверный формат отчества: #{patronymic}"
 		end   
    end
    def id=(id)
		if (Student.valid_id?(id))
			@id = id
		else
			raise ArgumentError, "Неверный формат id: #{id}"
 		end   
    end
    def git=(git)
		if (Student.valid_git?(git))
			@git = git
		else
			raise ArgumentError, "Неверный формат адреса git: #{git}"
 		end   
    end
    private def phone=(phone)
		if (Student.valid_phone?(phone))
			@phone = phone
		else
			raise ArgumentError, "Неверный формат номера телефона: #{phone}"
 		end   
    end
    private def tg=(tg)
		if (Student.valid_tg?(tg))
			@tg = tg
		else
			raise ArgumentError, "Неверный формат адреса телеграм: #{tg}"
 		end   
    end
    private def email=(email)
		if (Student.valid_email?(email))
			@email = email
		else
			raise ArgumentError, "Неверный формат адреса электронной почты: #{email}"
 		end   
    end

	def initialize(surname:, name:, patronymic:, id: nil, phone: nil, tg: nil, email: nil, git: nil)
   		self.id = id
   		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.git = git
		self.set_contacts(phone: phone, tg: tg, email: email)
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

	def self.valid_id?(id)
		if !id.nil?
			return id.match?(/^[0-9]+$/)
		else
			return true
		end
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

	def self.valid_phone?(phone)
		if !phone.nil?
			return phone.match?(/^\+7\d{10}$/)
		else
			return true
		end

	end

	def self.valid_tg?(tg)
		if !tg.nil?
			return tg.match?(/^\@[a-zA-Z0-9_]{5,32}$/)
		else
			return true
		end
	end

	def self.valid_email?(email)
		if !email.nil?
			return email.match?(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z_-]+$/)
		else
			return true
		end
	end


	def self.valid_git?(git)
		if !git.nil?
			return git.match?(/^(https:\/\/)?github.com\/[a-zA-Z0-9_-]+$/)
		else 
			return true
		end
	end

	def has_git?()
		if self.git == nil
			return false
		end
		return true
	end	

	def has_contact?()
		if self.phone != nil
			return true
		end
		if self.tg != nil
			return true
		end
		if self.email != nil
			return true
		end
		return false
	end	

	def validate()
		return self.has_git?() && self.has_contact?()
	end

	def set_contacts(phone: nil, tg: nil, email: nil)
		if !phone.nil?
			self.phone = phone 
		end
		if !tg.nil?
			self.tg = tg
		end 
		if !email.nil? 
			self.email = email
		end 
	end

	def get_fio
		if !self.surname_inits.nil?
			return "ФИО: #{self.surname_inits}"
		end
	end

	def get_contact
		if(!self.phone.nil?)
			return "Телефон: #{self.phone}"
		end
		if(!self.email.nil?)
			return "Почта: #{self.email}"
		end
		if(!self.tg.nil?)
			return "Телеграм: #{self.tg}"
		end
	end

end

class StudentShort < MainStudent
	
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

	def get_info
		str = "id = #{@id}"
		str += ", ФИО = #{@surname_inits}"
		if @git
			str += ", git = #{@git}"
		end
		if @contact
			str += ", контакт = #{@contact}"
		end
		return str
	end
end