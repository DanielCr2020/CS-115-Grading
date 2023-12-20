#!/bin/bash
# CS115grader.sh

#Daniel Craig
#CS 115 CA
#CS 115 bash script grading test

#Runs test script against all files in a folder, saving output to Output.txt

#Runs the test script for all files in the specified folder, 
#modifying the test script file to import the current file
#then runs the test script for that file, saving the output to Output.txt in the same folder as the test script
#Output.txt has the output from the test script each file as well as the names of each file. They are numbered as well.
#For some test scripts, change the import so that only one thing needs to be changed.
#What I did was take all of my students submissions and put them in their own folder
#I usually ran this in the top level directory. For me, that was /mnt/c/Users/Daniel/Documents/College Work/Semester 5/CS 115 CA/
    # (This was on WSL2)
#I had to have the /bin/ stuff to get it to work for me. You may need to change that.

if [[ $# -ne 4 ]]; then
    usage=$(cat << HEREDOC 
Usage: ./$(basename $0) [arg1] [arg2] [arg3] [arg4] 
    arg1: Name of test file used to run against student files
    arg2: String in test file to replace with file names from the folder
    arg3: Path to student submissions folder 
    arg4: Path to folder that contains test file (Output.txt is saved here)

  example: ./$(basename $0) test_lab1.py lab1Solution Lab1HW1/CAs/Lab1/submissions Lab1HW1/CAs/Lab1
HEREDOC
)
    echo "$usage"
    exit
fi

path=$(pwd)
cp $4/$1 $3/$1
cd "$3"
touch Output.txt
echo "" > Output.txt
let i=0

for file in *; do           #removes hyphens and spaces from file names
    if [[ $file == *".py"* ]]; then   
        if [[ $file == *"-"* ]]; then
            mv "${file}" "${file//-/_}"
        fi
        if [[ $file == *" "* ]]; then
            mv "${file}" "${file// /_}"
        fi
    fi
done

for file in *; do           #For each file in the folder
    #Checks if the file is a python file and not the test script (so it won't try to run the test script against itself)
    if [[ $file == *".py"* ]]; then   
        if [[ $file != "$1" ]]; then
            ((i++))
            echo "$i" "########" $file "########" >> Output.txt
            file2=${file::-3}                                              #Takes off .py extension
            sed -i "s/$2/$file2/g" "$path"/"$3"/"$1" 2>/dev/null      #in test file, replaces solution file name ($3) with student's file name ($2)
            python3 "$1"      1>>Output.txt 2>>Output.txt             #runs test file 
            sed -i "s/$file2/$2/g" "$path"/"$3"/"$1" 2>/dev/null      #swaps it back to the loop works again the next time
            echo -e "\n" >> Output.txt
            echo "Finished file" $i
        fi
    fi
done

rm -rf __pycache__/*.pyc                        #removes compiled python files
rm -rf __pycache__

sed -i "s/$file/$2/g" "$3"/"$1" 2>/dev/null     #changes it back at the end
mv Output.txt "$path"/"$4"
cd "$path"
echo "Finished testing all files"