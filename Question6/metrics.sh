# Convert text to lowercase words, one per line
words=$(tr -c 'a-zA-Z' '\n' < input.txt | tr 'A-Z' 'a-z')

echo "Longest word:"
echo "$words" | awk '{ print length, $0 }' | sort -nr | head -1 | awk '{print $2}'

echo "Shortest word:"
echo "$words" | awk '{ print length, $0 }' | sort -n | head -1 | awk '{print $2}'

echo "Average word length:"
echo "$words" | awk '{ total+=length; count++ } END { print total/count }'

echo "Total number of unique words:"
echo "$words" | sort | uniq | wc -l
