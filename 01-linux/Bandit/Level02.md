# Bandit Level 2 → Level 3

### Challenge
The level asked us to find the password stored in a file named `--spaces in this filename--`, located in the home directory.

### Commands Used
These are the commands I actually tried during the challenge, in order:

- `cat '--spaces in this filename--'`
- `cat '-- --spaces in this filename--'`
- `./--spaces in this filename--`
- `cat ./--spaces in this filename--`
- `cat ./ --spaces\ in\ this\ filename--`
- `cat ./--spaces\ in\ this\ filename--`

**Successful command:**
`cat ./--spaces\ in\ this\ filename--`

### Explanation
I initially tried using `cat` with the filename enclosed in single quotes, but it did not work. Although the quotes handled the spaces, the filename started with hyphens, which caused `cat` to interpret it as an option.

The terminal suggested using `--` to indicate the end of command options. However, I mistakenly included `--` inside the quotation marks instead of using it as a separate argument.

I also accidentally tried accessing the file without `cat`. After that, I tried using `cat` with `./`, but the command still failed because I had not handled the spaces in the filename.

I remembered a previous Linux lesson where we used backslashes (`\`) to escape spaces when creating files. I realized I could apply the same concept when reading a file.

My next attempt included an extra space between `./` and the filename, which caused the command to fail.

Finally, I ran:

`cat ./--spaces\ in\ this\ filename--`

This successfully displayed the password.

### Challenges or Discoveries
The biggest challenge was figuring out how to read a filename containing both spaces and leading hyphens.

After completing the challenge, I learned that there were other ways I could have solved it.

For example:

- `cat -- '--spaces in this filename--'`
- `cat ./"--spaces in this filename--"`

Although I did not use these commands during the challenge, I learned that `--` tells `cat` to stop interpreting subsequent arguments as options, while `./` specifies a path relative to the current directory.

I also learned that quotation marks can handle spaces in filenames and that small differences in spacing can change how the shell interprets a command.

### Password
7ZZ2LFrykP2zEyvBl4m3clcL7tGYJPME

### What I Learned
- I learned that unquoted or unescaped spaces in filenames cause the shell to split the filename into multiple arguments.
- I learned that using a backslash (`\`) before a space prevents the shell from treating it as an argument separator.
- I learned that quotation marks are another way to handle filenames containing spaces.
- I learned that `--` tells commands like `cat` to stop interpreting subsequent arguments as options. This is useful when filenames begin with hyphens.
- I learned that `./` specifies a path relative to the current directory. It can also prevent filenames beginning with hyphens from being interpreted as command options.
- I learned that `--` is separated from the filename by a space, while `./` must be attached to the filename as part of its path.
- Most importantly, I learned that small differences in spacing can change how the shell interprets a command.

