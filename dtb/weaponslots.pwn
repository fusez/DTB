new const WeaponSlots[47] =
{
	0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 8, 8, 8, 0, 0, 0, 2,
	2, 2, 3, 3, 3, 4, 4, 5, 5, 4, 6, 6, 7, 7, 7, 7, 8, 12, 9, 9, 9, 11, 11, 11
};

stock GetWeaponSlot(weaponid)
{
	switch(weaponid)
	{
		case 0..46:
			return WeaponSlots[weaponid];
	}
	return 0;
}
