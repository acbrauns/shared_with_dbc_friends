def north_korean_cipher(coded_message) 
  decoded_sentence = []

  values = ("a".."z").to_a
  cipher =  hash_offset(values, 4)

  
  coded_message.downcase.each_char do |x| 
      if cipher.has_key?(x) 
        decoded_sentence << cipher[x]
      elsif ["@","#","$","%","^","&","*"].include?(x)
        decoded_sentence << " "
      else  
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/)
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } 
  end  
  return decoded_sentence      
end


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


# Driver Test Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver test code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver test code as well. Driver test code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.")  =="our people eat the most delicious and nutritious foods from our 10000 profitable farms."  
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") =="our nukes are held together by grape-flavored toffee. don't tell the us!" 
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"  
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?" 
