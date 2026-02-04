
# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
  echo "Error: Exactly one argument is required."
  exit 1
fi

# If argument is a file
if [ -f "$1" ]; then
  wc "$1"

# If argument is a directory
elif [ -d "$1" ]; then
  total_files=$(find "$1" -type f | wc -l)
  txt_files=$(find "$1" -type f -name "*.txt" | wc -l)
  echo "Total files: $total_files"
  echo "Text files: $txt_files"

# If path does not exist
else
  echo "Error: Path does not exist."
fi
