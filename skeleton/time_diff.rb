#O(n**2)
def my_min(list)
  min = list[0]
  list.each_with_index do |num1,idx|
    list[idx+1..-1].each do |num2|
      min = [num1, num2].min if [num1, num2].min < min
    end
  end
  min
end

#O(n)
def my_min_ii(list)
  min = list[0]
  list.each do |num|
    min = num if num < min
  end
  min
end

#O(n**2)
def sub_sum(list)
  arr = []
  list.each_index do |idx|
    list.each_index do |jdx|
      arr << list[idx..jdx]
    end
  end
  arr.reject!(&:empty?)
  max = arr.first.reduce(:+)
  arr.each do |subset|
    max = subset.reduce(:+) if subset.reduce(:+) > max
  end
  max
end

#O(n) => O(1)
def sub_sum_on(list)
  return list.max if list.all? { |num| num < 0 }
  max = list.first
  current = list.first
  (1...list.length).each do |idx|
    if current < 0
      max, current = 0, 0
    end
    current += list[idx]
    max = current if current > max
  end
  max
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list) == -5
p my_min_ii(list) == -5

list = [5, 3, -7]
p sub_sum(list) == 8
p sub_sum_on(list) == 8

list = [2, 3, -6, 7, -6, 7]
p sub_sum(list) == 8
p sub_sum_on(list) == 8

list = [-5, -1, -3]
p sub_sum(list) == -1
p sub_sum_on(list) == -1
