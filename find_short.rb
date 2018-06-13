=begin
Simple, given a string of words, return the length of the shortest word(s).

String will never be empty and you do not need to account for different data types.
=end

def find_short(s)
    size_arr = []
    arr = s.split(" ")
    arr.each do |item|
      size_arr << item.size
    end
    l = size_arr.min
    return l # l: length of the shortest word
end

puts find_short("bitcoin take over the world maybe who knows perhaps")

#better solution
def find_short2(s)
    l = s.split.min_by(&:length).size
    return l
end
