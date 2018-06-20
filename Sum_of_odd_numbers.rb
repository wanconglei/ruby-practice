=begin
Given the triangle of consecutive odd numbers:

             1
          3     5
       7     9    11
   13    15    17    19
21    23    25    27    29
...
Calculate the row sums of this triangle from the row index (starting at index 1) e.g.:

row_sum_odd_numbers(1); # 1
row_sum_odd_numbers(2); # 3 + 5 = 8
=end

def row_sum_odd_numbers(n)
  s = n * n - n + 1
  s * n + n * (n-1)
end

def row_sum_odd_numbers2(n)
  n**3
end

def row_sum_odd_numbers3(n)
   start = n * n - n + 1 
  finish = start + 2 * n
  (start...finish).step(2).reduce(:+)
end
