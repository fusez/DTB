#define MAX_TEAM_PLAYERS	10
#define	TEAM_ATTACK			0
#define	TEAM_DEFEND			1
#define	TEAM_SPECTATE		2
#define	TEAM_NONE			3

enum
{
    LEAVE_TEAM_DISCONNECT,
	LEAVE_TEAM_DEATH
}

new	g_PlayerTeam[MAX_PLAYERS] = {TEAM_NONE, ...};
new const g_TeamNames[3][] = {"Attackers", "Defenders", "Spectators"};
new const g_TeamSkins[3] = {170, 177};

forward OnPlayerLeaveTeam(playerid, teamid, reason);

#define GetTeamOpponents(%0) \
	((%0 == TEAM_ATTACK) ? (TEAM_DEFEND) : (TEAM_ATTACK))
