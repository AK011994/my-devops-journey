### Bandit Level 6 → Level 7

### Challenge
The password for Bandit Level 7 is stored somewhere on the server, meaning it could be located in any directory.

To locate the correct file, it must meet all three requirements:
- Owned by user: bandit7
- Owned by group: bandit6
- File size: Exactly 33 bytes
A file matching all three conditions contains the password for the next level.

### Commands Used
ls
ls -a
ls -la
cd ..
man find
find ./ -user bandit7 -group bandit6 -size 33c
find ./bandit* -user bandit7 -group bandit6 -size 33c
find / -user bandit7 -group bandit6 -size 33c 2> /dev/null
cat /var/lib/dpkg/info/bandit7.password

### Explanation
I started with ls, then used ls -a to show hidden entries and ls -la to inspect permissions, ownership, and file sizes. The entries I checked were owned by root, rather than matching the challenge's ownership requirements. I used cd .. to move up to /home and saw many more directories. Moving farther up made me realize how many locations there were to search.

Rather than checking every directory manually, I opened the find manual using man find. I discovered the -user and -group options. The manual uses uname and gname as placeholders for a username and group name; they are not directory names or commands to type literally.

My first search used find ./ -user bandit7 -group bandit6 -size 33c, starting in the current directory. It returned several Permission denied messages. I then tried find ./bandit* -user bandit7 -group bandit6 -size 33c, thinking the password might be in a Bandit directory. That also produced permission errors. I tried entering some restricted directories manually, but I couldn't access them.

I remembered learning about standard error in my DevOps lessons. 
I ran find / -user bandit7 -group bandit6 -size 33c 2> /dev/null. The find / portion searches from the filesystem root; -user bandit7, -group bandit6, and -size 33c specify the three conditions. The 2> /dev/null portion redirects error messages away from the terminal so the matching path is easier to see.

The result was:

/var/lib/dpkg/info/bandit7.password

I ran the cat command cat /var/lib/dpkg/info/bandit7.password and I was able to see the password. 

### Challenges or Discoveries
The biggest challenge was seeing so many Permission denied messages. At first, I felt stuck because Linux would not let me enter those directories, and manually searching every directory on the server did not seem practical.

I learned that a permission error for one directory does not mean the entire find search failed. find can continue through other accessible directories.

The turning point was remembering standard error (stderr) from my lessons. Using 2> /dev/null discarded the error messages from the display, allowing me to see the matching file path more clearly. It did not change any file permissions.

I also discovered the difference between search starting points:
- find ./ searches the current directory and its subdirectories.
- find / searches from the root of the filesystem.
- ./bandit* limits the starting locations to matching entries in the current directory. The * wildcard is not needed to make find search recursively.

### Password
Bmnnvf82KzQlfxgAI2d1zYbr1u9pr3E3

### What I Learned
This challenge helped me combine Linux concepts to solve a practical problem. I learned to use find with multiple conditions for ownership, group, and size; understand permission errors without assuming the search had stopped; and redirect standard error with 2> /dev/null to make results easier to read.

I also learned the difference between relative and absolute paths. With an absolute path, I can use cat to read a file without navigating into every directory first.