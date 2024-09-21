require_relative "class_student"

students = [
	Student.new(name: "Иванов", surname: "Владимир", patronymic: "Аркадьевич", phone: "+79183336640"),
	Student.new(name:"Петров", surname:"Андрей", patronymic:"Геннадьевич", id:"12345", phone: "+79183336697"),
	Student.new(name:"Глушков", surname:"Матвей", patronymic:"Александрович", tg: "@telegram", phone: "+70918333667"),
]

students.each do |student|
	puts student, "\n"
end