require_relative 'students_list.rb'
require 'json'

class StudentsListJSON < StudentsList

    def read()
        unless File.exist?(file_path)
            raise "Файл не найден!" 
        end

        self.students_array = JSON.parse(File.read(file_path), symbolize_names: true).map { |data| Student.new(**data) }
    end

    def write()
        to_data_hash = students_array.map{|student| student.to_h}
        json_data = JSON.pretty_generate(to_data_hash)
        File.write(file_path, json_data)
    end

end
