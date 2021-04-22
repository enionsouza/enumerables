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

  def my_inject(init = nil, sym = nil, &block)
    enum = to_a

    return init if enum.empty? && block_given?

    if block_given?
      if init.nil?
        init = enum.drop(1).my_inject(enum[0], &block)
      else
        enum.my_each { |v| init = block.call(init, v) }
      end
    else
      sym, init = init, sym if sym.nil?
      return enum.my_inject(init) { |a, b| a.send(sym, b) }
    end

    init
  end

  def my_all?
    return my_all? { |v| v } unless block_given?

    inject(true) { |acc, v| yield(v) ? acc : false }
  end
end
