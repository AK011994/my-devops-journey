# Bandit Level 17 → 18

### Challenge
Find the password for Bandit Level 18.

Two files are provided:
- passwords.old
- passwords.new
The password is the only line that has changed between the two files. The new line contains the password for Level 18.

### Commands Used
cat passwords.new
man diff
diff passwords.old passwords.new

### Explanation
1. cat passwords.new
- Displayed the contents of the new password file.
- The file contained many passwords, making it difficult to identify the correct one manually.
2. man diff
- Opened the manual page for the diff command.
- Learned that diff compares files line by line.
3. diff passwords.old passwords.new
- Compared the old and new password files.
- Identified the single line that had changed.
- The line marked with < represented the old password.
- The line marked with > represented the new password.
- The new password was used to access Bandit Level 18.

### Challenges or Discoveries
- Initially examined passwords.new using cat, but there were too many passwords.
- Discovered that diff is useful for comparing two files.
- Learned how to identify changed lines in the output.
- Successfully found the password for Level 18.
- Encountered a Bye bye! message when attempting to log into Bandit 18.

### Password
OQxXZjELndr90zuhOTDYBEomI0SZITXI (password retreived for level 18 from level 17)

### What I Learned
- diff compares two files line by line.
- The < symbol indicates content from the first file.
- The > symbol indicates content from the second file.
- Comparing files is more efficient than manually searching through large amounts of text.
- The diff command is useful for troubleshooting configuration changes and identifying differences between files.