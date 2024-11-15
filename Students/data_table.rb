class DataTable
	def initialize(matr)
    	self.matr = matr
	end

	private attr_reader :matr

	private def matr=(matr)
		unless matr.is_a?(Array) && matr.all? {|row| row.is_a?(Array)}
			raise ArgumentError, "Параметром должен быть двумерный массив!"
		end
	
		@matr = matr.map(|arr| arr.dup)
	end

end
