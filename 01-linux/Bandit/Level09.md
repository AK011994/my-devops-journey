# Bandit Level 9 → Level 10

### Challenge
Find the password for the next level in data.txt. The password is one of the human-readable strings in the file and is preceded by several = characters.
Commands Used
- grep "==" data.txt
- strings ./data.txt | grep "=="
- strings ./data.txt | grep "==="

### Explanation
I first tried searching the file directly with grep "==" data.txt, but the terminal said grep: data.txt: binary file matches. I learned that this wasn't because there were too many matches. It was because the file contains binary data.

I used strings ./data.txt to extract readable text from the file. I then used a pipe (|) to pass that text to grep, which searched for the equals signs.

When I ran strings ./data.txt | grep "==", I narrowed the output to four lines: one containing the, one containing password, one containing is, and one containing the password. I also tried grep "===", which returned the same four lines because they all had at least three consecutive equals signs.

I found the password in the output and solved the level.

### Challenges or Discoveries
- At first, I thought grep said “binary file matches” because too many lines matched. I learned it was actually because the input file contained binary data.
- I discovered that strings extracts readable text, while grep finds a specific pattern in that text.
- I learned that grep "==" matches lines with at least two consecutive equals signs, and grep "===" matches lines with at least three.
- I learned that the pipe passes the output of strings directly to grep without saving it to another file.
- Running strings ./data.txt alone would still show the password, but it would also show many other readable strings.
### Password
B0s2khmbT9u0geKuOoVGW3JZKhndE3BG

### What I Learned
strings extracts readable text from a binary file. grep searches text for a pattern. By combining them with a pipe, I can filter the readable strings and find the information I need more easily.