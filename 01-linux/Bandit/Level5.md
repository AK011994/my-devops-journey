# Bandit Level 5 → Level 6

### Challenge
The password for the next level was stored in a file somewhere inside the `inhere` directory. The file had the following properties:

- Human-readable
- Exactly 1,033 bytes in size
- Not executable

The goal was to locate the file that matched all three conditions and read its contents to retrieve the password.

### Commands Used
- `ls`
- `ls -l`
- `cd ..`
- `cd maybehere01`
- `file ./-file1 ./spaces\ file2`
- `file ./-file2 ./spaces\ file2`
- `ls -l ./inhere/maybehere*`
- `man du`
- `man find`
- `find ./inhere/maybehere* -size 1033c`
- `ls -l ./inhere/maybehere07/.file2`
- `cat ./inhere/maybehere07/.file2`

**Successful commands:**
`find ./inhere/maybehere* -size 1033c`
`ls -l ./inhere/maybehere07/.file2`
`cat ./inhere/maybehere07/.file2`

### Explanation
I started by entering the first `maybehere` directory to see what files were inside. I used `ls -l` to examine the file permissions and sizes.

After looking at the permissions, I noticed that only two files did not have execute permission. Since the challenge specified that the correct file was not executable, I focused on those two files.

Next, I used the `file` command to check their content types. Both were identified as `ASCII text`, meaning they contained human-readable text. However, neither matched the required size of 1,033 bytes.

I realized that manually entering each directory, checking permissions, examining file types, and comparing sizes would become very repetitive. There were multiple `maybehere` directories, and I wanted a more efficient way to examine their contents.

I discovered that I could use `ls -l ./inhere/maybehere*` to list the files inside multiple directories without entering each directory individually.

This allowed me to view file permissions and sizes across all the matching directories at once.

However, there was still a lot of information to examine manually. I started wondering whether there was a command that could search for files based on their size instead of making me look through every result.

I explored the `du` and `find` commands using their manual pages and decided that `find` was better suited for searching for a file with a specific size.

After learning how the `-size` option works and that `c` represents bytes, I ran:

`find ./inhere/maybehere* -size 1033c`

This returned:

`./inhere/maybehere07/.file2`

I then used:

`ls -l ./inhere/maybehere07/.file2`

I wanted to verify that the file was exactly 1,033 bytes and did not have execute permission. The output confirmed both conditions.

Finally, I ran:

`cat ./inhere/maybehere07/.file2`

This displayed the password for the next level.

### Challenges or Discoveries
**1.** One of my biggest discoveries was understanding how my current location in the Linux filesystem affects the commands I run.

Initially, I was entering each `maybehere` directory individually to examine its files. However, I realized that navigating back to my home directory made it easier to use relative paths to access multiple directories at once.

For example, I used:

`ls -l ./inhere/maybehere*`

This allowed me to list the contents of all matching `maybehere` directories without entering each one.

I also learned that I don't necessarily have to leave a directory to search elsewhere. I can use relative or absolute paths to access files and directories from different locations.

**2.** Another important discovery was learning how useful the `find` command is.

Initially, I was using `ls -l` to examine file permissions and sizes manually. However, checking every file across multiple directories was time-consuming.

I discovered that `find` could search for files based on specific conditions, such as their size.

For example:

`find ./inhere/maybehere* -size 1033c`

This allowed me to locate a file that was exactly 1,033 bytes without manually examining every file.

I also learned that `find` can search using many different conditions, not just file size.

**3.** I discovered how useful the asterisk (`*`) wildcard is when working with multiple files and directories.

Instead of typing every directory name individually, I could use `*` to match multiple names that followed a similar pattern.

For example:

`ls -l ./inhere/maybehere*`

The wildcard matched all directory names beginning with `maybehere`.

I also discovered that wildcards can be used with different commands, including `ls` and `find`.

This made it easier to work with multiple directories and files without having to specify each one individually.

### Password
pXa26xhMWaC2SvDotA4r9EgZkulOeSBW

### What I Learned
This challenge taught me how to search for files more efficiently instead of manually examining every directory.

I learned how to use `find` with the `-size` option to locate files based on their exact size, how wildcards can help work with multiple directories, and how my current directory affects the relative paths I use.

I also gained more experience reading Linux manual pages to understand unfamiliar commands and their options.

My biggest takeaway was learning to recognize when a manual approach was becoming inefficient and finding a better way to accomplish the task.