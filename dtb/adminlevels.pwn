GetAdminLevelName(level)
{
	new levelname[11];
	switch(level)
	{
		case 0:
			strunpack(levelname, !"Player");
		case 1:
			strunpack(levelname, !"Moderator");
		case 2:
			strunpack(levelname, !"Management");
		default:
			strunpack(levelname, !"Unknown");
	}
	return levelname;
}
