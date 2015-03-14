ShowPlayerWeaponMenu(playerid, menu_index)
{
	new title[18],
	    limit;

	format(title, sizeof title, "Select Weapon %i/2", menu_index + 1);

	PlayerTextDrawSetString	(playerid, g_WeaponMenuTitleTD[playerid], title);
	PlayerTextDrawShow		(playerid, g_WeaponMenuBoxTD[playerid]);
	PlayerTextDrawShow		(playerid, g_WeaponMenuTitleTD[playerid]);

	switch(menu_index)
	{
		case 0:
		{
	        limit = sizeof g_MenuWeapons;

			for(new i; i < limit; i ++)
				g_pMenuWeapons[playerid][i] = g_MenuWeapons[i];

			PlayerTextDrawHide(playerid, g_WeaponMenuBackTD[playerid]);
		}
		case 1:
		{
			for(new a, b = sizeof g_MenuWeapons; a < b; a ++)
			{
				new
					current_weaponid	= g_pMenuWeapons[playerid][a],
				    choice_weaponid		= g_pChosenWeapons[playerid][0],
					current_slot        = GetWeaponSlot(current_weaponid),
					choice_slot			= GetWeaponSlot(choice_weaponid)
				;

				if(current_slot != choice_slot)
					g_pMenuWeapons[playerid][limit ++] = current_weaponid;
			}

			for(new a = limit, b = sizeof g_MenuWeapons; a < b; a ++)
				g_pMenuWeapons[playerid][a] = 0;

			PlayerTextDrawShow(playerid, g_WeaponMenuBackTD[playerid]);
		}
		default:
		    return 0;
	}

	for(new a, b = sizeof g_MenuWeapons; a < b; a ++)
	{
		if(a < limit)
		{
			new weaponid = g_pMenuWeapons[playerid][a],
			    modelid = GetWeaponModel(weaponid),
			    weaponname[20];

			GetWeaponName(weaponid, weaponname, sizeof weaponname);

			PlayerTextDrawSetPreviewModel	(playerid, g_WeaponMenuIconTD[playerid][a], modelid);
			PlayerTextDrawSetString			(playerid, g_WeaponMenuNameTD[playerid][a], weaponname);
			PlayerTextDrawShow				(playerid, g_WeaponMenuIconTD[playerid][a]);
			PlayerTextDrawShow				(playerid, g_WeaponMenuNameTD[playerid][a]);
		}
		else
		{
			PlayerTextDrawHide(playerid, g_WeaponMenuIconTD[playerid][a]);
			PlayerTextDrawHide(playerid, g_WeaponMenuNameTD[playerid][a]);
		}
	}

    g_pWeaponMenu{playerid} = menu_index;
	return 1;
}
