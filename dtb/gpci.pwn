#define MAX_GPCI 40

new g_PlayerGPCI[MAX_PLAYERS][MAX_GPCI + 1];

public OnPlayerConnect(playerid)
{
	gpci(playerid, g_PlayerGPCI[playerid], MAX_GPCI + 1);

	#if defined gpci_OnPlayerConnect
		gpci_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect gpci_OnPlayerConnect
#if defined gpci_OnPlayerConnect
	forward gpci_OnPlayerConnect(playerid);
#endif
