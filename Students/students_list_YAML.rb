require_relative 'students_list.rb'
require 'yaml'

class StudentsListYAML < StudentsList

	def read()
		unless File.exist?(file_path)
            raise "Файл не найден!" 
        end

		self.students_array = YAML.load_file(file_path, symbolize_names: true).map{ |data| Student.new(**data) }
	end

	def write()
		data = students_array.map { |student| student.to_h }
		File.write(file_path, data.to_yaml)
	end

end
