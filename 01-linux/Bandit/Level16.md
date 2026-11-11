# Bandit Level 16 to 17

### Challenge
Find the correct SSL/TLS service listening on a port between 31000 and 32000 on localhost. Submit the current level's password to receive the credentials needed to access Bandit 17, then log in as Bandit 17.

### Command Used
On the Bandit 16 server — scan the ports:
nmap -p 31000-32000 localhost
nmap -sV -p 31046,31518,31691,31790,31960 localhost
Connect to the SSL/TLS service that returns the key:
openssl s_client -connect localhost:31790 -quiet
After entering the Bandit 16 password, the service returned an OpenSSH private key. 

Create a temporary directory and save the key on the Bandit 16 server:
mktemp -d /tmp/bandit17.XXXXXXXX
nano /tmp/bandit17.pznFe8NU/bandit17_key
Paste the key into Nano. Press Ctrl+O, Enter, then Ctrl+X.

Restrict the key's permissions:
chmod 600 /tmp/bandit17.pznFe8NU/bandit17_key
ls -l /tmp/bandit17.pznFe8NU/bandit17_key
Initial SSH attempt from Bandit 16 (blocked by the server):
ssh -i /tmp/bandit17.pznFe8NU/bandit17_key bandit17@localhost -p 2220
On the local Mac terminal — copy the key from the Bandit server:
scp -P 2220 bandit16@bandit.labs.overthewire.org:/tmp/bandit17.pznFe8NU/bandit17_key ~/bandit17_key
chmod 600 ~/bandit17_key
ls -l ~/bandit17_key
Connect from the Mac to Bandit 17:
ssh -i ~/bandit17_key bandit17@bandit.labs.overthewire.org -p 2220
whoami
cat /etc/bandit_pass/bandit17

### Explanation
- nmap -p 31000-32000 localhost scans the specified range for open ports.
- nmap -sV probes selected ports to help identify the services running on them.
- openssl s_client -connect localhost:31790 -quiet establishes an SSL/TLS connection to port 31790 with reduced output.
- mktemp -d creates a uniquely named temporary directory.
- nano opens a terminal text editor where the private key can be saved.
- chmod 600 grants read and write permissions to the file owner only (-rw-------).
- ls -l displays the file's permissions.
- scp -P 2220 securely copies the key from the Bandit server to the Mac; SCP uses uppercase -P for the port.
- ssh -i specifies the private key for login, and SSH uses lowercase -p for the port.
- whoami confirms which account is logged in.
- cat /etc/bandit_pass/bandit17 displays the Bandit 17 password after successful login.

### Challenges or Discoveries
- Several ports were open, but not every SSL/TLS service returned the required credentials.
- Port 31790 accepted the Bandit 16 password and returned the SSH private key.
- I learned to copy both the BEGIN OPENSSH PRIVATE KEY and END OPENSSH PRIVATE KEY lines along with everything between them.
- In Nano, Ctrl+O opens the filename confirmation prompt; pressing Enter actually saves the file.
- SSH initially refused a connection made from the Bandit server to localhost because those connections are blocked to conserve resources.
- The solution was to transfer the private key to my Mac with SCP, secure it with chmod 600, and connect from the Mac instead.
- Running whoami confirmed that I had successfully logged in as bandit17.

### Password
pWXMAZoxGC8JmDMfmT5MGEsobMM3vnj2

### What I Learned
- How to scan ports and identify services with Nmap.
- How to communicate with an SSL/TLS service using OpenSSL.
- Why an SSH private key is sensitive and must be kept private.
- How to create a temporary directory and edit a file with Nano.
- Why SSH key files should have restrictive permissions (600).
- How to transfer files securely with SCP.
- The difference between scp -P and ssh -p.
- How to troubleshoot a blocked localhost SSH connection by using my local computer.
- How to verify my login with whoami.