module Enumerable
  def my_each_with_index
    index=0
    for item in self do
      yield(item, index)
      index+=1
    end
  end
  def my_select
    selected_items = []
    for item in self do
      if yield(item) == true
        selected_items.push(item)
      end
    end
    return selected_items
  end
  def my_all?
    for item in self do
      if !yield(item)
        return false
      end
    end
    return true
  end
  def my_any?
    for item in self do
      if yield(item)
        return true
      end
    end
    return false
  end
  def my_none?
    for item in self do
      if yield(item)
        return false
      end
    end
    return true
  end
  def my_count
    counter = 0
    return self.size if !block_given?
    for item in self do
      if yield(item)
        (counter += 1)
      end
    end
    return counter
  end
  def my_map
    new_items = []
    for item in self do
      new_item = item
      new_item = yield(new_item)
      new_items.push(new_item)
    end
    return new_items
  end
  def my_inject(accumulator)
    if accumulator == nil
      accumulator = 0
    end
    for item in self do
      accumulator = yield(accumulator, item)
    end
    return accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self do
      yield(item)
    end
  end
end
