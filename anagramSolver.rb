# ANAGRAM SOLVER by ETHAN H. JURMAN
charsHash = Hash.new(0) # build hash, with keys = char; values = number of chars avaliable in the chars string
string = gets().chop!.to_s.split("") # split string so we can parse the chars for values
string.each do |char| #building hash
  charsHash[char] = charsHash[char] + 1
end
parseString = "\\A" #building regex with a string, \A = start of string
charsHash.each do |char, num| # [char]{0,value} limits char usages from 0 to value uses
  parseString << "[#{char}]{0,#{num}}"
end
parseString << "\\z" # dictate the end of the string \z
regex = Regexp.new(parseString) #finalize regex
filename = 'dictionary.txt' # use a dictionary file to find words
words = [] # our words array, print this later to find results
File.open(filename, 'r').each_line do |line| 
  line = line.upcase || line # some dictionarys use caps, this will caps only if the line isn't already
  line = line.split("\n")[0] #don't need the new line character
  if line.scan(regex).join("") == line #if the line matches a regex parsing
    words << line # add the word to our words array
  end
end
puts "\nWORD LIST" # header
puts words.sort {|a,b| a.length <=> b.length} # we want the longest word last
puts "done" # yeah we are done!
