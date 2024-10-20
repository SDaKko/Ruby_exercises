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

def input_arr()
	puts "Введите элементы массива (через пробел):"
	input = gets.chomp
	arr = input.split.map{|x| x.to_i}
	return arr
end


puts "Задачи:\n1) Найти элементы, расположенные перед последним минимальным.\n2) Найти элементы, расположенные после первого максимального.
3) Проверить чередование положительных и отрицательных чисел массива.\n4) Найти сумму элементов, значение которых попадает в интервал (a, b).
5) Найти количество элементов, которые больше, чем сумма всех предыдущих."
puts "\nВведите номер задачи: "
num = gets.chomp.to_i

case num
when 1
	arr = input_arr()
	puts "Элементы, расположенные перед последним минимальным:"
	puts elements_before_last_min(arr)
when 2
	arr = input_arr()
	puts "Элементы, расположенные после первого максимального:"
	puts elements_after_first_max(arr)
when 3
	arr = input_arr()
	if(different_signs?(arr))
		puts "Отрицательные и положительные числа в массиве чередуются."
	else
		puts "Отрицательные и положительные числа в массиве не чередуются."
	end
when 4
	arr = input_arr()
	puts "Введите интервал (a, b):"
	puts "a: "
	a = gets.chomp.to_i
	puts "b: "
	b = gets.chomp.to_i
	puts "Сумма элементов, значение которых попадает в интервал (a, b):"
	puts sum_elems_interval(arr, a, b)
when 5
	arr = input_arr()
	puts "Количество элементов, которые больше, чем сумма всех предыдущих:"
	puts count_greater_than_sum(arr)
end
