# Bandit Level 14 → Level 15

### Challenge
The goal was to retrieve the password for Bandit Level 15 by submitting the current level's password to a service listening on port 30000 on localhost.

### Commands Used
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
ls
ls -a
cd ..
cd etc
cd bandit_pass
ls
cat bandit14
nc localhost 30000
- ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220 — Logged in as Bandit14 using the private SSH key from the previous level and SSH port 2220.
- ls — Listed visible files and directories.
- ls -a — Included hidden files and directories while investigating the home directory.
- cd .. — Moved up one directory at a time to reach the filesystem root.
- cd etc — Entered the /etc directory from /.
- cd bandit_pass — Entered the directory containing Bandit level password files.
- cat bandit14 — Displayed the password for the current level.
- nc localhost 30000 — Connected directly to the local service listening on destination port 30000.

I also consulted the nc manual to understand its command syntax. I considered nmap and SSH options, but did not need them to complete the challenge.
Explanation

After logging in as Bandit14, I explored the home directory using ls and ls -a. I remembered from the previous level that the current password was stored under /etc/bandit_pass, so I navigated there and read the bandit14 file.

The challenge required sending that password to a network service rather than using it to log in with SSH. I researched nc (Netcat), which can open a direct connection to a host and port. Because the challenge already provided localhost and port 30000, I did not need to scan for an open port.

I ran nc localhost 30000
At first, nothing appeared to happen. The connection was open, but the service was waiting for input. I entered the current level's password and submitted it. The service checked the input and returned the password for the next level.

### Challenges or Discoveries
-  I knew to look in /etc/bandit_pass because I remembered the location from the previous level. Later, I noticed that the Bandit login message gives a useful clue: passwords for a game are stored in /etc/somegame_pass/. For Bandit, this points to /etc/bandit_pass/.
- I initially read [-x proxy_address[:port]] [destination] [port] as if all the parts belonged together. I learned that -x is an optional proxy option, while destination and port are separate positional arguments.
- I learned that -p sets the source port, whereas 30000 in nc localhost 30000 is the destination port. The -P option relates to proxy authentication and was not needed.
-  Running nc did not immediately print a result because the connected service was waiting for me to send the current password.
-  I considered how I could find the password without remembering its location. find / -name 'bandit*' would search from the filesystem root for matching names, but it could produce many unrelated results. A more targeted search or a clue from the login message would be more useful. find locates paths, file identifies file types, and cat displays file contents when permissions allow.

### Password
pbLYuZtTg4MgaqfJx8jbA9gKKGqM68A7

### What I Learned
I learned how to use Netcat to communicate directly with a service on a specified host and port. I also improved my understanding of Linux manual syntax, particularly the difference between optional command options and positional arguments. This level reinforced the importance of using available clues to locate files efficiently instead of searching blindly, and showed me that a network service may wait for input before responding.