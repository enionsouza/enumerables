# Enumerable Module
NO_ARGUMENT = Object.new

module Enumerable
  def my_each_with_index
    enum = to_a
    if block_given?
      enum.length.times do |i|
        yield(enum[i], i)
      end
      self
    else
      Enumerator.new { |y| my_each_with_index { |v, i| y << [v, i] } }
    end
  end

  def my_each
    if block_given?
      my_each_with_index { |v, _| yield(v) }
    else
      Enumerator.new { |y| my_each { |v| y << v } }
    end
  end

  def my_select
    if block_given?
      result = []
      if is_a? Hash
        result = {}
        my_each_with_index { |v, _| result[v[0]] = v[1] if yield(v[0], v[1]) }
      else
        my_each { |v| result.push(v) if yield(v) }
      end
    else
      result = Enumerator.new { |y| my_each { |a| y << a } }
    end
    result
  end

  def my_inject(init = nil, sym = nil, &block)
    raise LocalJumpError if init == nil && sym == nil and !block_given?
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

  def my_all?(pattern = NO_ARGUMENT)
    return my_all?(pattern) { |v| v } unless block_given?

    case pattern
    when Regexp
      return my_all? { |v| v.match(pattern) }
    when Class
      return my_all? { |v| v.is_a? pattern }
    when NO_ARGUMENT
      my_each { |v| return false unless yield(v) }
      true
    else
      return my_all? { |v| v == pattern }
    end


  end

  def my_any?(pattern = NO_ARGUMENT)
    return my_any?(pattern) { |v| v } unless block_given?

    case pattern
    when Regexp
      my_any? { |v| v.match(pattern) }
    when Class
      my_any? { |v| v.is_a? pattern }
    when NO_ARGUMENT
      my_each { |v| return true if yield(v) }
      false
    else
      my_any? { |v| v == pattern }
    end

  end

  def my_none?(pattern = NO_ARGUMENT, &block)
    !my_any?(pattern, &block)
  end

  def my_count(param = NO_ARGUMENT)
    return my_inject(0) { |acc, v| yield(v) ? acc + 1 : acc } if block_given?

    return my_count { |_| true } if param == NO_ARGUMENT

    my_count { |v| v == param }
  end

  def my_map(proc = NO_ARGUMENT)
    return my_map { |v| proc.call(v) } unless proc == NO_ARGUMENT

    if block_given?
      result = []
      my_each { |v| result.push(yield(v)) }
      result
    else
      Enumerator.new { |y| my_map { |a| y << a } }
    end
  end
end

def multiply_els(array)
  array.my_inject(1) { |acc, v| acc * v }
end
