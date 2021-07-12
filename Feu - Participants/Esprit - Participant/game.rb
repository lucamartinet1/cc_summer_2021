require 'map.rb'
require 'constant.rb'
require 'spirit.rb'
require 'hero.rb'

class Game

    def initialize()
        @map = Map.new(Constant::HEIGHT, Constant::LENGTH)
        @hero = Hero.new("Vous", Constant::SPIRIT_CHARACTER)
        @spirit = Spirit.new("Esprit", Constant::SPIRIT_CHARACTER)
    end

    def run()
        victory = false

        while !victory
            @spirit.turn(@map)
            @spirit.turn(@map)
            @spirit.turn(@map)
            @spirit.turn(@map)
            @spirit.turn(@map)
            @map.print()
            if check_victory(@spirit.character)
                puts "L'esprit gagne... Malheur !"
                return
            end
            @spirit.turn(@map)
            @map.print()
            #if check_victory(@hero.character)
            #    puts "Et non l'esprit gagne quand même !"
            #    return
            #end
        end
    end

    def check_victory(character)
        count = 0

        for y in 0..@map.height - 1
            for x in 0..@map.length - 1
                if @map.map[y][x] == character
                    count += 1
                else
                    count = 0
                end
                if count == Constant::VICTORY_ALIGNMENT
                    return true
                end
            end
            count = 0
        end

        for x in 0..@map.length - 1
            for y in 0..@map.height - 1
                if @map.map[y][x] == character
                    count += 1
                else
                    count = 0
                end
                if count == Constant::VICTORY_ALIGNMENT
                    return true
                end
            end
            count = 0
        end

        for y in Constant::VICTORY_ALIGNMENT - 1..@map.height - 1
            for x in 0..@map.length - 1
                diagonal_x = x
                diagonal_y = y

                until diagonal_x == 0 || diagonal_y == 0
                    diagonal_x -= 1
                    diagonal_y -= 1
                end
                while diagonal_x < @map.length && diagonal_y < @map.height
                    if @map.map[diagonal_y][diagonal_x] == character
                        count += 1
                    else
                        count = 0
                    end
                    if count == Constant::VICTORY_ALIGNMENT
                        return true
                    end
                    diagonal_x += 1
                    diagonal_y += 1
                end
                count = 0

                diagonal_x = x
                diagonal_y = y

                until diagonal_x == 0 || diagonal_y == @map.height - 1
                    diagonal_x -= 1
                    diagonal_y += 1
                end
                while diagonal_x < @map.length && diagonal_y >= 0
                    if @map.map[diagonal_y][diagonal_x] == character
                        count += 1
                    else
                        count = 0
                    end
                    if count == Constant::VICTORY_ALIGNMENT
                        return true
                    end
                    diagonal_x += 1
                    diagonal_y -= 1
                end
                count = 0
            end
        end
        return false
    end

end
