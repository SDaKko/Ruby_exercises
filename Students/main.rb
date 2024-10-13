require_relative "student"
require_relative "student_short"

students = [
	Student.new(name: "Владимир", surname: "Иванов", patronymic: "Аркадьевич", phone: "+79183336640", git: "github.com/ok"),
	Student.new(name:"Андрей", surname:"Петров", patronymic:"Геннадьевич", id:"12345", phone: "+79183336697", tg: "@onehjd"),
	Student.new(name:"Матвей", surname:"Глушков", patronymic:"Александрович", tg: "@telegram", phone: "+70918333667"),
]
students.each do |student|
	puts student, "\n"
	puts(student.contain?(), "\n")
end

students[0].set_contacts(phone: "+77777777777")
puts students[0].phone
puts students[0].get_info
puts students[0].surname_inits
st_short = StudentShort.from_str("1", students[0].get_info)
st_short_last = StudentShort.new(student: students[1])
puts st_short_last
puts st_short.surname_inits
puts st_short.contact
puts st_short
puts students[0].get_fio
puts students[0].get_contact
puts students[0].git