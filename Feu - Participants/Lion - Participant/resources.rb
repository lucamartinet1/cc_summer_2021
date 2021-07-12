$player_x = -1
$player_y = -1

def right
    if $player_x == -1 && $player_y == -1
        getPlayer
    end
    if $maze[$player_y][$player_x + 1] == '#'
        puts "===== /!\\ MUR /!\\====="
        return
    end
    if $maze[$player_y][$player_x + 1] == 'S'
        puts "Tu as gagné bravo ! Le Lion va pouvoir manger !"
        exit 0
    end
    $maze[$player_y][$player_x + 1] = 'L'
    $maze[$player_y][$player_x] = ' '
    $player_x += 1
end

def left
    if $player_x == -1 && $player_y == -1
        getPlayer
    end
    if $maze[$player_y][$player_x - 1] == '#'
        puts "===== /!\\ MUR /!\\====="
        return
    end
    if $maze[$player_y][$player_x - 1] == 'S'
        puts "Tu as gagné bravo ! Le Lion va pouvoir manger !"
        exit 0
    end
    $maze[$player_y][$player_x - 1] = 'L'
    $maze[$player_y][$player_x] = ' '
    $player_x -= 1
end

def up
    if $player_x == -1 && $player_y == -1
        getPlayer
    end
    if $maze[$player_y - 1][$player_x] == '#'
        puts "===== /!\\ MUR /!\\====="
        return
    end
    if $maze[$player_y - 1][$player_x] == 'S'
        puts "Tu as gagné bravo ! Le Lion va pouvoir manger !"
        exit 0
    end
    $maze[$player_y - 1][$player_x] = 'L'
    $maze[$player_y][$player_x] = ' '
    $player_y -= 1
end

def down
    if $player_x == -1 && $player_y == -1
        getPlayer
    end
    if $maze[$player_y + 1][$player_x] == '#'
        puts "===== /!\\ MUR /!\\====="
        return
    end
    if $maze[$player_y + 1][$player_x] == 'S'
        puts "Tu as gagné bravo ! Le Lion va pouvoir manger !"
        exit 0
    end
    $maze[$player_y + 1][$player_x] = 'L'
    $maze[$player_y][$player_x] = ' '
    $player_y += 1
end

def getPlayer()
    $maze.each_with_index do |line, y|
        x = line.index('L') 
        if x != nil
            if $player_x != -1  || (line.count "L") >= 2
                puts "Il y a 2 Lions présent dans le fichier !"
                exit 84
            else
                $player_x = x
                $player_y = y
            end
        end
    end
    if $player_x == -1
        puts "Il n'y a pas de Lion présent dans le fichier"
        exit 84
    end
end