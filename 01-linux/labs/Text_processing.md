# Lab: Task 5 – Text Processing Challenge

## Objective

Parse the `/etc/passwd` file to identify and list all users who have `/bin/bash` as their login shell.

## Commands Used

**Command 1: Display usernames and their login shells**

```bash
cat /etc/passwd | awk -F: '{print $1, $7}'
```

**Command 2: Filter users with `/bin/bash`**

```bash
cat /etc/passwd | awk -F: '{print $1, $7}' | grep "/bin/bash"
```

## Output

The first command displayed all usernames and their assigned login shells.

The second command returned:

```text
root /bin/bash
```

This confirmed that `root` was the only user in my system's `/etc/passwd` file configured with `/bin/bash` as their login shell.

## Explanation

- `cat /etc/passwd` — Displays the contents of the `/etc/passwd` file.
- `|` — Passes the output of one command as input to the next command.
- `awk -F:` — Uses the colon (`:`) as the field separator.
- `$1` — Represents the username.
- `$7` — Represents the user's login shell.
- `print $1, $7` — Displays the username and login shell.
- `grep "/bin/bash"` — Filters the output to show lines containing `/bin/bash`.

## Challenges

Initially, I used `awk` to print the first and seventh fields, which displayed all users and their login shells.

However, the assignment specifically asked for users with `/bin/bash`.

I realized I could pipe the output into `grep` to filter the results and display only the matching users.

## What I Learned

- How to use `awk` to extract specific fields from a file.
- How the `-F` option defines a field separator.
- How to identify the username and login shell in `/etc/passwd`.
- How to combine `cat`, `awk`, and `grep` using pipes.
- How to filter command output to retrieve only the information needed.

I learned that I can combine multiple Linux commands to solve a problem rather than relying on a single command.