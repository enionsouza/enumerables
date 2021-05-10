require 'spec_helper'
require_relative '../src/enumerable'

def traversal_tests_mutable(method); end

RSpec.describe 'Enumerable methods tests' do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:hash) { { developer: 'Kenny', fruit: 'Apple', dog: 'Serú' } }
  let(:range) { (1..10) }
  describe '#my_each_with_index replicates #each_with_index' do
    context 'when working on nonempty Enumerables' do
      it 'on Array' do
        my_result = []
        array.my_each_with_index { |val, i| my_result.push([val, i]) }
        std_result = []
        array.each_with_index { |val, i| std_result.push([val, i]) }
        expect(my_result).to eq(std_result)
      end

      it 'on Hash' do
        my_result = []
        hash.my_each_with_index { |val, i| my_result.push([val, i]) }
        std_result = []
        hash.each_with_index { |val, i| std_result.push([val, i]) }
        expect(my_result).to eq(std_result)
      end

      it 'on Range' do
        my_result = []
        range.my_each_with_index { |val, i| my_result.push([val, i]) }
        std_result = []
        range.each_with_index { |val, i| std_result.push([val, i]) }
        expect(my_result).to eq(std_result)
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

  # describe '#my_select' do
  # end

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
