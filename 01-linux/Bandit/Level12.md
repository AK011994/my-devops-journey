# Bandit Level 12 → Level 13

### Challenge
The password for the next level was stored in data.txt, a hexdump of a file that had been compressed multiple times. The challenge recommended creating a working directory under /tmp, copying the file there, and using Linux commands to reverse the hexdump and unpack each layer.

### Commands Used
The commands below follow the order I used during the challenge. I have included the unsuccessful attempts because they explain what I discovered along the way.
1. ls
2. cd ..
3. ls
4. cd ..
5. ls
6. cd tmp
7. ls — Permission denied when trying to list /tmp.
8. mktemp-d — Command not found; I had omitted the space between mktemp and -d.
9. mkdir aktempdirectory94
10. ls and ls -a — Both returned permission denied in /tmp.
11. pwd
12. ls -ld /tmp/aktempdirectory94 — Confirmed my directory had been created.
13. cp ~/data.txt /tmp/aktempdirectory94
14. ls /tmp/aktempdirectory94 — Confirmed the copied file was there.
15. mv data.txt hexhump.txt — Failed because I was still in /tmp, not inside my directory.
16. cd aktempdirectory94
17. ls
18. mv data.txt hexhump.txt
19. ls
20. cat hexhump.txt
21. man xxd
22. xxd -r hexhump.txt newdata.txt
23. file newdata.txt — Identified gzip-compressed data.
24. man gzip
25. ungzip newdata.txt — Command not found.
26. mv newdata.txt newdata.gz
27. ls
28. gunzip newdata.gz
29. ls
30. file newdata — Identified bzip2-compressed data.
31. man bzip — No manual entry.
32. man bzip2
33. bunzip2 newdata — Created newdata.out because the file had no .bz2 extension.
34. mv newdata newdata.bzip2 — Failed because bunzip2 had already removed the original file.
35. ls
36. file newdata.out — Identified gzip-compressed data.
37. mv newdata.out newdata.gz
38. gunzip newdata.gz
39. file newdata.gz — Failed because decompression had removed the .gz file.
40. ls
41. file newdata — Identified a POSIX tar archive.
42. man tar
43. tar --extract --file newdata
44. ls — Found data5.bin.
45. file data5.bin — Identified another tar archive.
46. tar --extract --file data5.bin
47. ls — Found data6.bin.
48. file data6.bin — Identified bzip2-compressed data.
49. mv data6.bin data6.bz2
50. ls
51. bunzip2 data6.bz2
52. ls
53. file data6 — Identified a tar archive.
54. tar --extract --file data6
55. ls — Found data8.bin.
56. file data8.bin — Identified gzip-compressed data.
57. mv data8.bin data8.gz
58. ls
59. gunzip data8.zp — Failed because I typed the wrong extension.
60. gunzip data8.gz
61. ls
62. file data8 — Identified ASCII text.
63. cat data8 — Displayed the password for the next level.

### Explanation
I began in the Bandit 12 home directory, where ls showed data.txt. I ran cd .. to move up to /home, then ran cd .. again to reach the root directory /. From there, I entered /tmp using cd tmp.

When I tried ls and ls -a in /tmp, Linux returned a permission-denied message. I initially typed mktemp-d, but that was not recognized as a command. Instead, I created a directory using mkdir aktempdirectory94. Although I could not list the contents of /tmp, ls -ld /tmp/aktempdirectory94 confirmed that my directory existed. I then copied the original file into it using cp ~/data.txt /tmp/aktempdirectory94 and verified the copy with ls /tmp/aktempdirectory94.

My first attempt to rename the copied file failed because I was still in /tmp. After entering aktempdirectory94, I renamed data.txt to hexhump.txt. I used cat to inspect it and saw hexadecimal values, offsets, and text characters rather than ordinary readable text.

I opened man xxd and found the -r option, which reverses a hexdump into binary data. I ran xxd -r hexhump.txt newdata.txt, then used file newdata.txt to identify the result as gzip-compressed data.

I consulted man gzip, renamed the file to newdata.gz, and decompressed it with gunzip. The resulting file, newdata, was bzip2-compressed. After checking man bzip2, I ran bunzip2 newdata. Because the filename did not have the expected extension, the command created newdata.out.

I checked newdata.out with file and discovered another gzip layer. I renamed it to newdata.gz, decompressed it, and identified the resulting newdata as a tar archive. I consulted man tar and used tar --extract --file newdata to extract data5.bin.

I continued checking each new file with file. data5.bin was another tar archive, which extracted data6.bin. That file was bzip2-compressed, so I renamed it to data6.bz2 and decompressed it with bunzip2. The resulting data6 was a tar archive, which extracted data8.bin.

Finally, file data8.bin identified gzip-compressed data. I renamed it to data8.gz, decompressed it, and used file data8 to confirm that the result was ASCII text. Running cat data8 displayed the password for Level 13.

### Challenges or Discoveries
- I learned that cd .. moves up one directory at a time. Starting from /home/bandit12, I moved to /home and then / before entering /tmp.
- Even though listing /tmp returned permission denied, I was still able to create my own directory there. Using ls -ld on the specific directory confirmed it existed.
- mktemp-d was not a valid command. The manual's mktemp -d form requires a space between the command and its option; I chose to create a directory with mkdir instead.
- ~/data.txt referred to the file in my Bandit home directory, regardless of my current working directory.
- My first mv data.txt hexhump.txt attempt failed because I had not yet changed into the directory containing the copied file.
- The xxd -r option converted the hexdump back into binary data. The file command then helped me identify its actual format.
- I encountered both gzip (.gz) and bzip2 (.bz2) compression. Their decompression commands are gunzip and bunzip2, respectively.
- Running bunzip2 on a file without a recognized extension still decompressed it, but it chose the output name newdata.out.
- After gunzip or bunzip2 successfully decompressed a file, the original compressed filename was no longer present. This explained later “No such file or directory” messages.
- Tar archives are different from compression formats: tar --extract --file extracted another file while leaving the archive in place.
- A file's extension did not always describe its actual contents. I used file to identify each layer rather than relying on filenames such as .txt or .bin.
- I made a typo with data8.zp, then corrected it to data8.gz to finish decompressing the last layer.

### Password
qQYQiHOBPR8zR61qxYqX45quvihF2uzk

### What I Learned
This level helped me understand how Linux handles hexdumps, compressed files, and tar archives. I learned that a hexdump represents binary data using hexadecimal values and that xxd -r can reconstruct the original binary file. I also practiced using file to identify the actual contents of a file, even when its extension was misleading.

I gained hands-on experience with two compression formats, gzip and bzip2, and learned how to decompress them using gunzip and bunzip2. I also learned that tar archives package files together and can be extracted with tar --extract --file. Because the data was packed into several layers, I had to identify the format after each step and choose the appropriate command.

This challenge also strengthened my understanding of directory navigation, absolute and home-directory paths, copying and renaming files, and reading Linux manual pages. By working through each layer, I became more comfortable investigating unfamiliar files and using command output to determine what to do next.