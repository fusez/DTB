#define MAX_AC_MONEY_WARNINGS \
	(0)

#define MAX_AC_ARMOUR_WARNINGS \
	(15)

#define MAX_AC_HEALTH_WARNINGS \
	(15)

#define MAX_AC_WEAPON_WARNINGS \
	(15)

#define MAX_AC_FLYHACK_WARNINGS \
	(10)

#define MAX_AC_JETPACK_WARNINGS \
	(0)

#define MAX_AC_NORELOAD_WARNINGS \
	(30)

#define MIN_AC_FLOOD_RATE \
	(500)

#define MAX_AC_FLOOD_WARNINGS \
	(5)

#define MAX_AC_REPEAT_STRING \
	(50)

#define MAX_AC_REPEAT_WARNINGS \
	(3)


new
	g_acMoney				[MAX_PLAYERS],
	Float: g_acHealth		[MAX_PLAYERS],
	Float: g_acArmour		[MAX_PLAYERS],
	bool: g_acWeaponSynced	[MAX_PLAYERS][13],
	g_acWeaponData			[MAX_PLAYERS][13][2],
	g_acWeaponWarnings		[MAX_PLAYERS][13],
	g_acNoReloadWarnings	[MAX_PLAYERS char],
	bool: g_acJetpack		[MAX_PLAYERS char],
	g_acMoneyWarnings		[MAX_PLAYERS char],
	g_acHealthWarnings		[MAX_PLAYERS char],
	g_acArmourWarnings		[MAX_PLAYERS char],
	g_acFlyhackWarnings		[MAX_PLAYERS char],
	g_acJetpackWarnings		[MAX_PLAYERS char],
	g_acMessageWarnings     [MAX_PLAYERS char],
	g_acMessageString       [MAX_PLAYERS][MAX_AC_REPEAT_STRING]
;

#define ac_GetPlayerMoney(%0) \
	(g_acMoney[%0])

#define ac_GetPlayerHealth(%0,%1) \
	(%1 = g_acHealth[%0])

#define ac_GetPlayerArmour(%0,%1) \
	(%1 = g_acArmour[%0])

#define ac_GetPlayerWeaponData(%0,%1,%2,%3) \
	(%2 = g_acWeaponData[%0][%1][0], %3 = g_acWeaponData[%0][%1][1])
