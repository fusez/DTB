ac_CheckPlayerWeapons(playerid)
{
	for(new slot; slot < 13; slot ++)
	{
		if(IsPlayerSpawned(playerid))
		{
			new	client_weaponid,
			    client_ammo,
			    ac_weaponid,
			    ac_ammo;

			GetPlayerWeaponData(playerid, slot, client_weaponid, client_ammo);
			ac_GetPlayerWeaponData(playerid, slot, ac_weaponid, ac_ammo);

			if(client_weaponid == ac_weaponid && !g_acWeaponSynced[playerid][slot])
			    g_acWeaponSynced[playerid][slot] = true;

			if(
				g_acWeaponSynced[playerid][slot] &&
				(client_weaponid != ac_weaponid || client_ammo > ac_ammo) &&
				client_weaponid != 0 &&
				client_weaponid != 46
			){
				if(g_acWeaponWarnings[playerid][slot] >= MAX_AC_WEAPON_WARNINGS)
				{
					new weaponname[20],
					    reason[50];

					GetWeaponName(client_weaponid, weaponname, sizeof weaponname);
					format(reason, sizeof reason,
						"Weapon Hacks (%s, %i)", weaponname, client_ammo
					);
					Ban(playerid, reason);
				}
				else
					g_acWeaponWarnings[playerid][slot] ++;
			}
			else
				g_acWeaponWarnings[playerid][slot] = 0;
		}
		else
			g_acWeaponWarnings[playerid][slot] = 0;
	}
}
