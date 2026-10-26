# Bandit Level 7 → Level 8

### Challenge
The password for the next level is stored in a file called data.txt, next to the word millionth.

### Commands Used
ls
cat data.txt
grep "millionth" ./data.txt

### Explanation
I started with ls to see what files were in the directory. Then I used cat data.txt to view the contents of the file.

When I ran cat, I noticed that the file contained a lot of text, making it difficult to manually locate the password.

I remembered learning in my DevOps lessons that grep can search for a specific word and return the entire line containing that word.

Since the challenge mentioned that the password was next to the word millionth, I ran grep "millionth" ./data.txt.

This command searched data.txt for the word millionth and returned the matching line, which contained both the word and the password. This allowed me to find the password without manually searching through the entire file.

### Challenges or Discoveries
I didn't encounter any major challenges during this level. It was straightforward because I was already familiar with the grep command from my DevOps lessons.

Using grep made it easy to locate the password without manually searching through a large file.

### Password
VR1ljMayciFxbnUokuQmJFw6QC9VKtub

### What I Learned
This level helped me practice using the grep command to search for a specific word in a large file.

I learned that instead of reading through the entire file manually, I can use grep to quickly locate a word and display the entire line containing it.

This challenge reinforced what I had already learned in my DevOps lessons and showed me how useful grep can be when searching through large amounts of text.