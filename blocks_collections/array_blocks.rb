class ArrayProcessing
	attr_reader :arr

	def initialize(arr)
		@arr = arr.dup()
	end

	def filter()
		result = []
		arr.each do |element|
			if yield(element) 
	    		result << element 
	    	end
		end

		result
	end

end