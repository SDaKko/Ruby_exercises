require_relative 'MainStudent.rb'

class StudentShort < MainStudent
	
	def initialize(student: nil, id: nil, info: nil)
		if(student)
			super(id: student.id, git: student.git)
			@surname_inits = student.surname_inits
			@contact = student.contact
		elsif (id && info)
			super(id: id)
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