require_relative 'data_list_student_short.rb'
require_relative 'student.rb'
require_relative 'student_short.rb'
require 'json'

class StudentsListJSON < StudentsList

    def read()
        unless File.exist?(file_path)
            raise "Файл не найден!" 
        end

        JSON.parse(File.read(file_path), symbolize_names: true).map do |data|
            Student.new(**data)
        end 
    end

    def write()
        to_data_hash = students_array.map{|student| student.to_h}
        json_data = JSON.pretty_generate(to_data_hash)
        File.write(file_path, json_data)
    end

end
