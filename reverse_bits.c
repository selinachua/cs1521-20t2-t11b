#include <stdio.h>
#include <assert.h>

typedef unsigned int Word;

/**
 * original:            reversed:
 * 1010      reverse ->  0101
 * Use bit masking to figure out what rightmost bit is,
 * put it at the leftmost of my result.
 * Do the same again for the rest.
 * 
 * ret = 0 = 0100
 * opp_mask = 0100
 * ret = ret | opp_mask = 0100
 * opp_mask = 0001
 * ret = ret | opp_mask = 0101
 * 
 * step by step:
 * 1010
 * 0001 & -> this mask gives position of rightmost bit
 * ------
 * 0000 = 0 -> we know that rightmost bit in original is 0.
 * 
 * 1010
 * 0010 & -> this mask gives position of second rightmost bit
 * ------
 * 0010 != 0 -> we know that second from rightmost bit in original is 1.
 * 
 * 1010
 * 0100 & -> this mask gives position of third rightmost bit
 * ------
 * 0000 = 0 -> we know that third from rightmost bit in original is 0.
 * 
 * 1010
 * 1000 & -> this mask gives position of leftmost bit
 * ------
 * 1000 != 0 -> we know that leftmost bit in original is 1.
 * 
 * pseudocode:
 * ret = 0;
 * for every bit:    
 *      w & mask
 *      if ((w & mask) != 0) {
 *          ret |= opp_mask
 *      }
 * return ret
 * 
 * w = 0000 ... 0001
 * ret |= 1000 ... 0000
 */
Word reverseBits(Word w) {
    Word ret = 0;
    // 32 bits in an int.
    for (int i = 0; i < 32; i++) {
        // Mask initially start off as 1 = 0000 ... 0001 = 1 << 0
        // Next iteration mask is 0000 ... 0010 = 1 << 1
        // Next iteration mask is 0000 ... 0100 = 1 << 2
        Word mask = 1 << i;
        Word masked = w & mask;
        // If bit at that position is = 1
        if (masked != 0) {
            // opp_mask should start off = 1000 ... 0000 = 1 << 31
            // Next iteration opp_mask = 0100 ... 0000 = 1 << 31 - 1
            // Next iteration opp_mask = 0010 ... 0000 = 1 << 31 - 2
            // 1 >> 1 = 0000 ... 0001 >> 1 = 0000 ... 0000
            Word opp_mask = 1 << (31 - i);
            ret |= opp_mask;
        }
    }
    return ret;
}

// testing
int main(void) {
    Word w1 = 0x01234567;
    // 0000 => 0000 = 0
    // 0001 => 1000 = 8
    // 0010 => 0100 = 4
    // 0011 => 1100 = C
    // 0100 => 0010 = 2
    // 0101 => 1010 = A
    // 0110 => 0110 = 6
    // 0111 => 1110 = E
    assert(reverseBits(w1) == 0xE6A2C480);
    puts("All tests passed!");
    return 0;
}