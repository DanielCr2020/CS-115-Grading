# CS-115-Grading
My grading script I used for Stevens CS 115 assignments.

How it works:
First, it removes the hyphens and spaces from the file names and replaces them with underscores, since python doesn't like those. Then, for each file in the folder, it checks if file name is not the same as the test script provided, only running if both are true (it doesn't try to run the test script against itself). It needs to do this because it copies the test script to the submissions folder. It also only runs .py files. Then it edits the test script to have the basename of the submission file, runs the test script, and then appends that to Output.txt. Then it resets the test file, and runs the process again. It does this for the whole folder. Finally, it removes the compiled python files and folders.

Details on how to run the grading script are provided in CS115grader.sh But here they are again anyway:

Run it in the top level directory of your CS 115 folder. ./CS115grader.sh [arguments here] ./CS115grader.sh with no arguments will give you the usage.

Runs test script against all files in a folder, saving output to Output.txt

Runs the test script for all files in the specified folder, Mmodifying the test script file to import the current file Then runs the test script for that file, saving the output to Output.txt in the same folder as the test script Output.txt has the output from the test script each file as well as the names of each file. They are numbered as well. For some test scripts, change the import so that only one thing needs to be changed.

Some scripts will take a while to run.

The terminal will output "Finished file x" as each file is graded and "Finished testing all files" when everything is done.
