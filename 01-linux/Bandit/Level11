# Bandit Level 11 → Level 12

### Challenge
The password for the next level was stored in data.txt. All uppercase (A–Z) and lowercase (a–z) letters had been rotated by 13 positions using ROT13. My goal was to reverse that rotation and reveal the password.

### Commands Used
- strings data.txt
- man tr
- strings data.txt | tr 'A-MN-Za-mn-z' 'N-ZA-Mn-za-m'

### Explanation
I started by running strings data.txt, which displayed the readable text from the file, but the letters were still encoded. The challenge said the letters had been rotated by 13 positions, so I needed a way to replace them with the correct letters.

I looked at man tr and learned that tr translates or deletes characters. I initially found it confusing that tr needs two character sets. Working through examples helped me understand that the first set contains the original characters and the second set contains their replacements. Each character maps to the character in the same position in the other set.

For ROT13, I split the uppercase alphabet into two halves: A–M and N–Z. Moving each letter 13 positions swaps those halves without reversing the order of the letters. I used the same approach for lowercase letters: a–m and n–z.

That gave me these mappings:
- SET1 (original characters): A-MN-Za-mn-z
- SET2 (replacement characters): N-ZA-Mn-za-m
I combined strings, a pipe, and tr to translate the text:

strings data.txt | tr 'A-MN-Za-mn-z' 'N-ZA-Mn-za-m'

The command displayed the decoded sentence containing the password.

### Challenges or Discoveries

The biggest challenge was understanding how the two sets in tr work. At first, I thought putting the two alphabet ranges inside brackets meant one range would automatically be replaced by the other. I learned instead that tr reads SET1 and SET2 separately and matches characters by position.

I also had to distinguish swapping the two halves of the alphabet from reversing the letters. In ROT13, A–M maps to N–Z, and N–Z maps back to A–M. The letters within each half stay in alphabetical order.

### Password
GROozWPO8QyN0mGrjUkID0WCYkZiQxrN

### What I Learned
- ROT13 is a character substitution method that rotates alphabetic letters by 13 positions.
- The uppercase and lowercase alphabets each divide into two halves that swap positions for ROT13.
- tr uses two character sets: the characters to find and the corresponding replacement characters.
- Character ranges such as A-M and n-z make it possible to specify many letters without typing each one individually.
- A pipe (|) passes the output of one command to another, allowing strings and tr to work together.
- Applying ROT13 twice returns the original text. ROT13 changes the representation of text; it is not encryption.