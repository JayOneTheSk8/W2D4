
def bad_two_sum?(arr, target)
  pairs = []
  arr.each_with_index do |num1, idx| #n
    arr[idx+1..-1].each do |num2|
      pairs << [num1,num2]
    end
  end
  pairs.each do |pair|
    return true if pair.reduce(:+) == target
  end
  false
end

def okay_two_sum?(arr, target)
  return arr if arr.length == 1
  arr.sort!
  pivot = arr.length/2
  left = arr.select{ |el| el < pivot }
  right = arr.reject{ |el| el< pivot }
  if target

  a = arr.pop
  arr.sort!


end



arr = [1,2,3,4,5]
p bad_two_sum?(arr, 5) == true

arr = [2,4,3,1,5]
p okay_two_sum?(arr, 5) == true
