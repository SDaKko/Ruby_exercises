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

	def reduce(initial = nil)

		if initial.nil?
			initial = arr.first
			arr[1..-1].each {|element| initial = yield(initial, element)}
		else  
			arr.each {|element| initial = yield(initial, element)}
		end
		
		initial
	end

	def include?()

		arr.each {|element| return true if yield(element)}
		false
	end

	def chunk()
		result = []
		current_chunk = []
		last_key = nil

		arr.each do |element|
			key = yield(element)
			if key != last_key
				result << [last_key, current_chunk] if last_key != nil
				current_chunk = [element]
				last_key = key
			else
				current_chunk << element
			end
		end

		result << [last_key, current_chunk] if last_key != nil
		result

	end

end