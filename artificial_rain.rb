=begin
Little Petya often visits his grandmother in the countryside. The grandmother has a large vertical garden, which can be represented as a set of n rectangles of varying height. Due to the newest irrigation system we can create artificial rain above them.

Creating artificial rain is an expensive operation. That's why we limit ourselves to creating the artificial rain only above one section. The water will then flow to the neighbouring sections but only if each of their heights does not exceed the height of the previous watered section.

Example:
Let's say there's a garden consisting of 5 rectangular sections of heights 4, 2, 3, 3, 2.

Creating the artificial rain over the left-most section is inefficient as the water WILL FLOW DOWN to the section with the height of 2, but it WILL NOT FLOW UP to the section with the height of 3 from there. Only 2 sections will be covered: 4, 2.

The most optimal choice will be either of the sections with the height of 3 because the water will flow to its neighbours covering 4 sections altogether: 2, 3, 3, 2. You can see this process in the following illustration:

Screenshot-1

As Petya is keen on programming, he decided to find such section that if we create artificial rain above it, the number of watered sections will be maximal.

Output:
The maximal number of watered sections if we create artificial rain above exactly one section.
=end

#mine
def artificial_rain(garden)
  num = garden.length
  return num if num <= 2
  result = []
  garden.each_with_index do |item, i|
    l_count = 0
    r_count = 0
    i.downto(1) do |n|
      if (garden[n-1] <= garden[n])
        l_count += 1
      else
        break
      end
    end
    i.upto(num-2) do |n|
      if (garden[n+1] <= garden[n])
        r_count += 1
      else
        break
      end
    end
    result << (l_count + r_count + 1)
  end
  return result.max
end

#better
def artificial_rain2(a)
  r = cur_high = last_low = 0
  cur_size = 1
  for i in (1...a.length) do
    x = a[i]
    if x < a[i-1]
      last_low = i
    elsif x > a[i-1]
      r = [r, cur_size].max
      cur_size = i - last_low
      cur_high = i
    end
    cur_size += 1
  end
  [r, cur_size].max
end
