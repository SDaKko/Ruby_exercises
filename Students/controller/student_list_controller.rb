require_relative 'students_list.rb'

class StudentListController
	def initialize(view)
    	self.view = view
    	self.student_list = StudentsList.new(StudentsListJSON.new)
	end
	
	private
	attr_accessor :view, :student_list

end
