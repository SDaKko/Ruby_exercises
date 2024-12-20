require_relative 'data_list_student_short.rb'
require_relative 'student.rb'
require_relative 'student_short.rb'

class StudentsList
	private attr_accessor :file_path
	private attr_writer :students_array

	def initialize(file_path)
		self.file_path = file_path
		self.students_array = read
	end

	def students_array()
		@students_array.dup()
	end

	def get_student_by_id(id)
		students_array.each do |student|
			if student.id == id
				return student
			end
			raise ArgumentError, "id указан неверно!"
		end
	end

	def get_k_n_student_short_list(k, n, data_list = nil)
		start = (k - 1) * n
		selected = []
		if students_array[start, n]
			selected = students_array[start, n]
		end
		students_short = selected.map { |student| StudentShort.new(student: student) }
		if data_list.nil?
			data_list = DataListStudentShort.new(selected)
		end

		data_list
	end

	def sort_by_fio()
		students_array.sort_by { |student| student.get_fio }
	end

	def add_student(student)
		if students_array.nil?
			max_id = 0
		else
			max_id = students_array.map{|student| student.id}.max
		end
		student.id = max_id + 1
		@students_array << student
	end

	def replace_student_by_id(id, new_student)
		index = students_array.find_index { |student| student.id == id }
		unless index
			raise IndexError, 'Неверно задан id студента!'
		end
		new_student.id = id
		@students_array[index] = new_student
	end

	def delete_student_by_id(id)
		@students_array.reject! { |student| student.id == id }
	end

	def get_student_short_count()
		students_array.count
	end

end