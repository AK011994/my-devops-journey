# Log Rotation Project

## Overview

This project is a simple Bash script that performs basic log rotation.

The script renames an existing log file (`app.log`) to `app.log.1` and creates a new, empty `app.log` file.

This project was created as part of my DevOps learning journey to practice Linux commands, file permissions, and Bash scripting.

## What the Script Does

1. Renames `app.log` to `app.log.1` using the `mv` command.
2. Creates a new, empty `app.log` file using the `touch` command.

This allows the original log contents to be preserved while creating a fresh log file.

## Bash Script

File: `rotate_logs.sh`

```bash
#!/bin/bash

mv app.log app.log.1
touch app.log
```

## How to Run the Script

### Step 1: Create a Test Log File

Create a file called `app.log`.

```bash
touch app.log
```

Add sample content:

```bash
echo "Hello World" >> app.log
```

Verify the contents:

```bash
cat app.log
```

Expected output:

```text
Hello World
```

### Step 2: Make the Script Executable

```bash
chmod u+x rotate_logs.sh
```

Verify the permissions:

```bash
ls -l rotate_logs.sh
```

### Step 3: Execute the Script

```bash
./rotate_logs.sh
```

The script does not display a message when it finishes.

### Step 4: Verify the Results

List the files:

```bash
ls -l
```

You should see:

- `rotate_logs.sh`
- `app.log`
- `app.log.1`

Check the rotated log:

```bash
cat app.log.1
```

Expected output:

```text
Hello World
```

Check the new log file:

```bash
cat app.log
```

Expected result: No output because the new file is empty.

## Test Results

The script was successfully tested.

- The original `app.log` was renamed to `app.log.1`.
- The original content, "Hello World", was preserved.
- A new, empty `app.log` file was created.
- The script executed without errors during the test.

## What I Learned

Through this project, I practiced:

- Creating files using `touch`.
- Adding text to files using `echo`.
- Renaming files using `mv`.
- Viewing file contents using `cat`.
- Understanding and modifying Linux file permissions using `chmod`.
- Making Bash scripts executable.
- Running scripts using `./`.
- Verifying script results using Linux commands.

## Discoveries and Future Improvements

### 1. Check Whether the Log File Exists

Currently, the script assumes `app.log` already exists.

If the file does not exist, the `mv` command will produce an error.

Future improvement:

- If `app.log` exists, rename it to `app.log.1` and create a new `app.log`.
- If `app.log` does not exist, create it.

This can be implemented after learning Bash conditional statements.

### 2. Add a Completion Message

Currently, the script runs without displaying a message.

A future improvement would be to add:

```bash
echo "Log rotation completed"
```

This would provide confirmation that the script reached the end.

### 3. Support Multiple Rotated Logs

Currently, the script only uses `app.log.1`.

A future improvement would be to support multiple log files, such as:

```text
app.log
app.log.1
app.log.2
app.log.3
```

This would help preserve older logs instead of replacing the previous rotated file.

## Conclusion

This project helped me apply Linux commands and file permissions to a practical Bash scripting task.

I successfully created and tested a basic log rotation script.

As I continue learning Bash scripting, I plan to improve the script by adding conditional statements, completion messages, and support for multiple log files.