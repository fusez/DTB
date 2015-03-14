ac_CheckPlayerNoReload(playerid, weaponid)
{
	static
	    previous_weaponid	[MAX_PLAYERS char],
	    previous_ammo		[MAX_PLAYERS]
	;

	if(weaponid == previous_weaponid{playerid})
	{
		new
			slot = GetWeaponSlot(weaponid),
			slot_weaponid,
			slot_ammo
		;

		GetPlayerWeaponData(playerid, slot, slot_weaponid, slot_ammo);

		if(slot_ammo == previous_ammo[playerid])
		{
			if(g_acNoReloadWarnings{playerid} >= MAX_AC_NORELOAD_WARNINGS)
				Ban(playerid, "No Reload");
			else
				g_acNoReloadWarnings{playerid} ++;
		}
		else
		{
			g_acNoReloadWarnings	{playerid} = 0;
			previous_ammo			[playerid] = slot_ammo;
		}
	}
	else
	{
		g_acNoReloadWarnings	{playerid} = 0;
		previous_weaponid		{playerid} = weaponid;
	}
}
