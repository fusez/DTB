RegisterPlayerAccount(playerid, accountid, const password[])
{
	new
		saltpass[MAX_PASSWORD + MAX_SALT + 1],
		query[400]
	;

	GenerateSalt(g_PlayerSalt[playerid], MAX_SALT + 1);
	SaltPassword(saltpass, sizeof saltpass, password, g_PlayerSalt[playerid]);
	WP_Hash(g_PlayerPassword[playerid], MAX_PASSWORD_HASH + 1, saltpass);

    mysql_format(g_DBHandle, query, sizeof query,
		"UPDATE accounts SET account_registered = 1, account_register_date = NOW(), account_password = '%e', account_salt = '%e' WHERE account_id = %i",
		g_PlayerPassword[playerid],
		g_PlayerSalt[playerid],
		accountid
	);
    mysql_tquery(g_DBHandle, query, "OnPlayerAccountRegistered", "i", playerid);
}
