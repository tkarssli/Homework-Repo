fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish(fishes)
    (0...fishes.length).each do |i|
        return fishes[i] if fishes.none?{|other_fish| other_fish.length > fishes[i].length}
    end
end

def dominant(fishes)
    return fishes if fishes.length == 0

    pivot = fishes[0]
    left = fishes[1..-1].select{|fish| fish.length < pivot.length}
    right = fishes[1..-1].select{|fish| fish.length >= pivot.length}

    dominant(left) + [pivot] + dominant(right)
end

def clever(fishes)
    longest = fishes[0]
    (1...fishes.length).each do |i|
       longest = fishes[i] if fishes[i].length > longest.length
    end
    longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up" ] 
tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }
def slow_dance(dir, tiles_array)
    tiles_array.each_with_index { |el,i| return i if dir == el }
end

def fast_dance(dir, tiles_hash)
    tiles_hash[dir]
end

p slow_dance("up", tiles_array)
p slow_dance("down", tiles_array)
p fast_dance("left-down", tiles_hash)
p fast_dance("left", tiles_hash)