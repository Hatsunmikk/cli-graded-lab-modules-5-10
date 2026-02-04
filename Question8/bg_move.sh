# Check argument count
if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Check if directory exists
if [ ! -d "$1" ]; then
  echo "Error: Directory does not exist."
  exit 1
fi

echo "Script PID: $$"

mkdir -p "$1/backup"

for file in "$1"/*; do
  if [ -f "$file" ]; then
    mv "$file" "$1/backup/" &
    echo "Moved $(basename "$file") with PID $!"
  fi
done

wait
echo "All background processes completed."
