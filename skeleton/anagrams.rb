#O(n!)
def first_anagram?(string1, string2)
  permutations = []
  arr = string1.chars
  arr.permutation(arr.length).each do |el|
    permutations << el.join
  end
  permutations.include? string2
end

#O(n**2)
def second_anagram?(string1, string2)
  str_arr = string2.chars
  string1.each_char do |letter|
    if str_arr.include? letter
      str_arr.delete_at(str_arr.find_index(letter))
    end
  end
  str_arr.empty?
end

#O(nlogn)
# space complexity == constant
def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

# O(1) == space complexity
# O(n) == time complexity (linear)
def fourth_anagram?(string1, string2)
  hash = Hash.new(0)
  string1.chars.each { |el| hash[el]+=1 }
  string2.chars.each { |el| hash[el]-=1 }
  hash.values.all? { |v| v == 0 }
end

p first_anagram?("gizmo", "sally") == false
p first_anagram?("elvis", "lives") == true

p second_anagram?("gizmo", "sally") == false
p second_anagram?("elvis", "lives") == true

p third_anagram?("gizmo", "sally") == false
p third_anagram?("elvis", "lives") == true

p fourth_anagram?("gizmo", "sally") == false
p fourth_anagram?("elvis", "lives") == true
