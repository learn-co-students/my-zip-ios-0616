class Array
  def my_zip(*arrays)
    final_array = []
    self.each_with_index do |element, i|
      nested_array = []
      nested_array << element
      arrays.each { |a| nested_array << a[i] }
      final_array << nested_array
    end
    final_array
  end
end