public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(clickedid == Text:INVALID_TEXT_DRAW && g_pWeaponMenu{playerid} != INVALID_WEAPONMENU_ID)
		SelectTextDraw(playerid, COLOR_RED);

	#if defined wm_OnPlayerClickTextDraw
		return wm_OnPlayerClickTextDraw(playerid, Text:clickedid);
	#else
	    return 0;
	#endif
}
#if defined _ALS_OnPlayerClickTextDraw
	#undef OnPlayerClickTextDraw
#else
	#define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw wm_OnPlayerClickTextDraw
#if defined wm_OnPlayerClickTextDraw
	forward wm_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif
