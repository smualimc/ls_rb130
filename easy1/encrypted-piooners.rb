=begin
The following list contains the names of individuals who are pioneers in the field of 
computing or that have had a significant influence on the field. The names are in an 
encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

Write a program that deciphers and prints each of these names .

Pedac
input:
output:

data structure: use working array for character of each name
algorithm:
iterate each name from the names array
  convert each name into an array of characters
  map the characters array
   using a helper method decipher each character
  join the mapped name

decipher
  if the character is from a..m or from A..M add 13 to the character.ord and convert 
    the integer result using Integer.chr
  if the character is from n..z or N..Z substract 13 to the character.ord and convert 
    the integer result using Integer.chr
=end

def rot13(names)
  names.each do |name|
    puts (name.chars.map do |char|
      decipher(char)
    end.join)
  end
end

def decipher(char)
  return (char.ord + 13).chr if char.match?(/[a-m]/i)
  return (char.ord - 13).chr if char.match?(/[n-z]/i)
  char
end


names = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu",
  ]
  
  rot13(names)



