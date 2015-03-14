DamagePlayer(damagedid, issuerid, Float:amount, weaponid, bodypart)
{
	if(issuerid != INVALID_PLAYER_ID && g_PlayerTeam[issuerid] == g_PlayerTeam[damagedid])
	    return 0;

	if(bodypart == 9)
		amount *= 2;

	new
		Float:health,
		Float:armour,
		Float:finaldamage = amount
	;

	ac_GetPlayerHealth(damagedid, health);
	ac_GetPlayerArmour(damagedid, armour);

	if(health <= 0.0)
	    return 0;

	if(armour > 0 && weaponid != WEAPON_COLLISION)
	{
		if(amount > armour)
		    SetPlayerArmour(damagedid, 0.0);
		else
		    SetPlayerArmour(damagedid, armour - amount);
		amount -= armour;
	}

	if(health > 0 && amount > 0)
	{
		if(amount > health)
		{
			finaldamage -= (amount - health);
			SetPlayerHealth(damagedid, 0.0);
		}
		else
		    SetPlayerHealth(damagedid, health - amount);
	}

	// Damage Sounds
	PlayerPlaySound(damagedid, 5202, 0.0, 0.0, 0.0); // Low Pitch
	if(issuerid != INVALID_PLAYER_ID)
		PlayerPlaySound(issuerid, 5205, 0.0, 0.0, 0.0); // High Pitch

	// Skinhit variables
	g_SkinhitIssuerID	[damagedid] = issuerid;
	g_SkinhitReasonID	[damagedid] = weaponid;
	g_SkinhitTick		[damagedid] = GetTickCount();

	// Round stats
	if(issuerid != INVALID_PLAYER_ID)
	{
		g_PlayerRoundDamage[issuerid] += finaldamage;
		g_PlayerDamagedBy[damagedid][issuerid] = true;
	}
	return 1;
}
