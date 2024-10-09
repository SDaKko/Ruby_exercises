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