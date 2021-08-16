# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        if self.length == 0
            return nil
        end
        self.max - self.min
    end
    def average
        if self.length == 0
            return nil
        end
        self.sum / (self.length * 1.0)
    end

    def median
        if self.length == 0
            return nil
        end
        sorted = self.sort
        if sorted.length.odd?
          return  sorted[sorted.length / 2]
        else
            while sorted.length > 2
                sorted.shift
                sorted.pop
            end
          return  sorted.average
        end
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

#Part 2
    def my_count(value)
        count = 0
        self.each do |ele|
        count += 1 if ele == value
        end
        count
    end

    def my_index(value)
        self.each_with_index do |ele, i|
            return i if ele == value
        end
        nil
    end

    def my_uniq
        arr = []
        
        self.each do |ele|
            arr << ele if !arr.include?(ele)  
        end
        arr
    end

    def my_transpose
        arr = []
       (0...self.length).each do |row|
        
        new_row = []

        (0...self.length).each do |col|
            new_row << self[col][row]
        end
        arr << new_row
       end
       arr
    end

end #End Class
