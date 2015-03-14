public OnPlayerLeaveTeam(playerid, teamid, reason)
{
	if(reason == LEAVE_TEAM_DEATH && g_pWeaponMenu{playerid} != INVALID_WEAPONMENU_ID)
		HidePlayerWeaponMenu(playerid);

	#if defined wm_OnPlayerLeaveTeam
		wm_OnPlayerLeaveTeam(playerid, teamid, reason);
	#endif
}
#if defined _ALS_OnPlayerLeaveTeam
	#undef OnPlayerLeaveTeam
#else
	#define _ALS_OnPlayerLeaveTeam
#endif
#define OnPlayerLeaveTeam wm_OnPlayerLeaveTeam
#if defined wm_OnPlayerLeaveTeam
	forward wm_OnPlayerLeaveTeam(playerid, teamid, reason);
#endif
