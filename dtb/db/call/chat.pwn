public OnPlayerText(playerid, text[])
{
	WriteChatlog(playerid, text);

	#if defined db_OnPlayerText
		return db_OnPlayerText(playerid, text);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerText
	#undef OnPlayerText
#else
	#define _ALS_OnPlayerText
#endif
#define OnPlayerText db_OnPlayerText
#if defined db_OnPlayerText
	forward db_OnPlayerText(playerid, text[]);
#endif
