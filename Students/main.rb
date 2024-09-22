require_relative "class_student"

students = [
	Student.new(name: "Иванов", surname: "Владимир", patronymic: "Аркадьевич", phone: "+79183336640", git: "github.com/ok"),
	Student.new(name:"Петров", surname:"Андрей", patronymic:"Геннадьевич", id:"12345", phone: "+79183336697", tg: "@onehjd"),
	Student.new(name:"Глушков", surname:"Матвей", patronymic:"Александрович", tg: "@telegram", phone: "+70918333667"),
]

students.each do |student|
	puts student, "\n"
	puts(student.validate(), "\n")
end