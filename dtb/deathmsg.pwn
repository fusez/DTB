public OnPlayerDeath(playerid, killerid, reason)
{
	if(killerid != INVALID_PLAYER_ID)
	{
		new
			reason_name[20],
			Float:distance = 0.3048 * GetDistanceBetweenPlayers(playerid, killerid),
			Float:health,
			Float:armour,
			message[128]
		;

		GetWeaponName(reason, reason_name, sizeof reason_name);

		ac_GetPlayerHealth(killerid, health);
		ac_GetPlayerArmour(killerid, armour);

		format(message, sizeof message,
			"%s {%06x}killed{%06x} %s {%06x}| %s | %.2fM | +%i",
			g_PlayerName[killerid],
			RGBAtoRGB(COLOR_WHITE),
			RGBAtoRGB(GetPlayerColor(playerid)),
			g_PlayerName[playerid],
			RGBAtoRGB(COLOR_WHITE),
			reason_name,
			distance,
			floatround(health) + floatround(armour)
		);
		SendClientMessageToAll(GetPlayerColor(killerid), message);
	}

	SendDeathMessage(killerid, playerid, reason);

	#if defined dmsg_OnPlayerDeath
		dmsg_OnPlayerDeath(playerid, killerid, reason);
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath dmsg_OnPlayerDeath
#if defined dmsg_OnPlayerDeath
	forward dmsg_OnPlayerDeath(playerid, killerid, reason);
#endif
