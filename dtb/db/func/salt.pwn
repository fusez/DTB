GenerateSalt(output[], len)
{
    for(new i; i + 1 < len; i ++)
        output[i] = random(2) ? (random(26) + (random(2) ? 'a' : 'A')) : (random(10) + '0');
}

SaltPassword(output[], len, const password[], const salt[])
	format(output, len, "%s%s", password, salt);
