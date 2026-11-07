# Project: Set Up a New User with Specific Permissions

## Objective

The goal of this project was to practice Linux user management, group management, file ownership, and permissions.

I created a new Linux user named `john`, added him to the `developers` group, and configured a project directory with specific permissions.

The purpose was to understand how Linux controls access to files and directories and how to verify that the permissions are working correctly.

## Project Requirements

- Create a new Linux user named `john`.
- Create a group named `developers`.
- Add `john` to the `developers` group.
- Create a directory at `/home/john/projects`.
- Change the directory owner to `john`.
- Change the directory group to `developers`.
- Set directory permissions to `750`:
  - Owner: Read, write, and execute (`rwx`).
  - Group: Read and execute (`r-x`).
  - Others: No permissions (`---`).
- Verify user and group membership.
- Test directory access and permissions.

## Commands Used

### 1. Create a New User

```bash
sudo adduser john
```

- `sudo` — Runs the command with administrative privileges.
- `adduser` — Creates a new Linux user.
- `john` — The username being created.

### 2. Create a Group

```bash
sudo addgroup developers
```

- `addgroup` — Creates a new group named `developers`.

To verify the group was created:

```bash
cat /etc/group | grep developers
```

### 3. Add John to the Developers Group

```bash
sudo usermod -aG developers john
```

- `usermod` — Modifies an existing user account.
- `-a` — Appends the user to a group without removing existing supplementary group memberships.
- `-G` — Specifies the supplementary group.
- `developers` — The group being assigned.
- `john` — The user being modified.

To verify John's group membership:

```bash
groups john
```

### 4. Create the Project Directory

```bash
sudo mkdir /home/john/projects
```

Created a directory named `projects` inside John's home directory.

To inspect the directory:

```bash
sudo ls -ld /home/john/projects
```

### 5. Change Directory Ownership

```bash
sudo chown john /home/john/projects
sudo chgrp developers /home/john/projects
```

- `chown` — Changes the directory owner to `john`.
- `chgrp` — Changes the directory group to `developers`.

### 6. Configure Directory Permissions

```bash
sudo chmod 750 /home/john/projects
```

The permissions `750` mean:

- `7` (`rwx`) — Owner can read, write, and execute.
- `5` (`r-x`) — Group can read and execute.
- `0` (`---`) — Others have no permissions.

### 7. Test John's Access

```bash
su - john
ls
cd projects
touch test.txt
ls -ld test.txt
exit
```

I switched to John's account, entered the project directory, and created a test file to verify that he had the required access.

### 8. Test Unauthorized Access

```bash
whoami
groups addia
cd /home/john/projects
```

I returned to my regular user account and attempted to access John's project directory to verify that unauthorized access was denied.

## Output and Verification

### 1. Verify Group Creation

```text
developers:x:1004:
```

This confirmed that the `developers` group was successfully created.

### 2. Verify John's Group Membership

```text
john : john users developers
```

This confirmed that `john` was successfully added to the `developers` group.

### 3. Verify Directory Ownership

Before changing ownership:

```text
drwxr-xr-x 2 root root 4096 Oct 31 23:15 /home/john/projects
```

After changing ownership and permissions:

```text
drwxr-x--- 2 john developers 4096 Oct 31 23:15 /home/john/projects
```

This confirmed that:

- Owner: `john`
- Group: `developers`
- Permissions: `750` (`rwxr-x---`)

### 4. Verify John's Write Access

While logged in as `john`, I created a file named `test.txt`.

```text
-rw-rw-r-- 1 john john 0 Oct 31 23:30 test.txt
```

This confirmed that John could create files inside the `projects` directory.

### 5. Verify Unauthorized Access Is Denied

I switched back to my regular user account, `addia`, and attempted to enter the directory.

```bash
cd /home/john/projects
```

Output:

```text
cd: permission denied: /home/john/projects
```

This confirmed that my regular user account could not access the directory.

**Note:** I verified the owner's access and unauthorized access restrictions. I did not separately test access using another member of the `developers` group.

## Challenges

### 1. Remembering Linux Command Syntax

I had some difficulty remembering the correct syntax for adding a user to a group.

I used `man usermod` to review the options and learned that:

- `-a` means append.
- `-G` specifies supplementary groups.
- `-aG` adds a user to a group without removing existing supplementary group memberships.

### 2. Understanding Command Argument Order

I initially found it confusing that commands like `chgrp` require the group name before the directory path.

I learned that the syntax is:

```bash
sudo chgrp GROUP DIRECTORY
```

A helpful way for me to remember the order is **"Who before where?"**

### 3. Troubleshooting Permission Denied Errors

When I attempted to inspect the directory using:

```bash
ls -ld /home/john/projects
```

I received a `Permission denied` error.

I learned that accessing a directory path requires the appropriate permissions on its parent directories.

I used `sudo` to inspect the directory with administrative privileges.

### 4. Understanding Directory Permissions

I initially had some difficulty understanding the difference between read, write, and execute permissions for directories.

I learned that:

- `r` allows listing directory contents.
- `w`, combined with `x`, allows creating, deleting, and renaming directory entries.
- `x` allows entering or traversing a directory.

This helped me better understand how Linux controls access to directories.

## What I Learned

Through this project, I gained hands-on experience with Linux user and group management.

I practiced creating users, assigning group memberships, changing directory ownership, and configuring permissions using `chmod`.

One of my biggest takeaways was learning that successfully configuring permissions is only part of the process. It's also important to verify that authorized users have the correct access and unauthorized users are restricted.

I also learned how to troubleshoot permission errors and use Linux manual pages when I couldn't remember command syntax.

Although I completed the project successfully, I want to continue practicing these commands so I can perform similar tasks more independently.

## Project Status

**Completed:** User creation, group assignment, directory ownership, permission configuration, and basic access verification.

**Future Improvement:** Test access with a second member of the `developers` group to confirm group-level permissions.