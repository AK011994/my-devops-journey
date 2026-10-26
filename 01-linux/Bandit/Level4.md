# Bandit Level 4 → Level 5

### Challenge
The password was stored in the only human-readable file inside the `inhere` directory. The goal was to locate that file and read its contents to retrieve the password.

### Commands Used
These are the commands I actually used during the challenge and my additional exploration, in order:
- `ls`
- `cd inhere`
- `ls`
- `ls -l`
- `cat -- -file00`
- `cat -- -file01`
- `cat -- -file02`
- `cat -- -file03`
- `cat -- -file04`
- `cat -- -file05`
- `cat -- -file06`
- `cat -- -file07`
- `man file`
- `file ./-file*`
- `cat ./-file07`

**Successful Commands:**

**Solution 1 — Checking files individually:**
`cat -- -file07`

**Solution 2 — Identifying the human-readable file:**
`file ./-file*`

`cat ./-file07`

### Explanation
I initially used `ls` to list the contents of my home directory, which showed the `inhere` directory.

I then used `cd inhere` to enter the directory and ran `ls` again. This displayed ten files named `-file00` through `-file09`.

I used `ls -l` to examine the file permissions because I initially thought the human-readable file might be the only file with read permission.

However, all ten files had read permission for the `bandit4` group. I realized I couldn't identify the correct file based on permissions alone.

I decided to examine each file individually using `cat`.

Since the filenames began with hyphens, I used `--` to prevent `cat` from interpreting them as command options.

I started with `cat -- -file00` and continued checking each file until I reached:

`cat -- -file07`

This successfully displayed the password in human-readable text.

### Challenges or Discoveries
While using the `cat` command to go through each file individually, I quickly realized how repetitive the process was becoming. It made me wonder whether there was an easier and more efficient way to identify the correct file.

I started thinking about a situation where there might be hundreds of files to examine. Running the `cat` command on each file individually would become extremely time-consuming and cumbersome. I figured there had to be a better approach.

This led me to do some research, where I discovered the `file` command.

After completing the challenge, I explored the `file` command by opening its manual:

`man file`

I learned that `file` identifies the type of content stored in a file.

I also learned about the `*` wildcard, which matches zero or more characters in filenames.

I then ran:

`file ./-file*`

This examined all the matching files and displayed their file types.

Most files were identified as `data`, but `-file07` was identified as `ASCII text`.

This confirmed that `-file07` contained human-readable text.

I then tested:

`cat ./-file07`

This successfully displayed the same password I had found using my original approach.

I learned that `file ./-file*` allows me to identify the content types of multiple files at once. In this case, it helped me quickly locate `-file07`, the only file identified as `ASCII text`.

This approach saves time and makes the process more efficient, especially when working with a large number of files. Instead of running `cat` on every file, I can first use `file` to identify the files I'm interested in and then use `cat` only on those specific files.

### Password
6C7h9GD8M6ai5nr7wo1RonrzFjj9yIrG

### What I Learned
- I learned that `ls -l` displays file permissions, ownership, and other file information.
- I learned that having read permission doesn't necessarily mean a file contains human-readable text.
- I learned that the `file` command identifies the type of content stored in a file.
- I learned that `ASCII text` indicates a file contains human-readable text.
- I learned that the `*` wildcard matches zero or more characters in filenames.
- I learned that `file ./-file*` can identify the types of multiple files without manually checking each one.
- I reinforced my understanding that `--` prevents commands like `cat` from interpreting subsequent filenames as options.
- I learned that `./` can be used to specify a relative file path and avoid problems with filenames beginning with hyphens.
- Most importantly, I learned that there can be more efficient ways to solve a problem, even when my original approach works.