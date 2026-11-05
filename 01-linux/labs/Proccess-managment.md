# Lab: Linux Process Management – Background Processes

## Objective

Start a long-running process in the background, find its Process ID (PID), terminate it, and document the commands used.

## Commands Used

```bash
# Start ping in the foreground
ping -i 2 127.0.0.1

# Press Ctrl+C to stop the process

# Start ping in the background
ping -i 2 127.0.0.1 &

# Find the PID of a running ping process (discussed, not executed)
ps aux | grep ping

# Terminate the process using its PID
kill 29950

# Check the status of background jobs
jobs
```

## Output

When I ran `ping -i 2 127.0.0.1 &`, Linux started the process in the background and returned:

```text
[1] 29950
```

- `[1]` represents the job number.
- `29950` is the Process ID (PID).

The ping command continued sending requests to `127.0.0.1` every two seconds.

I then ran:

```bash
kill 29950
```

The terminal confirmed that the process was terminated.

Finally, I ran `jobs` and received no output, confirming there were no remaining jobs to display.

## Challenges

Initially, I ran `ping -i 2 127.0.0.1` without the `&` symbol. The process continued running in the foreground, preventing me from entering additional commands.

I used `Ctrl+C` to stop the process and restarted it with `&` to run it in the background.

Although the process was running in the background, it continued displaying output in my terminal. This made it difficult to type commands, and my first attempt to terminate the process resulted in an invalid PID error.

I resolved this by copying and pasting the `kill` command with the correct PID.

## What I Learned

- `ping` can be used to test network connectivity.
- `-i 2` tells ping to send a request every two seconds.
- `127.0.0.1` is the loopback address, which refers to my own computer.
- Adding `&` allows a process to run in the background while I continue using the terminal.
- `ps aux | grep ping` can be used to search for running ping processes and identify their PIDs.
- `kill <PID>` sends a termination signal to a specific process.
- `jobs` displays background and suspended jobs managed by the current shell.

**Key Takeaway:** I learned the difference between foreground and background processes and how to manage a process using its PID. I also learned that running a process in the background doesn't necessarily prevent its output from appearing in the terminal.