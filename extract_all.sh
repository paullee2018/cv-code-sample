#! /bin/bash

echo "Sorry for this inconvenience, you can find it on my CV."
read -s -p "Password: " password

echo -e "\n"
for i in $(ls *.tar.gz.zip); do
    d=${i%%.*}

    echo "extracting $i ..."
    unzip -p -P $password $i | tar zxf - 2>/dev/null

    [ $? -ne 0 -o ! -d $d ] && \
        { echo -e "\nUnable to extract, wrong password maybe ?"; exit 1; }
    [ -f $i  ] && rm -f $i
done

echo -e "\nDone"
echo "Thanks for your precious time!"
