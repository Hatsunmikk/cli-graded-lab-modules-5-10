# Normalize words: lowercase, one per line
tr -c 'a-zA-Z' '\n' < input.txt | tr 'A-Z' 'a-z' > words.txt

# Words containing only vowels
grep -E '^[aeiou]+$' words.txt > vowels.txt

# Words containing only consonants
grep -E '^[^aeiou]+$' words.txt > consonants.txt

# Words starting with consonant and containing both vowels and consonants
grep -E '^[^aeiou][a-z]*$' words.txt | grep -E '[aeiou]' > mixed.txt
