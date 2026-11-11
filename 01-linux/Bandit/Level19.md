
# Bandit Level 19 → 20

### Challenge
Gain access to Bandit Level 20 using a SetUID binary located in the home directory.

The password for Bandit Level 20 is stored in `/etc/bandit_pass/bandit20`.

### Commands Used

```bash
ls -l
./bandit20-do
./bandit20-do whoami
./bandit20-do cat /etc/bandit_pass/bandit20
```

### Explanation

**1. `ls -l`**
- Displayed the permissions, owner, and group of the file `bandit20-do`.
- The output showed:

```text
-rwsr-x--- 1 bandit20 bandit19 14880 Oct 25 13:37 bandit20-do
```

**2. Understanding SetUID**
- The `s` in `rws` indicates the SetUID permission.
- The executable is owned by `bandit20`.
- The group is `bandit19`.
- SetUID allows the executable to run with the effective privileges of its owner.

**3. `./bandit20-do`**
- Executed the program without arguments.
- Displayed instructions explaining how to run a command as another user.

**4. `./bandit20-do whoami`**
- Executed `whoami` using the SetUID program.
- Returned `bandit20`, confirming the effective user identity.

**5. `./bandit20-do cat /etc/bandit_pass/bandit20`**
- Executed `cat` with Bandit 20's privileges.
- Successfully displayed the password for Bandit Level 20.

### Challenges or Discoveries

- Initially confused the `s` permission with the normal execute `x` permission.
- Learned that `./` refers to the current directory when executing a program.
- Initially typed the executable name incorrectly and received a "No such file or directory" error.
- Discovered that SetUID allows an executable to run with its owner's effective privileges.
- Successfully retrieved the password for Bandit Level 20.

### Password
4pIjcunZ0fK2vmp3IwfG8Vf7VhxD6pOA

### What I Learned

- **SetUID** is a special Linux permission represented by `s` in the owner's execute position.
- A SetUID executable runs with the effective user ID of its owner.
- `rws` indicates read, write, and execute permissions with SetUID enabled.
- `./` is used to execute a program from the current directory.
- `whoami` can help verify the effective user identity.
- SetUID executables must be secured carefully because they can grant access to another user's privileges.
    