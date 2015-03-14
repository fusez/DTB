/******************************************************************************/

#define MAX_PING		500
#define MIN_FPS     	15
#define MAX_PACKETLOSS  5.0
#define INVALID_PING    65535

/******************************************************************************/

new
	PlayerText:	g_AntilagBoxTD	[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText: g_PingTD		[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText: g_FramerateTD	[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText: g_PacketlossTD	[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	g_PingWarnings				[MAX_PLAYERS],
	g_FpsWarnings				[MAX_PLAYERS],
	g_PacketLossWarnings		[MAX_PLAYERS]
;

/******************************************************************************/
