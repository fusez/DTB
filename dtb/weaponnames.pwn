// Get Weapon Name: GWN
/******************************************************************************/

stock gwn_GetWeaponName(weaponid, output[], len)
{
	switch(weaponid)
	{
		case 0:
		    format(output, len, "Fists");
		case 18:
			format(output, len, "Molotov Cocktail");
		case 44:
			format(output, len, "Thermal Goggles");
		case 45:
			format(output, len, "Night Vision Goggles");
		case 49:
			format(output, len, "Vehicle");
		case 50:
			format(output, len, "Helicopter Blades");
		case 51:
			format(output, len, "Explosion");
		case 53:
			format(output, len, "Drowned");
		case 54:
			format(output, len, "Collision");
		case 255:
			format(output, len, "Suicide");
		default:
			GetWeaponName(weaponid, output, len);
	}
}
#if defined _ALS_GetWeaponName
	#undef GetWeaponName
#else
	#define _ALS_GetWeaponName
#endif
#define GetWeaponName gwn_GetWeaponName

/******************************************************************************/
