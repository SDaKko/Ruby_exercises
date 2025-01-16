require_relative 'students_list.rb'
require_relative 'data_list_student_short.rb'

class StudentListController
	def initialize(view)
		self.view = view
		self.student_list = StudentsList.new(StudentsListJSON.new)
	    self.student_list.read("C:/Patterns/students_JSON.txt")
		self.data_list = DataListStudentShort.new([])
		self.data_list.add_observer(self.view)
	end

	def sort_table_by_column()
		self.student_list.sort_by_fio!
		refresh_data
	end

	def refresh_data()
		self.data = self.student_list.get_k_n_student_short_list(self.view.current_page_label, self.view.class::ROWS_PER_PAGE)
		self.data_list.count = self.student_list.get_student_short_count
		self.data_list.notify(self.data)
	end
	
	def add()
	
	end

	def update()
		refresh_data
	end

	def delete(indexes)
		puts "Удаление записей с индексами #{indexes}"
	end

	def edit(index)
		puts "Изменение записи с индексом: #{index}"
	end

	private
	attr_accessor :view, :student_list, :data_list, :data, :sort_order

end