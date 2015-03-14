#define COUNTDOWN_TIME \
	(10)

#define MISSION_TIME \
	(3*60)

#define INTERMISSION_TIME \
	(15)

new
	g_GameTime,
	g_GameState,
	g_GameTimer,
	g_GameWinner
;

enum
{
	STATE_COUNTDOWN,
	STATE_STARTED,
	STATE_FINISHED
}

enum
{
	REASON_DESTROYED,
	REASON_DEFUSED,
	REASON_ATTACK_KILLED,
	REASON_DEFEND_KILLED,
	REASON_ATTACK_DISCONNECT,
	REASON_DEFEND_DISCONNECT,
	REASON_NO_PLANT,
	REASON_CANCELLED
}

forward OnSecondPassed();
forward OnGameStart();
forward OnGameEnd(reason);
