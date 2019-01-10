require "byebug"
def sum_to(n)
  return 0 if n == 0
  n + sum_to(n-1)
end

def add_numbers(num_array)
  return nil if num_array == []
  return num_array[0] if num_array.length == 1
  num_array.pop+add_numbers(num_array)
end
p "num_array"
p add_numbers([1,2,3,4]) # => returns 10
p  add_numbers([3]) # => returns 3
p  add_numbers([-80,34,7]) # => returns -39
p  add_numbers([]) # => returns nil

def gamma_fnc(num, first_num = true)
  return nil if num == 0
  return 1 if num == 1
  return gamma_fnc(num-1, false) if first_num == true
  num * gamma_fnc(num-1, false)
end
p "gamma"
p gamma_fnc(0)  # => returns nil
p   gamma_fnc(1)  # => returns 1
p   gamma_fnc(4)  # => returns 6
p   gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors_arr, favorite)
  return false if flavors_arr == []
  return true if flavors_arr.pop == favorite
  ice_cream_shop(flavors_arr,favorite)
end
  p "ice cream"
  p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
  p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
  p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
  p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
  p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0..-2])
end

# Test Cases
p "recursion"
 p reverse("house") # => "esuoh"
 p reverse("dog") # => "god"
 p reverse("atom") # => "mota"
 p reverse("q") # => "q"
 p reverse("id") # => "di"
 p reverse("") # => ""
