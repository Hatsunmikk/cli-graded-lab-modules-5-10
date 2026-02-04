pattern='^[a-zA-Z0-9]+@[a-zA-Z]+\.com$'

# Extract valid emails
grep -E "$pattern" emails.txt > valid.txt

# Extract invalid emails
grep -Ev "$pattern" emails.txt > invalid.txt

# Remove duplicates from valid emails
sort valid.txt | uniq > temp.txt
mv temp.txt valid.txt
