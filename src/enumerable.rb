# Enumerable Module

module Enumerable

  def Enumerable.my_each_with_index(enum)

    return "no block given" unless block_given?    

    if enum.is_a? Range 
      flag_enum = true
      enum_range = enum
      enum = enum.to_a
    end

    case enum
    when Hash
      for i in enum.keys do
        yield(i, enum[i])
      end
    when Array, String
      i = 0
      while i < enum.length do
        yield(i, enum[i])
        i += 1
      end
      return enum unless flag_enum
      enum_range
    else
      "Not an enumerable argument!"
    end
  end

end
