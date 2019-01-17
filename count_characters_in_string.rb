=begin
Description:
The main idea is to count all the occuring characters(UTF-8) in string. If you have string like this aba then the result should be { 'a': 2, 'b': 1 }

What if the string is empty ? Then the result should be empty object literal { }

For C#: Use a Dictionary<char, int> for this kata!
=end

def count_chars(s)
  result = {}
  s.each_char {|i| result[i] = s.count(i)}
  result
end

#another
def count_chars2(s)
  s.chars.uniq.each_with_object({}) { |c, h| h[c] = s.count(c) }
end
