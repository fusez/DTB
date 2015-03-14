#define MAX_PASSWORD_HASH \
	(128)

#define MAX_PASSWORD \
	(20)

#define MIN_PASSWORD \
	(6)

#define MAX_SALT \
	(20)

#define MAX_LOGIN_ATTEMPTS \
	(5)

#define SQL_HOST \
	("127.0.0.1")

#define SQL_USER \
	("root")

#define SQL_DB \
	("db_name")

#define SQL_PASSWORD \
	("db_password")

new
	g_DBHandle,
	g_PlayerAccountID				[MAX_PLAYERS],
	bool: g_IsPlayerRegistered		[MAX_PLAYERS char],
	bool: g_IsPlayerLoggedIn		[MAX_PLAYERS char],
	g_PlayerLoginAttempts			[MAX_PLAYERS char],
	g_PlayerPassword				[MAX_PLAYERS][MAX_PASSWORD_HASH + 1],
	g_PlayerSalt					[MAX_PLAYERS][MAX_SALT + 1],
	g_PlayerAdminLevel				[MAX_PLAYERS char],
	g_PlayerKills					[MAX_PLAYERS],
	g_PlayerBestMultiKill           [MAX_PLAYERS char],
	g_PlayerDeaths					[MAX_PLAYERS],
	g_PlayerGamesWon				[MAX_PLAYERS],
	g_PlayerGamesLost				[MAX_PLAYERS],
	g_PlayerBombsPlanted			[MAX_PLAYERS],
	g_PlayerBombsDefused			[MAX_PLAYERS],
	g_PlayerPlayTime				[MAX_PLAYERS]
;
