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
		return phone_number.match(/^\+7\d{10}$/)
	end

end