require 'player.rb'

class Spirit < Player
    def initialize(name, character)
        super
    end

    def turn(map)
        super
        loop do
            r = rand(map.length)
            if map.place(r, @character)
                break
            end
        end
    end

end