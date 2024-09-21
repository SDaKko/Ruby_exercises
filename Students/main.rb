require_relative "class_student"

students = [
	Student.new("Иванов", "Владимир", "Аркадьевич"),
	Student.new("Петров", "Андрей", "Геннадьевич", "12345"),
	Student.new("Глушков", "Матвей", "Александрович"),
]

students.each do |student|
	puts student, "\n"
end
