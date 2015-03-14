#define INVALID_WEAPONMENU_ID 2

new const g_MenuWeapons[] =
{
	WEAPON_COLT45,
	WEAPON_SILENCED,
	WEAPON_DEAGLE,
	WEAPON_SHOTGUN,
    WEAPON_SAWEDOFF,
	WEAPON_SHOTGSPA,
	WEAPON_AK47,
	WEAPON_M4,
	WEAPON_RIFLE,
	WEAPON_SNIPER,
    WEAPON_UZI,
    WEAPON_TEC9,
	WEAPON_MP5
};

new g_pWeaponMenu						[MAX_PLAYERS char],
	g_pChosenWeapons					[MAX_PLAYERS][2],
	g_pMenuWeapons						[MAX_PLAYERS][sizeof g_MenuWeapons],
	PlayerText: g_WeaponMenuBoxTD		[MAX_PLAYERS] = {PlayerText: INVALID_TEXT_DRAW, ...},
	PlayerText: g_WeaponMenuBackTD      [MAX_PLAYERS] = {PlayerText: INVALID_TEXT_DRAW, ...},
	PlayerText: g_WeaponMenuTitleTD     [MAX_PLAYERS] = {PlayerText: INVALID_TEXT_DRAW, ...},
	PlayerText: g_WeaponMenuIconTD		[MAX_PLAYERS][sizeof g_MenuWeapons],
	PlayerText: g_WeaponMenuNameTD      [MAX_PLAYERS][sizeof g_MenuWeapons];
