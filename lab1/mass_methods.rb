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

met = ARGV[0].to_i
addr = ARGV[1]
#C:\Patterns\arr.txt
if(met != nil && (met == 1 || met == 2) && addr != nil)
	if File.exist?(addr)
		file = File.read(addr)
		arr = file.split(' ').map{|el| el.to_i}
		case met
			when 1
				puts "Минимальный элемент в массиве: #{min_el(arr)}"
			when 2
				puts "Номер первого положительного элемента в массиве: #{num_first_pos_el(arr)}"
		end	
	else
	  puts "Файл не найден"
	end
else	
	if(met == nil || (met != 1 && met != 2))
		puts "Вы не ввели номер метода или номер был введён неверно!"
	end
	if (addr == nil)
		puts "Вы не ввели адрес файла!"
	end
end