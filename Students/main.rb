require_relative "student"
require_relative "student_short"
require_relative 'data_list_student_short.rb'
require_relative 'students_list.rb'
require_relative 'students_list_strategy.rb'
require_relative 'students_list_DB.rb'

students = [
	Student.new(name: "Владимир", surname: "Иванов", patronymic: "Аркадьевич", phone: "+79183336640", git: "github.com/ok"),
	Student.new(name:"Андрей", surname:"Петров", patronymic:"Геннадьевич", id:"12345", phone: "+79183336697", tg: "@onehjd"),
	Student.new(name:"Матвей", surname:"Глушков", patronymic:"Александрович", tg: "@telegram", phone: "+70918333667"),
]
students.each do |student|
	puts student, "\n"
	puts(student.contain?(), "\n")
end

# students[0].set_contacts(phone: "+77777777777")
# puts students[0].phone
# puts students[0].get_info
# puts students[0].surname_inits
# st_short = StudentShort.from_str(1, students[0].get_info)
# st_short_last = StudentShort.new(student: students[1])
# puts st_short_last
# puts st_short

# data_table = DataTable.new([[]])
# data_list_1 = DataListStudentShort.new([st_short, st_short_last])
# # data_list_1 = DataList.new([st_short, st_short_last])
# st_names = data_list_1.get_names()
# st_data = data_list_1.get_data()
# puts st_names
# p st_data
# data_list_1.select(0)
# data_list_1.select(1)
# st_names = data_list_1.get_names()
# st_data = data_list_1.get_data()
# puts st_names
# p st_data
# element = st_data.get_element(1, 1)
# puts element


student_list_json = StudentsList.new(StudentsListJSON.new)
student_list_yaml = StudentsList.new(StudentsListYAML.new)

file_path_json = 'C:\Patterns\students_JSON.txt'
file_path_yaml = 'C:\Patterns\students_YAML.txt'

student_list_json.read(file_path_json)
# student_list_json.write(file_path_json)
student_list_yaml.read(file_path_yaml)
# student_list_yaml.write(file_path_yaml)
student_list_yaml.sort_by_fio()
student_list_json.sort_by_fio()
p student_list_json.get_k_n_student_short_list(1, 20)

# p student_list_yaml.get_k_n_student_short_list(1, 20)

student_for_check = Student.new(surname: "Петров", name: "Андрей", patronymic: "Геннадьевич", tg: "@onehjd2", phone: "+79183336697")
student_for_check2 = Student.new(surname: "Владимиров", name: "Андрей", patronymic: "Геннадьевич", tg: "@onehjd3", phone: "+79183339879")
# student_list_json.add_student(student_for_check)

# p student_list_json.get_k_n_student_short_list(1, 20)

student_db = StudentsListDB.new()
# student_db_2 = StudentsListDB.new()
p student_db.get_student_short_count()
p student_db.get_student_by_id(44)
p student_db.get_k_n_student_short_list(1, 20)
# student_db.add_student(student_for_check)
# student_db.replace_student_by_id(43, student_for_check2)
# student_db.delete_student_by_id(43)

pg1 = ConnectionDB.instance
pg2 = ConnectionDB.instance
puts pg1.equal?(pg2)