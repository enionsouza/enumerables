# Enumerable Module

module Enumerable
  def my_each_with_index
    return 'no block given' unless block_given?

    enum = to_a

    enum.length.times do |i|
      yield(enum[i], i)
    end

    self
  end

  def my_each
    return 'no block given' unless block_given?

    my_each_with_index { |v, _| yield(v) }
  end
end
