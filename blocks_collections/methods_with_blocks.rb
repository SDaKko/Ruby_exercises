def elements_before_last_min(arr)
	return [] if arr.empty?

	index_min = 0
	min = arr[0]
	arr.each_with_index do |elem, ind|
		if elem <= min
			index_min = ind
			min = elem 
		end
	end

	arr[0...index_min]
end

def elements_after_first_max(arr)
	return [] if arr.empty?

	index_max = 0
	max = arr[0]
	arr.each_with_index do |elem, ind|
		if elem > max
			index_max = ind
			max = elem
		end
	end

	arr[index_max + 1..-1]
end

def different_signs?(array)
	array.each_cons(2).all? { |a, b| a * b < 0 }
end
