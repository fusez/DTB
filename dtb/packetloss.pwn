Float:GetPlayerPacketloss(playerid)
{
    new
		nstats[400 + 1],
		nstats_loss[20],
		start,
		end
	;

    GetPlayerNetworkStats(playerid, nstats, sizeof nstats);

    start = strfind(nstats, "packetloss", true);
    end = strfind(nstats, "%", true, start);

    strmid(nstats_loss, nstats, start + 12, end, sizeof nstats_loss);
    return floatstr(nstats_loss);
}
