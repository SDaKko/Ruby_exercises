require_relative "array_blocks"
require 'minitest/autorun'

class ArrayProcessingTest < Minitest::Test
attr_reader :arr_processing
	def setup
		@arr_processing = ArrayProcessing.new([3, 7, 3, 2, 1, 2, 4, 6, 5, 8, 2, 0, 7, -6])
	end

  def test_filter
    assert_equal [2, 2, 4, 6, 8, 2, 0, -6], arr_processing.filter { |element| element.even? }
  end

  def test_member?
  	assert arr_processing.member? { |element| element < 0 }
    assert arr_processing.member? { |element| element == -6 }
    refute arr_processing.member? { |element| element == 100 }
  end

  def test_sum
    assert_equal 88, arr_processing.sum { |element| element * 2 }
  end

  def test_reduce
    assert_equal 44, arr_processing.reduce { |accumulator, element| accumulator + element }
    assert_equal 49, arr_processing.reduce(5) { |accumulator, element| accumulator + element }
    assert_equal 22, arr_processing.reduce(0) { |accumulator, element| element > 6 ? accumulator + element : accumulator }
  end

  def test_include?
    assert arr_processing.include? { |element| element == 0 }
    refute arr_processing.include? { |element| element == 100 }
    refute arr_processing.include? { |element| element >= 10 }
  end

	def test_chunk
		assert_equal [[false, [3, 7, 3]], [true, [2]], [false, [1]], [true, [2, 4, 6]], [false, [5]], [true, [8, 2, 0]], [false, [7]], [true, [-6]]], 
		arr_processing.chunk { |element| element.even? }
	end
end