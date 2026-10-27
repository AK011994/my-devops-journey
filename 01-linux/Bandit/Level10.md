# Bandit Level 10 → Level 11

### Challenge
The goal of Bandit Level 10 was to find the password for the next level. The password was stored in a file called data.txt, and its contents were encoded using Base64. I needed to decode the information to reveal the password.

### Commands Used
1. ls — Listed the files in the current directory.
2. base64 data.txt — Experimented with Base64; this encoded the file's already-encoded contents again.
3. man base64 — Opened the manual to learn about the command and its options.
4. base64 -d data.txt — Decoded the file's contents and revealed the password.

### Explanation
I started by running ls to see what files were available in the directory. I found a file called data.txt.

The OverTheWire challenge mentioned that the password was stored in Base64-encoded data. Since base64 was also listed among the suggested commands, I decided to experiment with it.

I ran base64 data.txt and received a very long string of characters. Initially, I thought this was the password. However, it was unusually long compared to the passwords I had found in previous Bandit levels.

This made me go back to the OverTheWire website and reread the challenge instructions. I realized that I had missed an important detail: the file's contents were already encoded, and I needed to decode them rather than encode them again.

To learn how, I opened the manual using man base64. I immediately noticed the -d option, which stands for decode.

I then ran base64 -d data.txt. This decoded the contents and revealed the password for the next level.

### Challenges or Discoveries
The biggest challenge I faced was understanding what the instructions were asking me to do. At first, I assumed the long output from my initial command was the password, but its unusual length made me revisit the challenge.

I discovered that base64 encodes data by default, while the -d option decodes it. Once I understood that the file already contained Base64-encoded data, I could use the correct option to retrieve the password.

### Password
pYfOY6HwUsDj5rL9UvyhU7MCmv8vN5Ro

### What I Learned
This level helped me understand Base64 encoding and decoding and how they work in Linux.

I learned that Base64 is an encoding method that represents data using 64 different characters. It changes how information is represented without changing the underlying data.

I also learned the difference between encoding and decoding:
- Encoding: Converts data from one representation into another.
- Decoding: Converts encoded data back into its original representation.
I learned how to use the base64 command in Linux to encode and decode data.

After researching Base64 further, I discovered that Base64 is not a security measure or a form of encryption. It simply changes how information is represented. Anyone with access to Base64-encoded data can decode it without needing an encryption key.

This level strengthened my understanding of data encoding, decoding, and how Linux commands can be used to transform data between different representations.