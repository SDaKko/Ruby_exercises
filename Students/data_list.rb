require_relative 'data_table.rb'

class DataList
	protected attr_reader :list
	protected attr_accessor :selected_elem, :selected_id_arr
	
	def initialize(list)
		self.list = list
		self.selected_id_arr = []
	end

	protected def list=(list)
		unless list.is_a?(Array)
			raise ArgumentError, "Параметром должен быть массив!"
		end
	
		@list = list.dup()
	end

	def select(number)
		if number < 0 || number >= list.length
			raise "Номер вне границ массива!" 
		end
		self.selected_elem = list[number]
		self.selected_id_arr << number
	end

	def get_selected()
		self.selected_id_arr.dup()
	end

	# Шаблонный метод 
	def unite_table()
		table = []
		table << self.get_names
		table.concat(self.get_data)
		DataTable.new(table)
	end

	# Абстрактные методы
	def get_names()
		raise NotImplementedError, "Метод get_names должен быть реализован в наследниках!"
	end

	def get_data()
		raise NotImplementedError, "Метод get_data должен быть реализован в наследниках!"
	end

end
