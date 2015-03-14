#define INVALID_PICKUP_ID 		-1
#define INVALID_BOMBSITE_ID		2
#define PLANT_TIME				5000
#define DEFUSE_TIME 			5000
#define BOMB_ANIM_SPEED     	4.1
#define BOMB_ATTACH_INDEX       9

enum
{
	BOMBSITE_A,
	BOMBSITE_B
}

new
	bool: g_IsBombsiteCreated			[2 char],
	bool: g_IsBombPlanted,
	bool: g_IsBombDefused,
	bool: g_IsBombBeingPlanted,
	bool: g_IsBombBeingDefused,
	g_BombPlantTick,
	g_BombDefuseTick,
	g_BombPlantTimer,
	g_BombDefuseTimer,
	g_BombPlantSite,
	g_BombCarrierID 					= INVALID_PLAYER_ID,
	g_BombPlanterID 					= INVALID_PLAYER_ID,
	g_BombDefuserID 					= INVALID_PLAYER_ID,
	g_BombPickupID 						= INVALID_PICKUP_ID,
	Float:g_BombPickupPos				[3],
	g_BombsiteObjects					[2][5],
	g_BombObject						= INVALID_OBJECT_ID,
	bool: g_IsBombExploding,
	g_BombExplodeTimer,
	g_PlayerBombsite					[MAX_PLAYERS char] = {INVALID_BOMBSITE_ID, ...},
	PlayerText: g_BombProgressBackTD	[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText: g_BombProgressMaxTD		[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
	PlayerText: g_BombProgressValueTD	[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...},
    PlayerText: g_BombTextTD			[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...}
;

#define GetOppositeBombsite(%0) \
	((%0 == BOMBSITE_A) ? (BOMBSITE_B) : (BOMBSITE_A))

#define AttachPlayerBombToBack(%0) \
	(SetPlayerAttachedObject(%0, BOMB_ATTACH_INDEX, 1252, 1, 0.047846, -0.193535, 0.0, 0.0, 90.0, 0.0))

#define AttachBombToPlayerHands(%0) \
	(SetPlayerAttachedObject(%0, BOMB_ATTACH_INDEX, 1252, 6, 0.135370, 0.069800, -0.034781))

#define UnattachBombFromPlayer(%0) \
	(RemovePlayerAttachedObject(%0, BOMB_ATTACH_INDEX))

