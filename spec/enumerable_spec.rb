require 'spec_helper'
require_relative '../src/enumerable'

def traversal_empty(method, model, arg = nil, &block)
  my_args = [method]
  std_args = [model]
  if arg
    my_args.push(arg)
    std_args.push(arg)
  end
  context 'when working on empty Enumerables' do
    it 'on Array' do
      my_result = [].send(*my_args, &block)
      std_result = [].send(*std_args, &block)
      expect(my_result).to eq(std_result)
    end

    it 'on Hash' do
      my_result = {}.send(*my_args, &block)
      std_result = {}.send(*std_args, &block)
      expect(my_result).to eq(std_result)
    end
  end
end

def traversal_tests(method, model, examples, blocks, arg = nil)
  context 'when working on nonempty Enumerables' do
    let(:examples) { examples }
    let(:blocks) { blocks }
    examples.each do |structure, example|
      it "on #{structure.to_s.capitalize}" do
        my_result = example.send(method, &blocks[structure])
        std_result = example.send(model, &blocks[structure])
        expect(my_result).to eq(std_result)
      end
    end
  end
  traversal_empty(method, model, arg, &blocks[:array])
end

examples = { array: [1, 2, 3, 4, 5],
             hash: { developer: 'Kenny', fruit: 'Apple', dog: 'Serú' },
             range: (1..10) }
blocks = { array: proc { |n| n > 2 },
           hash: proc { |_, val| val == 'Apple' },
           range: proc { |n| n > 2 } }

RSpec.describe 'Enumerable methods tests' do
  let(:array) { examples[:array] }
  let(:hash) { examples[:hash] }
  let(:range) { examples[:range] }
  let(:examples) { examples }

  describe '#my_each_with_index replicates #each_with_index' do
    context 'when working on nonempty Enumerables' do
      examples.each do |structure, example|
        it "on #{structure.to_s.capitalize}" do
          my_result = []
          example.my_each_with_index { |val, i| my_result.push([val, i]) }
          std_result = []
          example.each_with_index { |val, i| std_result.push([val, i]) }
          expect(my_result).to eq(std_result)
        end
      end
    end

    context 'when Enumerables are empty' do
      it 'on Array' do
        my_result = []
        [].my_each_with_index { |val, i| my_result.push([val, i]) }
        std_result = []
        [].each_with_index { |val, i| std_result.push([val, i]) }
        expect(my_result).to eq(std_result)
      end

      it 'on Hash' do
        my_result = []
        {}.my_each_with_index { |val, i| my_result.push([val, i]) }
        std_result = []
        {}.each_with_index { |val, i| std_result.push([val, i]) }
        expect(my_result).to eq(std_result)
      end
    end

    it 'check Enumerator when no block given' do
      len = array.length
      my_enum_arr = array.my_each_with_index.take(len)
      std_enum_arr = array.each_with_index.take(len)
      expect(my_enum_arr).to eq(std_enum_arr)
    end
  end

  describe '#my_each replicates #each' do
    context 'when working on nonempty Enumerables' do
      examples.each do |structure, example|
        it "on #{structure.to_s.capitalize}" do
          my_result = []
          example.my_each { |val| my_result.push(val) }
          std_result = []
          example.each { |val| std_result.push(val) }
          expect(my_result).to eq(std_result)
        end
      end
    end

    context 'when Enumerables are empty' do
      it 'on Array' do
        my_result = []
        [].my_each { |val| my_result.push(val) }
        std_result = []
        [].each { |val| std_result.push(val) }
        expect(my_result).to eq(std_result)
      end

      it 'on Hash' do
        my_result = []
        {}.my_each { |val| my_result.push(val) }
        std_result = []
        {}.each { |val| std_result.push(val) }
        expect(my_result).to eq(std_result)
      end
    end

    it 'check Enumerator when no block given' do
      len = array.length
      my_enum_arr = array.my_each.take(len)
      std_enum_arr = array.each.take(len)
      expect(my_enum_arr).to eq(std_enum_arr)
    end
  end

  describe '#my_select replicates #select' do
    traversal_tests(:my_select, :select, examples, blocks)

    it 'check Enumerator when no block given' do
      len = array.length
      my_enum_arr = array.my_select.take(len)
      std_enum_arr = array.select.take(len)
      expect(my_enum_arr).to eq(std_enum_arr)
    end
  end

  describe '#my_inject replicates #inject' do
    inject_blocks = { array: proc { |acc, val| acc + val },
                      hash: proc { |acc, val| acc.push(val[1]) },
                      range: proc { |acc, n| acc * n } }
    traversal_tests(:my_inject, :inject, examples, inject_blocks, 0)

    it 'with an initial value' do
      my_result = array.my_inject(5) { |acc, v| acc + v }
      std_result = array.inject(5) { |acc, v| acc + v }
      expect(my_result).to eq(std_result)
    end

    it 'with symbol' do
      my_result = array.my_inject(5, :+)
      std_result = array.inject(5, :+)
      expect(my_result).to eq(std_result)
    end

    it 'with symbol and block' do
      my_result = array.my_inject(5, :*) { |acc, v| acc + v }
      std_result = array.inject(5, :*) { |acc, v| acc + v }
      expect(my_result).to eq(std_result)
    end
  end

  describe '#my_all? replicates #all?' do
    traversal_tests(:my_all?, :all?, examples, blocks)
  end

  describe '#my_any? replicates #any?' do
    traversal_tests(:my_any?, :any?, examples, blocks)
  end

  describe '#my_none? replicates #none?' do
    traversal_tests(:my_none?, :none?, examples, blocks)
  end

  describe '#my_count replicates #count' do
    traversal_tests(:my_count, :count, examples, blocks)
  end

  describe '#my_map replicates #map' do
    traversal_tests(:my_map, :map, examples, blocks)

    # Enumerator
  end
end
