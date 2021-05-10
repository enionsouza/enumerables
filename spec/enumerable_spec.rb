require 'spec_helper'
require_relative '../src/enumerable'

def traversal_empty(method, model, &block)
  context 'when working on empty Enumerables' do
    it 'on Array' do
      my_result = [].send(method, &block)
      std_result = [].send(model, &block)
      expect(my_result).to eq(std_result)
    end

    it 'on Hash' do
      my_result = {}.send(method, &block)
      std_result = {}.send(model, &block)
      expect(my_result).to eq(std_result)
    end
  end
end

def traversal_tests(method, model, examples, blocks)
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
  traversal_empty(method, model, &blocks[:array])
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
  end

  # describe '#my_each' do
  # end

  describe '#my_select' do
    traversal_tests(:my_select, :select, examples, blocks)
  end

  # describe '#my_inject' do
  # end

  # describe '#my_all?' do
  # end

  # describe '#my_any?' do
  # end

  # describe '#my_none?' do
  # end

  # describe '#my_count' do
  # end

  # describe '#my_map' do
  # end
end
