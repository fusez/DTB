#define MAX_IPV4 15

new g_PlayerIP[MAX_PLAYERS][MAX_IPV4 + 1];

public OnPlayerConnect(playerid)
{
	GetPlayerIp(playerid, g_PlayerIP[playerid], MAX_IPV4 + 1);

	#if defined ip_OnPlayerConnect
		ip_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect ip_OnPlayerConnect
#if defined ip_OnPlayerConnect
	forward ip_OnPlayerConnect(playerid);
#endif
