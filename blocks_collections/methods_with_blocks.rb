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
