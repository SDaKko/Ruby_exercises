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
			row = [index].concat(get_row(obj))
			table.append(row)
			index += 1
		end

		table
	end

	private def get_row(obj)
		return [obj.surname_inits, obj.git, obj.contact]
	end

end
