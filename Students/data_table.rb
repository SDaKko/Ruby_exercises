class DataTable
	private attr_reader :matr

	def initialize(matr)
    	self.matr = matr
	end

	private def matr=(matr)
		unless matr.is_a?(Array) && matr.all? {|row| row.is_a?(Array)}
			raise ArgumentError, "Параметром должен быть двумерный массив!"
		end
	
		@matr = matr.map{|arr| arr.dup}
	end

end
