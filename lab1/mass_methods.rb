#Метод нахождения минимального элемента в массиве
def min_el(arr)
	min = arr[0]
	for el in arr
		min = el if (el < min)
	end
	return min
end

#Метод нахождения номера первого положительного элемента в массиве
def num_first_pos_el(arr)
	num = 0
	while (num < arr.length)
		if(arr[num] > 0)
			return num
		else
			num += 1
		end
	end
	return -1
end
