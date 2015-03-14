#define KEY_HOLDING(%0) \
	( (newkeys & %0) == %0 )

#define KEY_PRESSED(%0) \
	( (newkeys & %0) == %0 && (oldkeys & %0) != %0 )

#define KEY_RELEASED(%0) \
	( (newkeys & %0) != %0 && (oldkeys & %0) == %0 )
