class Player

    attr_reader :character

    def initialize(name, character)
        @name = name
        @character = character
    end

    def turn(map)
        puts "===== #{@name} ====="
    end
end