require './verification'


def getrubies()
    allrubies = []
    rubies = ""
    File.open('rubies.txt').each do |line|
        if "#{line}" != "\n"
            rubies += "#{line}"
        else 
            allrubies << rubies
            rubies = ""
        
        end

    end
    return allrubies
end
puts getrubies()
print(getrubies)