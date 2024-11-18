require_relative 'data_table.rb'
require_relative 'data_list.rb'

class DataListStudentShort < DataList
	def get_names()
		["number", "full name", "git", "contact"]
	end

	def get_data()
		index = 1
		table = []
		self.get_selected.each do |number|
			obj = list[number]
			row = [index, obj.surname_inits, obj.git, obj.contact]
			table.append(row)
			index += 1
		end

		DataTable.new(table)
	end

end
