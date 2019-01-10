def recursive_range(start,fin)
    return [] if fin < start
    return [start] if start == fin
    return [start,fin] if start+1 == fin
    answer = [start]
    answer + recursive_range(start+1, fin-1) + [fin]
    
end

def iterative_range(start,fin)
    answer = []
    (start..fin).each do |i|
        answer << i 
    end
    answer
end

def exponential_1(b, n)
    return 1 if n == 0
    return b if n == 1
    b * exponential_1(b, n-1)
end

def exponential_2(b, n)
    return 1 if n == 0
    return b if n == 1
    
    return exponential_1(exponential_2(b, n/2), 2) if n % 2 == 0
    return b * exponential_1((exponential_2(b, (n-1)/2)), 2) 
end


# def deep_dup(arr)
#     new_arr = []
#     new_arr.each do |el|
#         if el.is_a?
#             new_arr << el.dup
#         else 
#             new_arr << el 
#         end
#     end
#     new_arr
# end
require "byebug"
def deep_dup(arr)
    if arr.class != Array
        return arr
    end 

        #solution with map & mutation of arr
    # arr.map.with_index do |el,idx|
    #     arr[idx] = deep_dup(el)
    # end 
    # arr.dup

        #solution with each & no of arr
    new_arr = arr.dup
    new_arr.each_with_index do |el,idx|
        # debugger
        new_arr[idx] = deep_dup(el)
    end
end
   
# p br = [[3]]
# p "outer"
# p br.object_id == deep_dup(br).object_id
# p "+++++++++++++"
# p "inner"
# p br[0].object_id == deep_dup(br).object_id

# p "----------------"
# arr =[1, [2], [3, [4]]]
# arr_duped = deep_dup(arr)
# arr[2][1] << 3
# p arr 
# p arr_duped

def iterative_fib(n)
    return [1] if n == 1
    return [1,1] if n == 2

    fib_arr = [1,1]
    (n-2).times do 
        fib_arr << fib_arr[-1] + fib_arr[-2]
    end

    return fib_arr
end

# p iterative_fib(1)
# p iterative_fib(2)
# p iterative_fib(5)
# p iterative_fib(10)


def recursive_fib(n)
    return [1] if n == 1
    return [1,1] if n == 2

    almost_answer = recursive_fib(n-1)
    almost_answer << almost_answer[-1] + almost_answer[-2]
end

# p recursive_fib(1)
# p recursive_fib(2)
# p recursive_fib(4)
# p recursive_fib(5)
# p recursive_fib(10)

def bsearch(array, target)
    return nil if array == []

    middle = (array.length-1)/2 

    # debugger

    if array[middle] == target 
        middle
    elsif array[middle] < target 
        upper_half = array[middle+1 .. -1]
        upper_b = bsearch(upper_half, target)
        if upper_b
            upper_b + middle + 1
        else 
            return nil
        end 
    elsif array[middle] > target 
        lower_half = array[0 ... middle]
        bsearch(lower_half, target)        
    end 
    
    # nil if array.length == 1 && array[middle] != target
end 

# p "right"
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5

# p "wrong"
# # p "errors"
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(array)
    return array if array.length <= 1
    middle = (array.length-1)/2 
    left = array[0..middle]
    right = array[middle+1..-1]
    # debugger
    parsemerge(merge_sort(left),merge_sort(right))
end 

def parsemerge (a1, a2)
    # iterative
        # parsemerged = [] 
        # if a1[0] < a2[0]
        #     parsemerged << (a1.shift) 
        # else 
        #     parsemerged << a2.shift 
        # end 
        # merged = a1 + a2 
        # merged.each do |e|
        #     merged[1..-1].each do |e2|
        #         return e if 
        #     end
        # end

    # recursive
    return a1 if a2.empty? 
    return a2 if a1.empty? 

    if a1[0] < a2[0]
        [a1[0]] + parsemerge(a1[1..-1], a2)
    else
        [a2[0]] + parsemerge(a1, a2[1..-1])
    end 
end

a1 = []
a2 = [] #, 6]
a3 = a2+a1

p parsemerge(a1, a2)
p parsemerge(a2, a1)
p merge_sort(a3)