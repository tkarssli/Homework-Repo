class Stack
    def initialize
        @stack = []
    end
    def push(el)
        @stack.push(el)
    end
    def pop
        @stack.pop
    end
    def peek
        @stack[-1]
    end
end

class Queue
    def initialize
        @queue = []
    end
    def enqueue(el)
        @queue.unshift(el)
    end
    def dequeue
        @queue.pop
    end
    def peek
        @queue[-1]
    end
end

class Map
    def initialize
        @map = []
    end
    def set(key, value)
        @map << [key, value] if @map.none?{|el| el[0] == key}
    end
    def get(key)
        @map.select{|el| el[0] == key}
    end
    def delete(key)
        kv = @map.select{|el| el[0] == key}
        @map = @map.select{|el| el[0] != key}
        kv
    end
    def show
        @map
    end

end