# ANAGRAM SOLVER by ETHAN H. JURMAN
charsHash = Hash.new(0) # build hash, with keys = char; values = number of chars avaliable in the chars string
string = (ARGV[0] || gets().chop!).upcase.split("").sort() # split it! (and sort it)
string.each do |char| #building hash
  charsHash[char] = charsHash[char] + 1 end
parseString = ""
charsHash.each do |char, num| # [char]{0,value} limits char usages from 0 to value uses
  parseString << "[#{char}]{0,#{num}}" end
regex = Regexp.new("^#{parseString}\\z") #finalize regex (\\A and \\z dictate that there will only be one regex per line)
filename = 'dictionary.txt' # use a dictionary file to find words
words = [] # our words array, print this later to find results
File.open(filename, 'r').each_line do |line| 
  line = line.upcase.split("\n")[0] #don't need the new line character
  if line.split("").sort().join("").match(regex) #if the line (sorted) matches a regex parsing
    words << line # add the word to our words array
  end
end
puts words.sort {|a,b| a.length <=> b.length}[(-ARGV[1].to_i || 0)..-1] # we want the longest word last