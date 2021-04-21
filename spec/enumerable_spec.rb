require 'spec_helper'
require_relative '../src/enumerable'

example_array = [1, 2, 3]
example_range = (1..10)
example_hash = {
  fruit: 'tucuman',
  number1: 3,
  number2: 7,
  continent: 'latin america'
}

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
end
