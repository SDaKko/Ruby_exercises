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

#Метод нахождения максимального нечетного непростого делителя числа
def max_notprime_uneven_divisor(p_num)
	div = p_num.abs - 1
	while (div != 0)
		if (p_num % div == 0 && !prime_div?(div) && div % 2 != 0)
			return div
		else
			div -= 1
		end
	end
	return -1
end

#Метод нахождения произведения цифр числа
def mult_digits(num)
	if (num != 0)
		mult = 1
		while (num != 0)
			digit = num % 10
			num /= 10
			mult *= digit
		end
		return mult
	end
	return 0
end

#Метод нахождения НОД
def find_NOD(div, mult)
	while div != 0 and mult != 0
		if div > mult
	    	div = div % mult
		else
	    	mult = mult % div
		end
	end
	return div + mult
end

puts "Введите число: "
num = gets.to_i
div = max_notprime_uneven_divisor(num)
mult = mult_digits(num.abs)
if (div != -1)
	puts "Максимальный нечетный непростой делитель числа #{num} равен #{div}"
	puts "Произведение цифр числа: #{mult}"
	puts "НОД равен #{find_NOD(div, mult)}"
else
	puts "Число не имеет нечетных непростых делителей."
	puts "Произведение цифр числа: #{mult}"
end
