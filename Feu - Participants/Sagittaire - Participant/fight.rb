$number_of_turn = 1
$victoryHero = 0
$victoryEnemy = 0

$sagittarius_actions = ""

def getAction(action)
    position = action.index(";")
    return action[position+1..-1]
end

def randomActionSagittarius()
    if $sagittarius_actions == ""
        $sagittarius_actions = getAllActions("./action_sagittarius.txt")
    end
    return $sagittarius_actions[rand($sagittarius_actions.length)]
end

def fight(hero, enemy)
    puts "===== Tour " + $number_of_turn.to_s + " ====="
    sleep(1)
    puts "Sagittaire : " + getAction(enemy)
    sleep(2)
    puts "Toi        : " + getAction(hero)
    sleep(2)
    if getIdAction(hero) == getIdAction(enemy)
        $victoryHero += 1
        puts "Tu gagnes ce round!"
    else
        $victoryEnemy += 1
        puts "Le Sagittaire gagne ce round!"
    end
    puts
    $number_of_turn += 1
    if $victoryHero == 5
      puts "Tu remportes la partie! Tu peux donc accéder au sommet du volcan!"
      exit(0)
    elsif $victoryEnemy == 5
      puts "Le Sagittaire remporte la partie, re essaye de le battre!"
      exit (0)
    end
end