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

def different_signs?(arr)
	arr.each_cons(2).all? { |a, b| a * b < 0 }
end

def sum_elems_interval(arr, a, b)
	sum = 0
	arr.each do |elem|
		if (elem > a and elem < b)
			sum += elem
		end
	end

	sum
end

def count_greater_than_sum(arr)
	sum = 0
	count = 0

	arr.each do |elem|
		if elem > sum
			count += 1
		end
		sum += elem
	end

	count
end
