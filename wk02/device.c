#define READING   0x01 // 0000 0001
#define WRITING   0x02 // 0000 0010
#define AS_BYTES  0x04 // 0000 0100
#define AS_BLOCKS 0x08 // 0000 1000
#define LOCKED    0x10 // 0001 0000

// switch a device to/from reading and writing, leaving other flags unchanged
// ~READING
// WRITING
// 0000 0001
// 1111 1110
// 0000 0000
device = device & (~READING) | WRITING

/**
 * We have this device and we want to change the settings of the device
 * using bitwise operations.
 * 
 * device has 8 bits.
 * device = 0001 0101 -> currently reading and also locked as bytes
 */
unsigned char device; 

// set the device as locked, leaving other flags unchanged
// device = 0000 0101
//          0001 0000 | 
device = (device | LOCKED);
device |= LOCKED;

// mark the device as locked for writing blocks
device = (LOCKED | WRITING | AS_BLOCKS);

// mark the device as locked for reading bytes
// & or | ?
// If we do LOCKED & READING -> all 0
// If we do LOCKED | READING:
// 0001 0000
// 0000 0001 |
// -----------
// 0001 0001
// We actually need to use the | operator.
device = (LOCKED | READING | AS_BYTES);

// remove the lock on a device, leaving other flags unchanged

