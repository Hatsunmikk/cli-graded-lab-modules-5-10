echo "Files only in dirA:"
comm -23 <(ls dirA | sort) <(ls dirB | sort)

echo ""
echo "Files only in dirB:"
comm -13 <(ls dirA | sort) <(ls dirB | sort)

echo ""
echo "Comparing common files:"

for file in dirA/*; do
  name=$(basename "$file")
  if [ -f "dirB/$name" ]; then
    cmp dirA/$name dirB/$name > /dev/null
    if [ $? -eq 0 ]; then
      echo "$name is identical in both directories"
    else
      echo "$name differs between directories"
    fi
  fi
done
