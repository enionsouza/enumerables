require 'spec_helper'
require_relative '../src/enumerable'

example_array = [1, 2, 3, 4, 5]
example_array_of_strings = %w[aa ab ac]
example_range = (1..10)
example_hash = {
  fruit: 'tucuman',
  number1: 3,
  number2: 7,
  continent: 'latin america'
}
boolean_array = [true, true, false, true]
true_array = Array.new(3, true)
false_array = Array.new(3, false)
boolean_hash = { a: true, b: true, c: false }

RSpec.describe 'Enumerable methods tests' do
  describe 'my_each_with_index' do
    it 'Replicates each_with_index on Array' do
      standard_result = []
      example_array.each_with_index { |v, i| standard_result.push([v, i]) }
      my_result = []
      example_array.my_each_with_index { |v, i| my_result.push([v, i]) }
      expect(my_result).to eq(standard_result)

      empty_result = []
      my_empty_result = []
      [].each_with_index { |v, i| empty_result.push([v, i]) }
      [].my_each_with_index { |v, i| my_empty_result.push([v, i]) }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates each_with_index on Hash' do
      standard_result = []
      example_hash.each_with_index { |v, i| standard_result.push([v, i]) }
      my_result = []
      example_hash.my_each_with_index { |v, i| my_result.push([v, i]) }
      expect(my_result).to eq(standard_result)

      empty_result = []
      my_empty_result = []
      {}.each_with_index { |v, i| empty_result.push([v, i]) }
      {}.my_each_with_index { |v, i| my_empty_result.push([v, i]) }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates each_with_index on Range' do
      standard_result = []
      example_range.each_with_index { |v, i| standard_result.push([v, i]) }
      my_result = []
      example_range.my_each_with_index { |v, i| my_result.push([v, i]) }
      expect(my_result).to eq(standard_result)
    end
  end

  describe 'my_each' do
    it 'Replicates each on Array' do
      standard_result = []
      example_array.each { |i| standard_result.push([i]) }
      my_result = []
      example_array.my_each { |i| my_result.push([i]) }
      expect(my_result).to eq(standard_result)

      empty_result = []
      my_empty_result = []
      [].each { |i| empty_result.push([i]) }
      [].my_each { |i| my_empty_result.push([i]) }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates each on Hash' do
      standard_result = []
      example_hash.each { |i| standard_result.push([i]) }
      my_result = []
      example_hash.my_each { |i| my_result.push([i]) }
      expect(my_result).to eq(standard_result)

      empty_result = []
      my_empty_result = []
      {}.each { |i| empty_result.push([i]) }
      {}.my_each { |i| my_empty_result.push([i]) }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates each on Range' do
      standard_result = []
      example_range.each { |i| standard_result.push([i]) }
      my_result = []
      example_range.my_each { |i| my_result.push([i]) }
      expect(my_result).to eq(standard_result)
    end
  end

  describe 'my_select' do
    it 'Replicates select on Array' do
      standard_result = example_array.select { |i| i > 2 }
      my_result = example_array.my_select { |i| i > 2 }
      expect(my_result).to eq(standard_result)

      empty_result = [].select { |i| i > 2 }
      my_empty_result = [].my_select { |i| i > 2 }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates select on Hash' do
      standard_result = example_hash.select { |_, v| v.is_a? String }
      my_result = example_hash.my_select { |_, v| v.is_a? String }
      expect(my_result).to eq(standard_result)

      empty_result = {}.select { |_, v| v.is_a? String }
      my_empty_result = {}.my_select { |_, v| v.is_a? String }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates select on Range' do
      standard_result = example_range.select { |i| i > 5 }
      my_result = example_range.my_select { |i| i > 5 }
      expect(my_result).to eq(standard_result)
    end
  end

  describe 'my_select' do
    it 'Replicates select on Array' do
      standard_result = example_array.select { |i| i > 2 }
      my_result = example_array.my_select { |i| i > 2 }
      expect(my_result).to eq(standard_result)

      empty_result = [].select { |i| i > 2 }
      my_empty_result = [].my_select { |i| i > 2 }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates select on Hash' do
      standard_result = example_hash.select { |_, v| v.is_a? String }
      my_result = example_hash.my_select { |_, v| v.is_a? String }
      expect(my_result).to eq(standard_result)

      empty_result = {}.select { |_, v| v.is_a? String }
      my_empty_result = {}.my_select { |_, v| v.is_a? String }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates select on Range' do
      standard_result = example_range.select { |i| i > 5 }
      my_result = example_range.my_select { |i| i > 5 }
      expect(my_result).to eq(standard_result)
    end
  end

  describe 'my_inject' do
    it ' Replicates inject on Array with blocks and initial value' do
      standard_result = example_array.inject(1) do |acc, v|
        acc * v
      end
      my_result = example_array.my_inject(1) do |acc, v|
        acc * v
      end
      expect(my_result).to eq(standard_result)

      empty_result = [].inject(1) do |acc, v|
        acc * v
      end
      my_empty_result = [].my_inject(1) do |acc, v|
        acc * v
      end
      expect(my_empty_result).to eq(empty_result)
    end

    it ' Replicates inject on Hash with blocks and initial value' do
      standard_result = example_hash.inject([0, 0]) do |acc, v|
        acc + v
      end
      my_result = example_hash.my_inject([0, 0]) do |acc, v|
        acc + v
      end
      expect(my_result).to eq(standard_result)

      empty_result = {}.inject([0, 0]) do |acc, v|
        acc + v
      end
      my_empty_result = {}.my_inject([0, 0]) do |acc, v|
        acc + v
      end
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates inject on Range with blocks and initial value' do
      standard_result = example_range.inject(1) do |acc, v|
        acc * v
      end
      my_result = example_range.my_inject(1) do |acc, v|
        acc * v
      end
      expect(my_result).to eq(standard_result)
    end

    it ' Replicates inject on Array with blocks' do
      standard_result = example_array.inject do |acc, v|
        acc + v
      end
      my_result = example_array.my_inject do |acc, v|
        acc + v
      end
      expect(my_result).to eq(standard_result)

      empty_result = [].inject do |acc, v|
        acc * v
      end
      my_empty_result = [].my_inject do |acc, v|
        acc * v
      end
      expect(my_empty_result).to eq(empty_result)
    end

    it ' Replicates inject on Hash with blocks' do
      standard_result = example_hash.inject do |acc, v|
        acc + v
      end
      my_result = example_hash.my_inject do |acc, v|
        acc + v
      end
      expect(my_result).to eq(standard_result)

      empty_result = {}.inject do |acc, v|
        acc + v
      end
      my_empty_result = {}.my_inject do |acc, v|
        acc + v
      end
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates inject on Range with blocks' do
      standard_result = example_range.inject do |acc, v|
        acc * v
      end
      my_result = example_range.my_inject do |acc, v|
        acc * v
      end
      expect(my_result).to eq(standard_result)
    end

    it ' Replicates inject on Array with symbol' do
      standard_result = example_array.inject(:+)
      my_result = example_array.my_inject(:+)
      expect(my_result).to eq(standard_result)

      standard_result = example_array.inject(1, :*)
      my_result = example_array.my_inject(1, :*)
      expect(my_result).to eq(standard_result)

      empty_result = [].inject(:+)
      my_empty_result = [].my_inject(:+)
      expect(my_empty_result).to eq(empty_result)

      empty_result = [].inject(1, :+)
      my_empty_result = [].my_inject(1, :+)
      expect(my_empty_result).to eq(empty_result)
    end

    it ' Replicates inject on Hash with symbol' do
      standard_result = example_hash.inject(:+)
      my_result = example_hash.my_inject(:+)
      expect(my_result).to eq(standard_result)

      standard_result = example_hash.inject([1, 0], :+)
      my_result = example_hash.my_inject([1, 0], :+)
      expect(my_result).to eq(standard_result)

      empty_result = {}.inject(:+)
      my_empty_result = {}.my_inject(:+)
      expect(my_empty_result).to eq(empty_result)

      empty_result = {}.inject([1, 0], :+)
      my_empty_result = {}.my_inject([1, 0], :+)
      expect(my_empty_result).to eq(empty_result)
    end

    it 'Replicates inject on Range with symbol' do
      standard_result = example_range.inject(:-)
      my_result = example_range.my_inject(:-)
      expect(my_result).to eq(standard_result)

      standard_result = example_range.inject(15, :-)
      my_result = example_range.my_inject(15, :-)
      expect(my_result).to eq(standard_result)
    end
  end

  describe 'my_all?' do
    it 'my_all? replicates all? on Array without block' do
      standard_result = boolean_array.all?
      my_result = boolean_array.my_all?
      expect(my_result).to eq(standard_result)

      standard_result = true_array.all?
      my_result = true_array.my_all?
      expect(my_result).to eq(standard_result)

      standard_result = false_array.all?
      my_result = false_array.my_all?
      expect(my_result).to eq(standard_result)

      empty_result = [].all?
      my_empty_result = [].my_all?
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_all? replicates all? on Hash without block' do
      standard_result = boolean_hash.all?
      my_result = boolean_hash.my_all?
      expect(my_result).to eq(standard_result)

      empty_result = {}.all?
      my_empty_result = {}.my_all?
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_all? replicates all? on Range without block' do
      standard_result = example_range.all?
      my_result = example_range.my_all?
      expect(my_result).to eq(standard_result)
    end

    it 'my_all? replicates all? on Array with block' do
      standard_result = example_array.all? { |v| v > 2 }
      my_result = example_array.my_all? { |v| v > 2 }
      expect(my_result).to eq(standard_result)

      standard_result = example_array.all? { |_| true }
      my_result = example_array.my_all? { |_| true }
      expect(my_result).to eq(standard_result)

      standard_result = example_array.all? { |_| false }
      my_result = example_array.my_all? { |_| false }
      expect(my_result).to eq(standard_result)

      empty_result = [].all? { |_| false }
      my_empty_result = [].my_all? { |_| false }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_all? replicates all? on Hash with block' do
      standard_result = example_hash.all? { |v| v[1].is_a? String }
      my_result = example_hash.my_all? { |v| v[1].is_a? String }
      expect(my_result).to eq(standard_result)

      standard_result = example_hash.all? { |_| true }
      my_result = example_hash.my_all? { |_| true }
      expect(my_result).to eq(standard_result)

      standard_result = example_array.all? { |_| false }
      my_result = example_array.my_all? { |_| false }
      expect(my_result).to eq(standard_result)

      empty_result = {}.all? { |_| false }
      my_empty_result = {}.my_all? { |_| false }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_all? replicates all? on Range with block' do
      standard_result = example_range.all? { |v| v > 2 }
      my_result = example_range.my_all? { |v| v > 2 }
      expect(my_result).to eq(standard_result)

      standard_result = example_range.all? { |_| true }
      my_result = example_range.my_all? { |_| true }
      expect(my_result).to eq(standard_result)

      standard_result = example_range.all? { |_| false }
      my_result = example_range.my_all? { |_| false }
      expect(my_result).to eq(standard_result)
    end

    it 'my_all? replicates all? on Array with pattern or class' do
      standard_result = example_array_of_strings.all?(/a/)
      my_result = example_array_of_strings.my_all?(/a/)
      expect(my_result).to eq(standard_result)

      standard_result = example_array_of_strings.all?(/s/)
      my_result = example_array_of_strings.my_all?(/s/)
      expect(my_result).to eq(standard_result)

      standard_result = example_array.all?(Numeric)
      my_result = example_array.my_all?(Numeric)
      expect(my_result).to eq(standard_result)

      standard_result = example_array.all?(String)
      my_result = example_array.my_all?(String)
      expect(my_result).to eq(standard_result)

      empty_result = [].all?(/s/)
      my_empty_result = [].my_all?(/s/)
      expect(my_empty_result).to eq(empty_result)

      empty_result = [].all?(Numeric)
      my_empty_result = [].my_all?(Numeric)
      expect(my_empty_result).to eq(empty_result)
    end
  end

  describe 'my_any?' do
    it 'my_any? replicates any? on Array without block' do
      standard_result = boolean_array.any?
      my_result = boolean_array.my_any?
      expect(my_result).to eq(standard_result)

      standard_result = true_array.any?
      my_result = true_array.my_any?
      expect(my_result).to eq(standard_result)

      standard_result = false_array.any?
      my_result = false_array.my_any?
      expect(my_result).to eq(standard_result)

      empty_result = [].any?
      my_empty_result = [].my_any?
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_any? replicates any? on Hash without block' do
      standard_result = boolean_hash.any?
      my_result = boolean_hash.my_any?
      expect(my_result).to eq(standard_result)

      empty_result = {}.any?
      my_empty_result = {}.my_any?
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_any? replicates any? on Range without block' do
      standard_result = example_range.any?
      my_result = example_range.my_any?
      expect(my_result).to eq(standard_result)
    end

    it 'my_any? replicates any? on Array with block' do
      standard_result = example_array.any? { |v| v > 2 }
      my_result = example_array.my_any? { |v| v > 2 }
      expect(my_result).to eq(standard_result)

      standard_result = example_array.any? { |_| true }
      my_result = example_array.my_any? { |_| true }
      expect(my_result).to eq(standard_result)

      standard_result = example_array.any? { |_| false }
      my_result = example_array.my_any? { |_| false }
      expect(my_result).to eq(standard_result)

      empty_result = [].any? { |_| false }
      my_empty_result = [].my_any? { |_| false }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_any? replicates any? on Hash with block' do
      standard_result = example_hash.any? { |v| v[1].is_a? String }
      my_result = example_hash.my_any? { |v| v[1].is_a? String }
      expect(my_result).to eq(standard_result)

      standard_result = example_hash.any? { |_| true }
      my_result = example_hash.my_any? { |_| true }
      expect(my_result).to eq(standard_result)

      standard_result = example_array.any? { |_| false }
      my_result = example_array.my_any? { |_| false }
      expect(my_result).to eq(standard_result)

      empty_result = {}.any? { |_| false }
      my_empty_result = {}.my_any? { |_| false }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_any? replicates any? on Range with block' do
      standard_result = example_range.any? { |v| v > 2 }
      my_result = example_range.my_any? { |v| v > 2 }
      expect(my_result).to eq(standard_result)

      standard_result = example_range.any? { |_| true }
      my_result = example_range.my_any? { |_| true }
      expect(my_result).to eq(standard_result)

      standard_result = example_range.any? { |_| false }
      my_result = example_range.my_any? { |_| false }
      expect(my_result).to eq(standard_result)
    end

    it 'my_any? replicates any? on Array with pattern or class' do
      standard_result = example_array_of_strings.any?(/a/)
      my_result = example_array_of_strings.my_any?(/a/)
      expect(my_result).to eq(standard_result)

      standard_result = example_array_of_strings.any?(/s/)
      my_result = example_array_of_strings.my_any?(/s/)
      expect(my_result).to eq(standard_result)

      standard_result = example_array.any?(Numeric)
      my_result = example_array.my_any?(Numeric)
      expect(my_result).to eq(standard_result)

      standard_result = example_array.any?(String)
      my_result = example_array.my_any?(String)
      expect(my_result).to eq(standard_result)

      empty_result = [].any?(/s/)
      my_empty_result = [].my_any?(/s/)
      expect(my_empty_result).to eq(empty_result)

      empty_result = [].any?(Numeric)
      my_empty_result = [].my_any?(Numeric)
      expect(my_empty_result).to eq(empty_result)
    end
  end

  describe 'my_none?' do
    it 'my_none? replicates none? on Array without block' do
      standard_result = boolean_array.none?
      my_result = boolean_array.my_none?
      expect(my_result).to eq(standard_result)

      standard_result = true_array.none?
      my_result = true_array.my_none?
      expect(my_result).to eq(standard_result)

      standard_result = false_array.none?
      my_result = false_array.my_none?
      expect(my_result).to eq(standard_result)

      empty_result = [].none?
      my_empty_result = [].my_none?
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_none? replicates none? on Hash without block' do
      standard_result = boolean_hash.none?
      my_result = boolean_hash.my_none?
      expect(my_result).to eq(standard_result)

      empty_result = {}.none?
      my_empty_result = {}.my_none?
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_none? replicates none? on Range without block' do
      standard_result = example_range.none?
      my_result = example_range.my_none?
      expect(my_result).to eq(standard_result)
    end

    it 'my_none? replicates none? on Array with block' do
      standard_result = example_array.none? { |v| v > 2 }
      my_result = example_array.my_none? { |v| v > 2 }
      expect(my_result).to eq(standard_result)

      standard_result = example_array.none? { |_| true }
      my_result = example_array.my_none? { |_| true }
      expect(my_result).to eq(standard_result)

      standard_result = example_array.none? { |_| false }
      my_result = example_array.my_none? { |_| false }
      expect(my_result).to eq(standard_result)

      empty_result = [].none? { |_| false }
      my_empty_result = [].my_none? { |_| false }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_none? replicates none? on Hash with block' do
      standard_result = example_hash.none? { |v| v[1].is_a? String }
      my_result = example_hash.my_none? { |v| v[1].is_a? String }
      expect(my_result).to eq(standard_result)

      standard_result = example_hash.none? { |_| true }
      my_result = example_hash.my_none? { |_| true }
      expect(my_result).to eq(standard_result)

      standard_result = example_array.none? { |_| false }
      my_result = example_array.my_none? { |_| false }
      expect(my_result).to eq(standard_result)

      empty_result = {}.none? { |_| false }
      my_empty_result = {}.my_none? { |_| false }
      expect(my_empty_result).to eq(empty_result)
    end

    it 'my_none? replicates none? on Range with block' do
      standard_result = example_range.none? { |v| v > 2 }
      my_result = example_range.my_none? { |v| v > 2 }
      expect(my_result).to eq(standard_result)

      standard_result = example_range.none? { |_| true }
      my_result = example_range.my_none? { |_| true }
      expect(my_result).to eq(standard_result)

      standard_result = example_range.none? { |_| false }
      my_result = example_range.my_none? { |_| false }
      expect(my_result).to eq(standard_result)
    end

    it 'my_none? replicates none? on Array with pattern or class' do
      standard_result = example_array_of_strings.none?(/a/)
      my_result = example_array_of_strings.my_none?(/a/)
      expect(my_result).to eq(standard_result)

      standard_result = example_array_of_strings.none?(/s/)
      my_result = example_array_of_strings.my_none?(/s/)
      expect(my_result).to eq(standard_result)

      standard_result = example_array.none?(Numeric)
      my_result = example_array.my_none?(Numeric)
      expect(my_result).to eq(standard_result)

      standard_result = example_array.none?(String)
      my_result = example_array.my_none?(String)
      expect(my_result).to eq(standard_result)

      empty_result = [].none?(/s/)
      my_empty_result = [].my_none?(/s/)
      expect(my_empty_result).to eq(empty_result)

      empty_result = [].none?(Numeric)
      my_empty_result = [].my_none?(Numeric)
      expect(my_empty_result).to eq(empty_result)
    end
  end
end
