# Bandit Level 1 → Level 2

### Challenge:
Find the password stored in a file named `-` in the home directory.

### Commands Used:
ls
cat ./-

### Explanation:
- `ls` lists the files and directories in the current directory.
- `cat` displays the contents of a file.
- `./` refers to the current directory, so `cat ./-` reads the file named `-`.

### Challenges or Discoveries:
Initially, I tried `cd -`, but realized that `cd` is used to navigate between directories, not read files.

Next, I tried `cat -`, but the terminal waited for my input.

I then tried `cat ./-`, which worked because it explicitly pointed to the file named `-` in my current directory.

### password
6y2kwnwK6grgvwvpvLaa2T1cpFEKOhNR

### What I Learned:
I learned that I need to be more mindful of which command I use. After running `ls`, I automatically tried using `cd` out of habit without considering whether I needed to navigate into a directory or read a file.

I also learned that `./` refers to the current directory and can help access files with unusual names, such as `-`.




