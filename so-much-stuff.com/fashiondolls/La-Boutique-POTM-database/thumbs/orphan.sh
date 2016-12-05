for i in *.jpg; do
  if test ! -f ../$i; then
     echo $i
  fi
done
