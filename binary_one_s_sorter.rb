class BinaryOneSSorter
  # Sort numbers by their binary value with the highest numbers of 1s
  # For conflict choose number with highest decimal value

  def self.sort(items)
    hash_to_sorted_array(hash_by_binary(items))
  end
  
  def self.to_binary(item)
    item.to_s(2)
  end
  
  private
    def self.hash_to_sorted_array(values)
      items = []
      values.keys.sort_by{|key| (key.count '1') * -1 }.each do |key|
        items.concat(values[key].sort_by {|item| item * -1})
      end
      items
    end

    def self.get_key(item)
      return '0' if item == 0
      self.to_binary(item).gsub('0','')
    end

    def self.hash_by_binary(items)
      values = {}
      items.each_with_index do |item, index|
        key = get_key(item)
        values[key] = [] if values[key].nil?
        values[key] << item
      end
      values
    end
end

def print_custom_sorted_binary_array(items)
  BinaryOneSSorter.sort(items).each {|item| puts "#{item}"}
end

print_custom_sorted_binary_array([31, 15, 7, 2, 1, 33, 35])