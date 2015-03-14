#define MAX_COUNTRY_NAME	40
#define MAX_CITY_NAME		40
#define MAX_ISP_NAME        100

new
	g_PlayerCountry	[MAX_PLAYERS][MAX_COUNTRY_NAME + 1],
	g_PlayerCity	[MAX_PLAYERS][MAX_CITY_NAME + 1],
	g_PlayerISP		[MAX_PLAYERS][MAX_ISP_NAME + 1]
;

public OnPlayerConnect(playerid)
{
	GetIPCountry	(g_PlayerIP[playerid], g_PlayerCountry[playerid], MAX_COUNTRY_NAME + 1);
	GetIPCity		(g_PlayerIP[playerid], g_PlayerCity[playerid], MAX_CITY_NAME + 1);
	GetIPISP		(g_PlayerIP[playerid], g_PlayerISP[playerid], MAX_ISP_NAME + 1);

	#if defined geo_OnPlayerConnect
		geo_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect geo_OnPlayerConnect
#if defined geo_OnPlayerConnect
	forward geo_OnPlayerConnect(playerid);
#endif
