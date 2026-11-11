# Bandit Level 20 → 21

### Challenge

The goal was to retrieve the password for Bandit Level 21 using a SetUID executable named `suconnect`.

The program:
- Connects to a specified port on `localhost` using TCP.
- Waits to receive the current Bandit 20 password.
- Verifies the password.
- Sends back the Bandit 21 password if the password is correct.

### Commands Used

**1. Examine file permissions**

```bash
ls -l
```

Output:
```text
-rwsr-x--- 1 bandit21 bandit20 15604 Oct 25 13:37 suconnect
```

**2. Execute the program without arguments**

```bash
./suconnect
```

This displayed instructions explaining that the program requires a port number.

**3. Review the Netcat manual**

```bash
man nc
```

Learned that `-l` tells Netcat to listen for incoming connections.

**4. First attempt — background process**

```bash
nc -l 12345 &
./suconnect 12345
fg %1
jobs
kill %1
```

**5. Successful attempt — two terminal sessions**

Terminal 1:

```bash
nc -l 12345
```

Terminal 2:

```bash
./suconnect 12345
```

Returned to Terminal 1, entered the Bandit 20 password, and received the Bandit 21 password.

### Explanation

**1. Understanding SetUID**

The `suconnect` executable was owned by `bandit21`, with group ownership assigned to `bandit20`.

The `s` in `-rwsr-x---` indicated that SetUID was enabled, allowing the program to execute with Bandit 21's effective user privileges.

**2. Understanding Netcat**

Netcat (`nc`) is a networking utility that can send and receive data over TCP connections.

The command:

```bash
nc -l 12345
```

Starts a listener on port `12345`.

The `-l` option means listen, and `12345` is the port number.

**3. Understanding localhost**

`localhost` refers to the same machine.

Both Netcat and `suconnect` were running on the Bandit server, so they could communicate through the same TCP port.

**4. Background process attempt**

Initially ran:

```bash
nc -l 12345 &
```

The `&` symbol started Netcat as a background process.

Used `fg %1` to bring the job into the foreground, but the password exchange did not complete successfully.

Used `jobs` to inspect the process and `kill %1` to terminate it before restarting.

**5. Successful connection**

Opened two separate terminal sessions, both connected to Bandit 20.

- Terminal 1 ran Netcat and waited for an incoming connection.
- Terminal 2 ran `./suconnect 12345`, initiating a connection to Netcat.
- Entered the Bandit 20 password in Terminal 1.
- `suconnect` verified the password and returned the Bandit 21 password.

### Challenges or Discoveries

- Initially unsure whether `localhost` needed to be included in the Netcat command.
- Learned that `nc -l` listens for incoming connections.
- Practiced using `&` to run a process in the background.
- Reviewed `fg`, `jobs`, and `kill` while troubleshooting.
- Discovered that background processes can be difficult to interact with when they require keyboard input.
- Successfully used two terminal sessions to allow both programs to run simultaneously.
- Learned that two programs can communicate over a TCP connection without requiring two separate machines.

### Password
bW9kBv5WC3P4yoDyf12LSdGuNz5ka6hY

### What I Learned

- **Netcat (`nc`)** is a networking utility used to send and receive data.
- **TCP** is a connection-oriented network protocol.
- **`localhost`** refers to the machine where the program is running.
- **Ports** identify network communication endpoints.
- **`nc -l`** listens for incoming connections.
- **`&`** runs a command in the background.
- **`jobs`** displays jobs associated with the current shell.
- **`fg %1`** brings job 1 into the foreground.
- **`kill %1`** sends a termination signal to job 1.
- **SetUID** allows an executable to run with its owner's effective privileges.
- Two programs can communicate through TCP while running in separate terminal sessions.
- Two terminal windows are not strictly necessary, but they can make troubleshooting and interacting with multiple processes easier.

**Key takeaway:** This challenge demonstrated how networking, Linux permissions, and process management work together in a practical scenario.