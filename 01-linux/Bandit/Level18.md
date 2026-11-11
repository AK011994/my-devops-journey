# Bandit Level 18 → 19

### Challenge
Find the password for Bandit Level 19.

The password is stored in a file named readme in the home directory.

However, attempting to log into Bandit Level 18 through a normal SSH session immediately displays:
Bye bye!
Connection closed.

The challenge is to retrieve the password without being disconnected.

### Commands Used
1. Attempted a normal SSH connection
ssh bandit18@bandit.labs.overthewire.org -p 2220

2. Reviewed the SSH manual
man ssh

3. Executed ls remotely through SSH
ssh bandit18@bandit.labs.overthewire.org -p 2220 ls

4. Read the password file remotely
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme

### Explanation
1. Normal SSH connection
- Attempted to connect to Bandit Level 18.
- The connection immediately closed with the message Bye bye!.
- This happened because the shell startup configuration was modified to log out interactive sessions.
2. man ssh
- Opened the SSH manual to understand available options.
- Explored options such as -W, -J, and -l.
- Learned that these options serve different purposes.
- Discovered that SSH can execute a command directly on a remote server.
3. SSH with ls
ssh bandit18@bandit.labs.overthewire.org -p 2220 ls

- Connected to the remote server.
- Executed ls without opening a normal interactive shell.
- Displayed the file readme.
- Returned to the local terminal after executing the command.
4. SSH with cat readme
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme

- Connected to Bandit Level 18.
- Executed cat readme directly on the remote server.
- Displayed the contents of the readme file.
- Successfully retrieved the password for Bandit Level 19.

### Challenges or Discoveries
- Encountered an immediate disconnection when attempting a normal SSH login.
- Initially explored the SSH manual to find a solution.
- Learned that -W is used for forwarding connections.
- Learned that -J is used for connecting through a jump host.
- Discovered that SSH can execute remote commands without opening an interactive session.
- Successfully bypassed the interactive login restriction by executing commands directly.

### Password
KpsOfPkcP7i1FlIExk2QEjyt6dw8dxZI

### What I Learned
- SSH is not limited to opening interactive terminal sessions.
- SSH can execute individual commands on a remote server.
- A remote command can be placed after the SSH connection arguments.
- The -p option specifies the SSH port.
- Remote commands execute on the remote machine, not the local machine.
- Understanding SSH command execution is useful for DevOps, automation, troubleshooting, and remote server administration.
- A failed interactive login does not necessarily mean remote command execution is unavailable.