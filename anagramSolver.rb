# ANAGRAM SOLVER by ETHAN H. JURMAN
charsHash = Hash.new(0) # build hash, with keys = char; values = number of chars avaliable in the chars string
string = (ARGV[0] || gets().chop!).upcase.split("").sort() # split it! (and sort it)
string.each { |char| charsHash[char] = charsHash[char] + 1 } #building hash
parseString = "" # initalize string
charsHash.each { |char, num| parseString << "[#{char}]{0,#{num}}" } # [char]{0,value} limits char usages from 0 to value uses
regex = Regexp.new("^#{parseString}\\z") #finalize regex (\\A and \\z dictate that there will only be one regex per line)
filename = 'dictionary.txt' # use a dictionary file to find words
words = [] # our words array, print this later to find results
File.open(filename, 'r').each_line do |line| 
  if line.upcase.chop!.split("").sort().join("").match(regex) #if the line (sorted, upcased, chopped) matches a regex parsing
    words << line.upcase # add the word to our words array
  end
end
puts words.sort {|a,b| a.length <=> b.length}[(-ARGV[1].to_i || 0)..-1] # we want the longest word last