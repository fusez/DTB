#define COLOR_RED		0xFF0000FF
#define COLOR_GREEN		0x00FF00FF
#define COLOR_BLUE		0x0000FFFF
#define COLOR_WHITE		0xFFFFFFFF
#define COLOR_YELLOW	0xFFFF00FF
#define COLOR_GREY		0x9D9D9DFF
#define COLOR_AQUA		0x11FFFFFF
#define COLOR_ORANGE	0xFF9900FF
#define COLOR_PURPLE    0xAA00FFFF

new const g_SiteColors[2] = {COLOR_YELLOW, COLOR_PURPLE};
new const g_TeamColors[3] = {COLOR_RED, COLOR_BLUE, COLOR_WHITE};

#define RGBAtoRGB(%0) \
	(%0 >>> 8)

#define RGBAtoARGB(%0) \
    (%0 >>> 8 | %0 << 24)
