/**
 * We have 32 bits, and we want to get the middle 6 bits.
 * 
 * 0000 0000 0000 0000 0000 0000 0000 0000
 * 
 * u:
 * 0000 1100 0000 0111 1100 0000 1111 0000
 * 
 * six_middle_bits(u) -> 
 * 0000 0000 0000 0000 0000 0000 0011 1110
 * 
 * 1. right shift 13 times
 * u >> 13
 * 2. Get the last 6 bits only -> bit masking
 * mask -> 0011 1111 -> 0x3F 
 * u & 0011 1111
 * u & 0x3F
 */
uint32_t six_middle_bits(uint32_t u) {
    return (u >> 13) & 0x3F;
}