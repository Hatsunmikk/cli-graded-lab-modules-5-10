pass_all=0
fail_one=0

while IFS=, read roll name m1 m2 m3
do
  fail_count=0

  if [ "$m1" -lt 33 ]; then
    fail_count=$((fail_count+1))
  fi
  if [ "$m2" -lt 33 ]; then
    fail_count=$((fail_count+1))
  fi
  if [ "$m3" -lt 33 ]; then
    fail_count=$((fail_count+1))
  fi

  if [ "$fail_count" -eq 0 ]; then
    echo "$name passed all subjects"
    pass_all=$((pass_all+1))
  elif [ "$fail_count" -eq 1 ]; then
    echo "$name failed in exactly one subject"
    fail_one=$((fail_one+1))
  fi
done < marks.txt

echo "-----------------------"
echo "Students passed all subjects: $pass_all"
echo "Students failed one subject: $fail_one"
