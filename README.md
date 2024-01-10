# CS-115-Grading
Grading script I used for Stevens CS 115 assignments.

## Usage:

Here are the arguments you need to provide to the script. These are also listed in the script itself:

`./CS115grader.sh [arg1] [arg2] [arg3] [arg4]`

```
arg1: Name of test file used to run against student files
arg2: String in test file to replace with file names from the folder
arg3: Path to student submissions folder 
arg4: Path to folder that contains test file (Output.txt is saved here)
```

Providing no arguments will print this usage message.

## How it works:

First, it removes the hyphens and spaces from the file names and replaces them with underscores, since those causes issues when used in python import lines. 

Then, for each file in the folder, it checks if the file name is not the same as the test script provided (it doesn't try to run the test script against itself). It needs to do this because it copies the test script to the submissions folder. It also only runs .py files. 

Then, it edits the test script to have the basename of the submission file, runs the test script, and then appends the test results for that student to Output.txt. 

Then it resets the test file, and runs the process again. It does this for the whole folder. 

Finally, it removes the pycache files and folders.

## Output

Output.txt is saved to the same directory as the test file. It is formatted as follows:

```
<number> ######## <file1> ########
<test results for file1>



<number+1> ######## <file2> ########
<test results for file2>
```

For some test scripts, you may want to change the import so that only one line in that file needs to be changed by the script.

Some scripts will take longer to run than others.

The terminal will output "Finished file x" as each file is graded and "Finished testing all files" when everything is done.
