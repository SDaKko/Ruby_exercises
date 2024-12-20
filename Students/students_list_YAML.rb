require_relative 'data_list_student_short.rb'
require_relative 'student.rb'
require_relative 'student_short.rb'
require 'yaml'

class StudentsListYAML < StudentsList

	def read()
		unless File.exist?(file_path)
            raise "Файл не найден!" 
        end

		YAML.load_file(file_path, symbolize_names: true).map do |data|
			Student.new(**data)
		end
	end

	def write()
		data = students_array.map { |student| student.to_h }
		File.write(file_path, data.to_yaml)
	end

end
