module ArrayModule
  refine Array do
    def my_each
      counter = 0
      while counter < length
        yield(self[counter])
        counter += 1
      end
      self
    end

    def my_map
      new_array = []
      counter = 0
      while counter < length
        new_array << yield(self[counter])
        counter += 1
      end
      new_array
    end

    def my_select
      new_array = []
      counter = 0
      while counter < length
        new_array << self[counter] if yield(self[counter])
        counter += 1
      end
      new_array
    end

    def my_empty?
      if length.zero?
        true
      else
        false
      end
    end

    def my_count
      counter = 0
      my_each do |element|
        next unless yield(element)

        counter += 1
      end
      counter
    end

    def my_reject
      new_array = []
      counter = 0
      while counter < length
        new_array << self[counter] unless yield(self[counter])
        counter += 1
      end
      new_array
    end
  end
end

using ArrayModule

array = [1, 2, 3, 4, 5, 6]

array.my_each { |element| p element }
p array.my_map { |element| element * 3 }
p array.my_select(&:odd?)
p array.my_reject(&:odd?)
p array.my_empty?
p array.my_count { |element| (element % 3).zero? }
