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

  def multiply_els
    my_inject(1) { |acc, v| acc * v }
  end

  def my_all?(pattern = nil)
    return my_all?(pattern) { |v| v } unless block_given?

    case pattern
    when Regexp
      return my_all? { |v| v.match(pattern) }
    when Class
      return my_all? { |v| v.is_a? pattern }
    end

    my_each { |v| return false unless yield(v) }
    true
  end

  def my_any?(pattern = nil)
    return my_any?(pattern) { |v| v } unless block_given?

    case pattern
    when Regexp
      return my_any? { |v| v.match(pattern) }
    when Class
      return my_any? { |v| v.is_a? pattern }
    end

    my_each { |v| return true if yield(v) }
    false
  end

  def my_none?(pattern = nil, &block)
    !my_any?(pattern, &block)
  end

  def my_count(param = :dont_match_me)
    return my_inject(0) { |acc, v| yield(v) ? acc + 1 : acc } if block_given?

    return my_count { |_| true } if param == :dont_match_me

    my_count { |v| v == param }
  end

  def my_map(proc = nil)
    return my_map { |v| proc.call(v) } unless proc.nil?

    result = []
    my_each { |v| result.push(yield(v)) }
    result
  end
end
