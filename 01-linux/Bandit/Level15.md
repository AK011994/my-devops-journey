# Bandit Level 15 → 16

### Challenge
Retrieve the password for Bandit Level 16 by submitting the current level's password to localhost on port 30001 using an SSL/TLS-encrypted connection.

### Commands Used
View OpenSSL client options:
openssl s_client -help
Find the connection option in the help output:
openssl s_client -help 2>&1 | grep -- '-connect'
Connect securely to the challenge service:
openssl s_client -connect localhost:30001
After the connection is established, paste the Bandit 15 password and press Enter.

### Explanation

**1. `openssl s_client -help`**
- `openssl` is a command-line tool used for cryptography and secure network communication.
- `s_client` acts as a client when establishing SSL/TLS connections.
- `-help` displays available options and instructions.
- This command helped me explore how to establish a secure connection.

**2. `openssl s_client -help 2>&1 | grep -- '-connect'`**
- `2` represents standard error (`stderr`).
- `1` represents standard output (`stdout`).
- `2>&1` redirects standard error to the same destination as standard output.
- `|` (pipe) sends the output to another command.
- `grep` searches for matching text.
- `--` tells `grep` to stop interpreting subsequent arguments as options.
- `'-connect'` is the text being searched for.

This command helped me locate the `-connect` option without scrolling through the entire help output.

**3. `openssl s_client -connect localhost:30001`**
- `openssl s_client` starts an SSL/TLS client connection.
- `-connect` specifies the destination server and port.
- `localhost` refers to the Bandit server because I was already connected through SSH.
- `30001` is the TCP port where the challenge service was listening.
- SSL/TLS encrypts the communication between the client and the service.

After establishing the connection, I entered the Bandit 15 password. The service verified it and returned the Bandit 16 password.

**4. Understanding `read R BLOCK`**
- This message appeared while OpenSSL was waiting for data.
- It did not indicate an error.
- After submitting the correct password, the service responded with `Correct!` and returned the next password.

### Challenges or Discoveries
- OpenSSL displayed extensive certificate and connection information, which was unfamiliar at first.
- The -connect option specifies the host and port; val in the help text is a placeholder.
- read R BLOCK indicated that the connection was waiting for input.
- The service replied Correct! and returned the next password before closing the connection.
- 2>&1 combines standard error with standard output so grep can search the help text. grep -- '-connect' treats the search term as text rather than an option.

### Password
kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V

### What I Learned
- nc localhost 30000 makes a regular TCP connection; openssl s_client -connect localhost:30001 makes an SSL/TLS-encrypted connection.
- localhost refers to the Bandit machine when running commands inside the Bandit SSH session.
- SSL/TLS encrypts data sent over a network connection.
- I can use grep to locate a specific option in lengthy help output.