#Метод поиска произведения цифр числа, не делящихся на пять
def not_div_on_five_mult(num)
	mult = 1
	while (num != 0)
		digit = num % 10
		num /= 10
		is_div = false
		if(digit % 5 != 0 && is_div == false)
			mult *= digit
			is_div = true
		end
	end
	if(is_div == true)
		return mult
	else
		return 0
	end
end

puts "Введите число: "
num = gets.chomp.to_i.abs
puts "Произведение цифр числа, не делящихся на пять, равно #{not_div_on_five_mult(num)}"
