# Bandit Level 13 → Level 14

### Challenge
The goal of this level was to log into Bandit 14 using an SSH private key instead of a password.

The password for Bandit 14 was stored in /etc/bandit_pass/bandit14, but I did not have permission to read it as Bandit 13.

I needed to figure out how to use the sshkey.private file provided in Bandit 13 to authenticate and log into Bandit 14.

## Commands Used

```bash
ssh bandit13@bandit.labs.overthewire.org -p 2220
ls
pwd
cd ..
cd /etc
ls
find bandit-pass
cd bandit_pass
ls
cat bandit14
ls -l bandit14
cat bandit13
cd ..
cd /home
cd bandit13
ls
ls -l
cat sshkey.private
file sshkey.private
man ssh
ssh -i sshkey.private
exit
ssh bandit13@bandit.labs.overthewire.org -p 2220
man scp
scp -P 2220 bandit13@bandit.labs.overthewire.org:/home/bandit13/sshkey.private ./
exit
scp -P 2220 bandit13@bandit.labs.overthewire.org:/home/bandit13/sshkey.private ./
ls -l sshkey.private
chmod 600 sshkey.private
ls -l sshkey.private
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```

### Explanation
When I first logged into Bandit 13, I ran ls to see what files were available. I found two files: hint and sshkey.private.

I then ran pwd to confirm that I was in the Bandit 13 directory.

Next, I used cd .. to navigate to the /home directory and ran ls to explore the available directories. I used cd .. again to move to the parent directory, where I found the /etc directory.

I navigated into /etc using cd /etc and ran ls. There were many files and directories, so I attempted to use find to locate the Bandit password directory. However, my attempt did not work because I had entered the directory name incorrectly.

I eventually navigated into /etc/bandit_pass and ran ls, which displayed the password files for the different Bandit levels.

I tried running cat bandit14 to read the password for Bandit 14, but I received a permission-denied error.

To investigate, I ran ls -l bandit14 to check the file permissions. I discovered that the file belonged to the Bandit 14 user and group and that I did not have permission to read it.

I also noticed the Bandit 13 password file, so I ran cat bandit13. It displayed the password I had already used to log into Bandit 13, so that did not help me progress.

After that, I navigated back to the Bandit 13 home directory using cd .. and cd bandit13.

I ran ls again and saw the same two files: hint and sshkey.private.

I used ls -l to examine their permissions.

Next, I ran cat sshkey.private to inspect the contents. The output contained a lot of text that I did not understand.

I decided to run file sshkey.private to identify the file type and make sure it was not a compressed file or another format. The output identified it as an OpenSSH private key.

At this point, I was stuck because I did not understand how to use the private key to access Bandit 14.

I decided to research SSH by running man ssh.

While reading the manual, I discovered the -i option, which allows SSH to use a specific private key for authentication.

I exited the manual and ran pwd to confirm my current directory.

I then attempted:
ssh -i sshkey.private

However, the command did not work because I had not specified the remote username and hostname.

I initially thought the problem was that I was trying to SSH into another level while already connected to Bandit 13.

I exited the SSH session and returned to my local UTM machine.

Once I was back on my local machine, I realized that the private key was stored on the Bandit server, not on my computer.

Since I wanted to use the private key from my UTM machine, I needed a way to copy it from the remote server to my local machine.

I logged back into Bandit 13 and started researching the available commands.

I discovered scp, which is used to securely copy files between computers.

I ran man scp to understand how the command worked.

I initially attempted to run the scp command while logged into Bandit 13, but I encountered errors.

I eventually realized that I needed to run the command from my local UTM terminal because I wanted to copy the file onto my machine.

I exited the Bandit server and ran:
scp -P 2220 bandit13@bandit.labs.overthewire.org:/home/bandit13/sshkey.private ./

In this command:
- scp securely copies files between computers.
- -P 2220 specifies the port used to connect to the Bandit server.
- bandit13@bandit.labs.overthewire.org identifies the remote user and server.
- :/home/bandit13/sshkey.private specifies the location of the private key on the remote server.
- ./ tells the system to copy the file into the current directory on my local machine.
This successfully copied the private key from the Bandit server to my UTM machine.

After copying the file, I ran:
ls -l sshkey.private

I wanted to check the permissions of the copied file.

Since this was a private key, I needed to make sure that no other users could access it.

I ran:
chmod 600 sshkey.private

This changed the permissions so that only the owner could read and write the file. The group and other users had no permissions.

I verified the permissions by running:
ls -l sshkey.private

Finally, I used the private key to connect to Bandit 14:
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220

The -i option told SSH to use the private key for authentication, and -p 2220 specified the SSH port.

I successfully logged into Bandit 14 using the private key instead of a password.

### Challenges or Discoveries
The biggest challenge I faced was figuring out how to copy the private key from the Bandit server onto my local UTM machine.

Every time I tried using scp while logged into Bandit 13, I encountered errors.

I eventually realized that the problem was related to where I was running the command.

When I was logged into Bandit 13, the commands were being executed on the remote server. Since I wanted to copy the file onto my local UTM machine, I needed to run scp from my local terminal.

Another challenge was figuring out which commands and options to use.

I had to research SSH and read the manual pages to discover the -i option, which allows SSH to authenticate using a private key.

I also had to research scp to understand how to securely copy files from a remote server to my local machine.

Understanding how private keys work was another challenge, especially why their permissions need to be restricted.

One of my biggest discoveries was understanding the difference between running commands on a remote server and running them locally.

I learned that ./ refers to the current directory of the machine where the command is executed.

This helped me understand why running scp from my local UTM terminal worked for copying the private key onto my computer.

### Password
No password for this level. 

### What I Learned
In this level, I learned that SSH does not always require a password to connect to a remote server. You can also authenticate using a private key with the -i option.

I learned that private keys are normally stored securely on your local machine, but in this Bandit challenge, the private key was stored on the remote server.

I also learned why protecting private keys is important. Using chmod 600 ensures that only the owner has read and write permissions, while everyone else has no permissions.

Another important thing I learned was how to use scp to securely copy files between a remote server and my local machine.

One of my biggest discoveries was understanding the difference between running commands on a remote server and running them locally.

Since I wanted to copy the private key onto my UTM machine using ./ as the destination, I needed to run the scp command from my local terminal.

Finally, I learned how to use the copied private key with SSH to successfully log into Bandit 14.

Although I understand the purpose of the SSH and SCP commands and how I used them to complete this level, I still need more practice remembering their command structures and options.