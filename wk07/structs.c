// For each of the following struct definitions, what are the likely 
// offset values for each field, and the total size of the struct:

// 1.
struct _coord {
	double x;	// 0
	double y;	// 8
};
size: 16

// 2.
typedef struct _node Node;
struct _node {
	int value;	// 0
	Node *next;	// 4
};
size: 8


// 3.
struct _enrolment {
	int stu_id;         // 0  e.g. 5012345    -> 0x04, 0x08, 0x0C NOT IN 0x03, 0x01
	char course[9]:     // 4  e.g. "COMP1521" -> 0x01, 0x02
	char term[5];       // 13 e.g. "17s2"
	char grade[3];      // 18 e.g. "HD"
	double mark;        // 24 e.g. 87.3
};

// 0x03 -> 0x00 - 0x03 -> take last byte
// 0x04 -> 0x04 - 0x07 -> take the first 3 bytes 


// 4.
struct _queue {
	int nitems;     // # items currently in queue
	int head;       // index of oldest item added
	int tail;       // index of most recent item added
	int maxitems;   // size of array
	Item *items;    // malloc'd array of Items
};