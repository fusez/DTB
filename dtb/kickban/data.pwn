new bool: g_IsPlayerKicked[MAX_PLAYERS char];

#define DelayKick(%0) \
	( SetTimerEx("PublicKick", 1000, false, "i", %0) )

forward OnPlayerKicked(playerid, by_playerid, by_irc_user[], reason[]);
forward OnPlayerBanned(playerid, by_playerid, by_irc_user[], reason[]);
