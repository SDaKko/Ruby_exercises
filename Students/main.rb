require_relative "class_student"

students = [
	Student.new(name: "Владимир", surname: "Иванов", patronymic: "Аркадьевич", phone: "+79183336640", git: "github.com/ok"),
	Student.new(name:"Андрей", surname:"Петров", patronymic:"Геннадьевич", id:"12345", phone: "+79183336697", tg: "@onehjd"),
	Student.new(name:"Матвей", surname:"Глушков", patronymic:"Александрович", tg: "@telegram", phone: "+70918333667"),
]
students.each do |student|
	puts student, "\n"
	puts(student.validate(), "\n")
end

students[0].set_contacts(phone: "+77777777777")
puts students[0].phone
puts students[0].get_info