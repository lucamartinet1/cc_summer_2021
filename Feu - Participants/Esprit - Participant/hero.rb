require 'player.rb'

class Hero < Player
    def initialize(name, character)
        super
    end

    def turn(map)
        super
        puts "Tu joue pas !"
        return
        loop do
            print "Jeton à mettre à la colonne n° : "
            input = gets.chomp 
            if input.length != 1
                puts "Il ne faut entrer qu'un seul charactère"
                next
            end
            if !/^[0-9]+$/.match?(input)
                puts "Il ne faut entrer qu'un chiffre"
                next
            end
            pos = input.to_i + 1
            if pos == 7
              pos = 0
            end
            if pos < 0 || pos >= map.length
                puts "Le numéro de la colonne entrée n'est pas entre 0 et 6"
                next
            end
            if !map.place(pos, @character)
                puts "Il n'y a plus de place dans cette colonne"
                next
            end
            break
        end
    end

end