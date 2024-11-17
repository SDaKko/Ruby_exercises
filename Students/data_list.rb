class DataList
	protected attr_reader :list
	
	def initialize(list)
		self.list = list
	end

	protected def list=(list)
		unless list.is_a?(Array)
			raise ArgumentError, "Параметром должен быть массив!"
		end
	
		@list = list.dup()
	end

end