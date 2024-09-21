require_relative "class_student"

students = [
	Student.new(name: "Иванов", surname: "Владимир", patronymic: "Аркадьевич"),
	Student.new(name:"Петров", surname:"Андрей", patronymic:"Геннадьевич", id:"12345"),
	Student.new(name:"Глушков", surname:"Матвей", patronymic:"Александрович", tg: "@telegram"),
]

students.each do |student|
	puts student, "\n"
end