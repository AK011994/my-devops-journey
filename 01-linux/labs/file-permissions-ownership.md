# Lab: Task 3 – Permissions and Ownership

## Objective

Create a file that only I can read and write, while the group and others can only read. Practice using `chmod` with octal notation to modify file permissions and verify the changes.

## Commands Used

```bash
touch firstfile.txt
ls -lah firstfile.txt
chmod 644 firstfile.txt
ls -l
ls -l firstfile.txt
```

## Output

**1. Created an empty file using `touch`:**

```bash
touch firstfile.txt
```

**2. Checked the initial file permissions:**

```bash
ls -lah firstfile.txt
```

Output:

```text
-rw-rw-r-- 1 addia addia 0 Oct 27 12:10 firstfile.txt
```

The owner and group initially had read and write permissions, while others had read-only permission.

**3. Changed the file permissions using octal notation:**

```bash
chmod 644 firstfile.txt
```

I calculated the permissions as follows:

- Owner: Read (4) + Write (2) = 6
- Group: Read (4) = 4
- Others: Read (4) = 4

**4. Verified the permissions:**

```bash
ls -l
ls -l firstfile.txt
```

Final output:

```text
-rw-r--r-- 1 addia addia 0 Oct 27 12:10 firstfile.txt
```

The output confirmed that the permissions were successfully changed to `644`.

## Challenges

The file initially had read and write permissions for both the owner and group. However, the challenge required the group to have read-only permission.

I used the octal system to calculate the correct permissions:

- Owner: `rw-` = 6
- Group: `r--` = 4
- Others: `r--` = 4

After applying `chmod 644`, I verified that the permissions matched the challenge requirements.

## What I Learned

I learned how to create a file, check its existing permissions, and modify those permissions using `chmod` with octal notation.

I also practiced converting symbolic permissions into octal values using read = 4, write = 2, and execute = 1.

I learned that `chmod 644` allows the owner to read and write a file, while the group and others can only read it.

Finally, I learned how to verify permission changes using `ls -l`.