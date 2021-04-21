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

  def my_select
    return 'no block given' unless block_given?

    result = []

    if is_a? Hash
      result = {}
      my_each_with_index { |v, _| result[v[0]] = v[1] if yield(v[0], v[1]) }
    else
      my_each { |v| result.push(v) if yield(v) }
    end

    result
  end
end