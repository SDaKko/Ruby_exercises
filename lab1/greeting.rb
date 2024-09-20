name = ARGV[0]
if(name == nil)
	puts "Вы не ввели своё имя"
else
	puts "Здравствуйте, #{name}"
	puts "Какой Ваш любимый язык?"
	language = STDIN.gets.chomp
	if (language.downcase == "ruby")
		puts "Вы подлиза"
	else
		puts "Скоро будет Ruby"
		if (language.downcase == "java")
			puts "Неплохой выбор языка."
		end
		if (language.downcase == "c#")
			puts "Удачный выбор."
		end
	end
	puts "Введите команду языка Ruby"
	command_rb = STDIN.gets.chomp
	eval command_rb
	puts "Введите команду ОС"
	command_os = STDIN.gets.chomp
	system command_os
end
