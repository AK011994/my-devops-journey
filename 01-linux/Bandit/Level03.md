# Bandit Level 3 → Level 4

### Challenge
The level asked us to find the password stored in a hidden file inside the `inhere` directory.

### Commands Used
These are the commands I actually tried during the challenge, in order:
- `ls`
- `cd inhere`
- `ls a`
- `ls -a`
- `cat ./...Hiding-From-You`

**Successful command:**
`cat ./...Hiding-From-You`

### Explanation
I initially used `ls` to list the contents of my home directory, which showed the `inhere` directory.

I then used `cd inhere` to enter that directory and look for the password file.

I accidentally typed `ls a` instead of `ls -a`. Since I forgot the hyphen, Linux interpreted `a` as a filename or directory rather than an option.

After correcting my command to `ls -a`, I was able to see the hidden file named `...Hiding-From-You`.

I then ran:

`cat ./...Hiding-From-You`

This successfully displayed the password.

### Challenges or Discoveries
One thing I found interesting was that the filename started with three dots.

Initially, I used `./` because I thought `cat` might interpret the three dots at the beginning of the filename as something special.

After researching this, I learned that the three dots are simply part of the filename. Unlike filenames beginning with hyphens, they are not interpreted as command options.

I realized I could also run:

`cat ...Hiding-From-You`

I tested this command after completing the challenge, and it worked.

I learned that `./` was not necessary because the filename did not begin with a hyphen or contain spaces or other characters requiring special handling.

### Password
xzTXq1rDJQVVAzdv5cHq1TQytTWufAMq

### What I Learned
- I learned that `ls` lists the contents of a directory.
- I learned that `cd` changes my current directory.
- I learned that `ls -a` displays hidden files, including files beginning with dots.
- I learned that forgetting the hyphen in `ls -a` changes how Linux interprets the command.
- I learned that three dots at the beginning of a filename are ordinary filename characters, not command options.
- I learned that `./` specifies a path relative to the current directory, but it is not always necessary.
- I learned that I can use `cat` followed by a filename without quotation marks or `./`, as long as the filename doesn't require special handling.
- Most importantly, I learned the difference between filenames beginning with dots and filenames beginning with hyphens.