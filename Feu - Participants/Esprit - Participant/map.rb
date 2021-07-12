class Map

    attr_accessor :map
    attr_reader :length, :height

    def initialize(height, length)
        @height = height
        @length = length
        @map = []

        @height.times {
            @map << Constant::EMPTY_CHARACTER * @length
        }
    end

    def place(position, character)
        height = @height - 1
        @height.times {
            if (@map[height][position] == Constant::EMPTY_CHARACTER)
                @map[height][position] = character
                break
            end
            height -= 1
        }
        if height == -1
            return false
        end
        return true
    end



    def print()
        down = "--"
        index = "|"

        puts
        @map.each do |line|
            puts "|" + line + "|"
        end

        @length.times {
            down += "-"
        }
        puts down

        (0..@length - 1).each do |i|
            index += i.to_s
        end
        index += "|"
        puts index
    end
end