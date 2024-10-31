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
		arr_values = []
		flag = 0
		arr.each do |element|
			if current_chunk.empty?
				current_chunk << yield(element)
				if(yield(element))
					flag = 0
				else
					flag = 1
				end
			end
			if flag == 0
				if(yield(element))
					arr_values << element
				else
					flag = 1
					if current_chunk.size == 1
						current_chunk << arr_values
					end
					result << current_chunk
					current_chunk = [yield(element)]
					arr_values = [element]
					current_chunk << arr_values
				end
			else
				if(!yield(element))
					arr_values << element
				else
					flag = 0 
					if current_chunk.size == 1
						current_chunk << arr_values
					end
					result << current_chunk
					current_chunk = [yield(element)]
					arr_values = [element]
					current_chunk << arr_values
				end
			end
		end

		result << current_chunk unless current_chunk.empty?
		result
	end

end