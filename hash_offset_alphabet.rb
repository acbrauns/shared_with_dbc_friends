# In this case, we want to set:
#   "a" => "w" #alpha[22]. Note that [22]==(alpha.length-offset),  because alpha.length == 26, and offset = 4
#   "b" => "x" 
#   "c" => "y"
#   "d" => "z"

def hash_offset(array, offset)
  hash = {}
   
  i = 0
  while i < array.length 
    if i >= (array.length - offset)  #if i >= 22, in this case. So this condition applies for the last 4 elements of the array
      hash[array[i-array.length + offset]] = array[i] # hash[array[22-26+4]] --> hash[array[0]] --> hash["a"]=array[22] --> hash["a"]="w"
    else
      hash[(array[i].ord + offset).chr] = array[i] #otherwise do the normal offset by 4
    end
    i += 1
  end
  return hash
end

alpha = ("a".."z").to_a
hash =  hash_offset(alpha, 4)

puts hash

#output when I run it:
#{"e"=>"a", "f"=>"b", "g"=>"c", "h"=>"d", "i"=>"e", "j"=>"f", "k"=>"g", "l"=>"h", "m"=>"i", "n"=>"j", "o"=>"k", "p"=>"l", "q"=>"m", 
# "r"=>"n", "s"=>"o", "t"=>"p", "u"=>"q", "v"=>"r", "w"=>"s", "x"=>"t", "y"=>"u", "z"=>"v", "a"=>"w", "b"=>"x", "c"=>"y", "d"=>"z"}


