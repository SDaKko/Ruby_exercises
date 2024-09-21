#Метод проверки простое ли число
def prime_div?(p_num)
	if (p_num < 2)
		return false
	else
		div = 2
		while (div < p_num)
			if(p_num % div == 0)
				return false
			else
				div += 1
			end
		end
		return true
	end
end

#Метод нахождения максимального простого делителя числа
def max_prime_divisor(p_num)
	if (prime_div?(p_num.abs))
		return p_num.abs
	elsif (p_num.abs > 1)
		div = p_num.abs - 1
		while (div != 1)
			if (p_num % div == 0 && prime_div?(div))
				return div
			else
				div -= 1
			end
		end
	else
		return -1 
	end
end

puts "Введите число: "
num = gets.to_i
if (max_prime_divisor(num) != -1)
	puts "Максимальный простой делитель числа #{num} равен #{max_prime_divisor(num)}"
else
	puts "Число не имеет простых делителей."
end
