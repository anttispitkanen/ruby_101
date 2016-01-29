#Encrypts the given string (message) by shifting right by a factor (n).


def caesar_cipher (message, n)
  lowcase_letters = ('a'..'z').to_a
  upcase_letters = ('A'..'Z').to_a

  new_string = ""

  message.each_char do |chr|
    if lowcase_letters.include?(chr)
      char_index = lowcase_letters.index(chr)
      new_string << lowcase_letters[(char_index + n) % 26]
    elsif upcase_letters.include?(chr)
      char_index = upcase_letters.index(chr)
      new_string << upcase_letters[(char_index + n) % 26]
    else
      new_string << chr
    end
  end
  new_string
end


puts caesar_cipher "What a string!", -30
