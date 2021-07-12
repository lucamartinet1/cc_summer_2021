def verification(rubis)
    puts "Est-ce que ce ruby est le bon ?"
    array = rubis.split(/\n+/)
    victory = true
    array.each_with_index do |line, index|
        if index == 1
            if (line.count "/") == 1 && (line.count "\\") == 1 && (line.count "\|") == 2
                victory = true
            else
                victory = false
            end
        end
        if index == 2
            if victory == true && (line.count "/") == 1 && (line.count "\\") == 1 && (line.count "'") == 2 && (line.count ".") == 2
                victory = true
            else
                victory = false
            end
        end
    end

    if victory == true
        puts rubis
        puts "Porte déverouillée !"
    else
        puts "Ce n'est pas le bon rubis"
    end

end


