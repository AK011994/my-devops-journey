# Bandit Level 8 → Level 9

### Challenge
The password for the next level is stored in a file called data.txt. The file contains multiple lines of text, but only one line appears exactly once. The goal is to identify that unique line, which contains the password needed to access Level 9.

### Commands Used
ls
cat data.txt
man sort
sort data.txt
man uniq
uniq -u data.txt
sort | -u data.txt
sort | unique -u data.txt
sort data.txt | uniq -u

### Explanation
I started by running ls to see what files were in the directory. Then I used cat data.txt to view the file's contents. The file contained so many lines that it would have been difficult to manually identify which line appeared only once.

I remembered learning about the sort command in my DevOps lessons, but I had forgotten how it worked. So I used man sort to review its functionality. After running sort data.txt, I noticed that it grouped identical lines together. However, it didn't identify the single line that appeared only once.

I then used man uniq to learn more about the uniq command. While reading the manual, I discovered the -u option, which displays only lines that occur once among adjacent identical lines.

I tried uniq -u data.txt, but this didn't give me the expected result. The output appeared unsorted because uniq was reading the original file rather than the sorted results. I decided to research how to connect the two commands and learned about the pipe operator (|).

My first attempt was sort | -u data.txt. This failed because -u is an option, not a command. I realized I needed to specify the command that uses the -u option. I then tried sort | unique -u data.txt. This also failed because the correct command is uniq, not unique.

Something that confused me most was understanding how the pipe passed information between commands. Initially, I thought I needed to provide the filename to both commands. I eventually understood that the pipe passes the output data from one command directly to the next command as input, rather than passing the filename itself.

With that understanding, I ran sort data.txt | uniq -u. This worked because sort first read data.txt and grouped identical lines together. The pipe (|) then passed those sorted lines to uniq -u, which displayed only the line that occurred once.

This successfully returned the password for the next level.

### Challenges or Discoveries
The biggest challenge I faced during this level was understanding how to use the pipe operator (|) to connect two Linux commands.

Initially, I understood what sort and uniq -u did individually, but I struggled to figure out how to make them work together.

I learned that running sort data.txt only displays the sorted results in the terminal. It does not modify the original file. This explained why running uniq -u data.txt afterward didn't give me the expected result.

I also made a few mistakes while trying to use the pipe operator. I initially forgot to include the uniq command before -u, and later mistakenly typed unique instead of uniq.

My biggest discovery was understanding that a pipe passes data between commands, not the filename or command-line arguments.

For example, sort data.txt | uniq -u:
- sort data.txt reads the file and groups identical lines together.
- | passes the sorted output directly to the next command.
- uniq -u receives that output through standard input (stdin) and displays the line that occurs only once.
I also learned that I don't need to create a separate file to store the sorted results. Linux can pass the data directly between programs using a pipe.

This challenge helped me better understand how standard input (stdin), standard output (stdout), and pipes work together.

### Password
EjmOSvuAu7sGAHqHVcBDPirRe9T03kxl

### What I Learned
This level helped me understand how to combine Linux commands using the pipe operator (|). I learned that sort organizes lines and groups duplicates together, while uniq -u displays only lines that occur once among adjacent identical lines. Most importantly, I learned that a pipe passes the output of one command directly to another command as input, without needing to save the results into a separate file.

This challenge also reinforced my understanding of standard input (stdin) and standard output (stdout), and showed me how multiple Linux commands can work together to solve a problem.