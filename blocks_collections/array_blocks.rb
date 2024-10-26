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

	def member?()
		arr.each do |element|  
			if yield(element)
				return true
			end  
		end

		false  
	end

	def sum()
		sum = 0
		arr.each do |element|
			sum += yield(element)
		end

		sum
	end
end