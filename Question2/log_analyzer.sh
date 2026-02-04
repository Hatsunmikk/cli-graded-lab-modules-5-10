# Check argument count
if [ $# -ne 1 ]; then
  echo "Usage: $0 <logfile>"
  exit 1
fi

# Check if file exists and is readable
if [ ! -r "$1" ]; then
  echo "Error: File does not exist or is not readable."
  exit 1
fi

total=$(wc -l < "$1")
info=$(grep -c "INFO" "$1")
warning=$(grep -c "WARNING" "$1")
error=$(grep -c "ERROR" "$1")
recent_error=$(grep "ERROR" "$1" | tail -n 1)

report="logsummary_$(date +%F).txt"

{
  echo "Log Summary Report"
  echo "------------------"
  echo "Total entries: $total"
  echo "INFO messages: $info"
  echo "WARNING messages: $warning"
  echo "ERROR messages: $error"
  echo ""
  echo "Most recent ERROR:"
  echo "$recent_error"
} > "$report"

cat "$report"
