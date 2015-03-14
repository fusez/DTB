native IsValidVehicle(vehicleid);
native WP_Hash(buffer[], len, const str[]);
native gpci(playerid, serial[], len);

#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <geolocation>
#include <a_mysql>
#include <irc>

/******************************************************************************/

#include "dtb/weaponnames.pwn" // weapon names hook
#include "dtb/weaponmodels.pwn" // weapon models
#include "dtb/weaponslots.pwn" // weapon slots
#include "dtb/soundforall.pwn" // play sound for all function
#include "dtb/preloadanim.pwn" // preload animations
#include "dtb/dialogs.pwn" // dialog enum
#include "dtb/framerate.pwn" // get player framerate
#include "dtb/float.pwn" // float functions
#include "dtb/timestring.pwn" // Time > Time String
#include "dtb/health.pwn" // on player health set
#include "dtb/armour.pwn" // on player armour set
#include "dtb/isspawned.pwn" // is player spawned function
#include "dtb/controllable.pwn" // is player controllable
#include "dtb/keys.pwn" // key macros
#include "dtb/isodd.pwn" // isodd macro
#include "dtb/colors.pwn" // colors
#include "dtb/name.pwn" // name player variables
#include "dtb/ip.pwn" // ip adress player variables
#include "dtb/gpci.pwn" // gpci player variables
#include "dtb/geoip.pwn" // GEOIP player variables
#include "dtb/sessiontime.pwn" // get player session time
#include "dtb/adminlevels.pwn" // admin level names
#include "dtb/packetloss.pwn" // packetloss
#include "dtb/skipclass.pwn" // skip class selection

// data
#include "dtb/ac/data.pwn"
#include "dtb/game/data.pwn" // game stuff
#include "dtb/pause.pwn" // pause detection
#include "dtb/spec/data.pwn" // spectate stuff
#include "dtb/map/data.pwn" // set map
#include "dtb/team/data.pwn" // team stuff
#include "dtb/bomb/data.pwn" // bomb stuff
#include "dtb/skinhit/data.pwn" // damage sync
#include "dtb/warzone/data.pwn" // warzone stuff
#include "dtb/wepmenu/data.pwn" // weapon selection
#include "dtb/tptd/data.pwn" // HUD; alive & dead team players
#include "dtb/thtd/data.pwn" // HUD; team current health
#include "dtb/phtd/data.pwn" // HUD; player current health & armour
#include "dtb/sbtd/data.pwn" // HUD; scoreboard at end of rounds
#include "dtb/timetd/data.pwn" // HUD; time left of the round
#include "dtb/antilag/data.pwn" // Monitors fps, ping, packetloss and auto kicks
#include "dtb/hpicon/data.pwn" // damage icon above players head
#include "dtb/pshow/data.pwn" // show & hide player blips
#include "dtb/mission/data.pwn" // mission
#include "dtb/rdata/data.pwn" // round stats; temporary
#include "dtb/level/data.pwn" // xp & levels
#include "dtb/kickban/data.pwn" // kick & ban stuff
#include "dtb/db/data.pwn" // database stuff
#include "dtb/irc/data.pwn" // IRC Echo

// macros
#include "dtb/map/macro/interior.pwn"
#include "dtb/map/macro/name.pwn"
#include "dtb/map/macro/time.pwn"
#include "dtb/map/macro/weather.pwn"
#include "dtb/map/macro/getmap.pwn"

// hooks
#include "dtb/kickban/publickick.pwn"
#include "dtb/kickban/hooks/kick.pwn"
#include "dtb/kickban/hooks/ban.pwn"

#include "dtb/ac/hooks/givemoney.pwn"
#include "dtb/ac/hooks/giveweapon.pwn"
#include "dtb/ac/hooks/jetpack.pwn"
#include "dtb/ac/hooks/resetmoney.pwn"
#include "dtb/ac/hooks/resetweapons.pwn"

// functions
#include "dtb/game/func/startgame.pwn"
#include "dtb/game/func/endgame.pwn"

#include "dtb/team/func/getjointeam.pwn"
#include "dtb/team/func/jointeam.pwn"
#include "dtb/team/func/leaveteam.pwn"
#include "dtb/team/func/teamhealth.pwn"
#include "dtb/team/func/teamplayers.pwn"

#include "dtb/map/func/bombsitepos.pwn"
#include "dtb/map/func/bombsiterot.pwn"
#include "dtb/map/func/center.pwn"
#include "dtb/map/func/limits.pwn"
#include "dtb/map/func/randommap.pwn"
#include "dtb/map/func/setmap.pwn"
#include "dtb/map/func/spawnangle.pwn"
#include "dtb/map/func/spawnpos.pwn"
#include "dtb/map/func/spectatemap.pwn"

#include "dtb/bomb/func/textdraw.pwn"
#include "dtb/bomb/func/icon.pwn"
#include "dtb/bomb/func/siteicon.pwn"
#include "dtb/bomb/func/object.pwn"
#include "dtb/bomb/func/pickup.pwn"
#include "dtb/bomb/func/siteobject.pwn"
#include "dtb/bomb/func/sitepos.pwn"
#include "dtb/bomb/func/defuse.pwn"
#include "dtb/bomb/func/plant.pwn"
#include "dtb/bomb/func/explode.pwn"

#include "dtb/skinhit/func/dmgplayer.pwn"

#include "dtb/warzone/func/inzone.pwn"
#include "dtb/warzone/func/limits.pwn"

#include "dtb/wepmenu/func/hidemenu.pwn"
#include "dtb/wepmenu/func/showmenu.pwn"

#include "dtb/tptd/func/updatetd.pwn"
#include "dtb/thtd/func/updatetd.pwn"

#include "dtb/pstats/func/accuracy.pwn"
#include "dtb/pstats/func/kdratio.pwn"
#include "dtb/pstats/func/wlratio.pwn"
#include "dtb/pstats/func/statsdialog.pwn"

#include "dtb/rdata/func/resetplayer.pwn"

#include "dtb/level/func/givexp.pwn"
#include "dtb/level/func/showtd.pwn"
#include "dtb/level/func/updatetd.pwn"

#include "dtb/mission/func/cam.pwn"
#include "dtb/mission/func/hidetd.pwn"
#include "dtb/mission/func/showtd.pwn"
#include "dtb/mission/func/updatetd.pwn"

#include "dtb/ac/func/repeat.pwn"
#include "dtb/ac/func/armour.pwn"
#include "dtb/ac/func/flood.pwn"
#include "dtb/ac/func/health.pwn"
#include "dtb/ac/func/jetpack.pwn"
#include "dtb/ac/func/money.pwn"
#include "dtb/ac/func/noreload.pwn"
#include "dtb/ac/func/weapons.pwn"
#include "dtb/ac/func/flyhack.pwn"

#include "dtb/db/func/chatlog.pwn"
#include "dtb/db/func/createsession.pwn"
#include "dtb/db/func/deathlog.pwn"
#include "dtb/db/func/loadaccount.pwn"
#include "dtb/db/func/loadsessions.pwn"
#include "dtb/db/func/login.pwn"
#include "dtb/db/func/logindialog.pwn"
#include "dtb/db/func/register.pwn"
#include "dtb/db/func/salt.pwn"
#include "dtb/db/func/saveaccount.pwn"

#include "dtb/lboard/func/dialog.pwn"

#include "dtb/pshow/func/opponents.pwn"
#include "dtb/pshow/func/player.pwn"
#include "dtb/pshow/func/team.pwn"

#include "dtb/hpicon/func/create.pwn"

// OnGamemodeInit
#include "dtb/db/call/init.pwn"
#include "dtb/timetd/call/init.pwn"
#include "dtb/tptd/call/init.pwn"
#include "dtb/thtd/call/init.pwn"
#include "dtb/sbtd/call/init.pwn"
#include "dtb/mission/call/init.pwn"
#include "dtb/game/call/init.pwn"
#include "dtb/irc/call/init.pwn"
#include "dtb/veh/call/init.pwn"

// OnGameModeExit
#include "dtb/db/call/exit.pwn"
#include "dtb/timetd/call/exit.pwn"
#include "dtb/tptd/call/exit.pwn"
#include "dtb/thtd/call/exit.pwn"
#include "dtb/sbtd/call/exit.pwn"
#include "dtb/mission/call/exit.pwn"
#include "dtb/game/call/exit.pwn"
#include "dtb/irc/call/exit.pwn"

// OnSecondPassed
#include "dtb/rdata/call/secpass.pwn"
#include "dtb/team/call/secpass.pwn"
#include "dtb/timetd/call/secpass.pwn"
#include "dtb/bomb/call/secpass.pwn"
#include "dtb/warzone/call/secpass.pwn"
#include "dtb/tptd/call/secpass.pwn"
#include "dtb/thtd/call/secpass.pwn"
#include "dtb/sbtd/call/secpass.pwn"
#include "dtb/mission/call/secpass.pwn"
#include "dtb/game/call/secpass.pwn"

// OnGameStart
#include "dtb/map/call/gamestart.pwn"
#include "dtb/bomb/call/gamestart.pwn"
#include "dtb/warzone/call/gamestart.pwn"
#include "dtb/game/call/gamestart.pwn"
#include "dtb/irc/call/gamestart.pwn"

// OnGameEnd
#include "dtb/map/call/gameend.pwn"
#include "dtb/bomb/call/gameend.pwn"
#include "dtb/wepmenu/call/gameend.pwn"
#include "dtb/tptd/call/gameend.pwn"
#include "dtb/thtd/call/gameend.pwn"
#include "dtb/sbtd/call/gameend.pwn"
#include "dtb/mission/call/gameend.pwn"
#include "dtb/game/call/gameend.pwn"
#include "dtb/level/call/gameend.pwn"
#include "dtb/irc/call/gameend.pwn"
#include "dtb/db/call/gameend.pwn"

// OnBombPlanted
#include "dtb/level/call/plant.pwn"
#include "dtb/mission/call/plant.pwn"
#include "dtb/irc/call/plant.pwn"
#include "dtb/db/call/plant.pwn"

// OnBombDefused
#include "dtb/irc/call/defuse.pwn"
#include "dtb/level/call/defuse.pwn"
#include "dtb/db/call/defuse.pwn"

// OnPlayerConnect
#include "dtb/clearchat.pwn"
#include "dtb/connectmsg.pwn"
#include "dtb/db/call/connect.pwn"
#include "dtb/level/call/connect.pwn"
#include "dtb/bomb/call/connect.pwn"
#include "dtb/warzone/call/connect.pwn"
#include "dtb/wepmenu/call/connect.pwn"
#include "dtb/sbtd/call/connect.pwn"
#include "dtb/antilag/call/connect.pwn"
#include "dtb/irc/call/connect.pwn"
#include "dtb/phtd/call/connect.pwn"

// OnPlayerDisconnect
#include "dtb/ac/call/disconnect.pwn"
#include "dtb/disconnectmsg.pwn"
#include "dtb/kickban/call/disconnect.pwn"
#include "dtb/skinhit/call/disconnect.pwn"
#include "dtb/rdata/call/disconnect.pwn"
#include "dtb/level/call/disconnect.pwn"
#include "dtb/team/call/disconnect.pwn"
#include "dtb/bomb/call/disconnect.pwn"
#include "dtb/warzone/call/disconnect.pwn"
#include "dtb/wepmenu/call/disconnect.pwn"
#include "dtb/sbtd/call/disconnect.pwn"
#include "dtb/antilag/call/disconnect.pwn"
#include "dtb/irc/call/disconnect.pwn"
#include "dtb/phtd/call/disconnect.pwn"
#include "dtb/hpicon/call/disconnect.pwn"
#include "dtb/db/call/disconnect.pwn"

// OnPlayerKicked
#include "dtb/irc/call/kick.pwn"
#include "dtb/db/call/kick.pwn"

// OnPlayerBanned
#include "dtb/irc/call/ban.pwn"
#include "dtb/db/call/ban.pwn"

// OnPlayerHealthSet
#include "dtb/ac/call/healthset.pwn"
#include "dtb/phtd/call/healthset.pwn"
#include "dtb/hpicon/call/healthset.pwn"

// OnPlayerArmourSet
#include "dtb/ac/call/armourset.pwn"
#include "dtb/phtd/call/armourset.pwn"
#include "dtb/hpicon/call/armourset.pwn"

// OnPlayerText
#include "dtb/ac/call/chat.pwn"
#include "dtb/irc/call/chat.pwn"
#include "dtb/db/call/chat.pwn"
#include "dtb/adminchat.pwn"
#include "dtb/teamchat.pwn"

// OnPlayerDeath
#include "dtb/ac/call/death.pwn"
#include "dtb/skinhit/call/death.pwn"
#include "dtb/deathmsg.pwn"
#include "dtb/rdata/call/death.pwn"
#include "dtb/multikill.pwn"
#include "dtb/level/call/death.pwn"
#include "dtb/team/call/death.pwn"
#include "dtb/spec/call/death.pwn"
#include "dtb/irc/call/death.pwn"
#include "dtb/db/call/death.pwn"

// OnPlayerSpawn
#include "dtb/ac/call/spawn.pwn"
#include "dtb/skinhit/call/spawn.pwn"
#include "dtb/level/call/spawn.pwn"
#include "dtb/team/call/spawn.pwn"
#include "dtb/map/call/spawn.pwn"
#include "dtb/bomb/call/spawn.pwn"
#include "dtb/warzone/call/spawn.pwn"
#include "dtb/wepmenu/call/spawn.pwn"
#include "dtb/mission/call/spawn.pwn"
#include "dtb/pshow/call/spawn.pwn"
#include "dtb/db/call/spawn.pwn"

// OnPlayerUpdate
#include "dtb/kickban/call/update.pwn"
#include "dtb/ac/call/update.pwn"
#include "dtb/bomb/call/update.pwn"
#include "dtb/warzone/call/update.pwn"
#include "dtb/spec/call/update.pwn"
#include "dtb/antilag/call/update.pwn"
#include "dtb/pshow/call/update.pwn"
#include "dtb/hpicon/call/update.pwn"
#include "dtb/db/call/update.pwn"
#include "dtb/swim.pwn"

// OnPlayerLeaveTeam
#include "dtb/wepmenu/call/leaveteam.pwn"
#include "dtb/bomb/call/leaveteam.pwn"
#include "dtb/game/call/leaveteam.pwn"

// OnPlayerWeaponShot
#include "dtb/ac/call/wepshot.pwn"
#include "dtb/pshow/call/wepshot.pwn"
#include "dtb/rdata/call/wepshot.pwn"

// OnPlayerGiveDamage
#include "dtb/skinhit/call/givedamage.pwn"

// OnPlayerTakeDamage
#include "dtb/skinhit/call/takedamage.pwn"

// OnPlayerStateChange
#include "dtb/level/call/statechange.pwn"
#include "dtb/spec/call/statechange.pwn"
#include "dtb/phtd/call/statechange.pwn"

// DB Query callbacks
#include "dtb/db/call/accountloaded.pwn"
#include "dtb/db/call/sessionsloaded.pwn"
#include "dtb/db/call/accountcreated.pwn"
#include "dtb/db/call/accountregistered.pwn"
#include "dtb/db/call/akaloaded.pwn"
#include "dtb/db/call/autologin.pwn"
#include "dtb/db/call/banloaded.pwn"
#include "dtb/lboard/call/loaded.pwn"

// OnPlayerMultikill
#include "dtb/irc/call/multikill.pwn"
#include "dtb/db/call/multikill.pwn"

// OnDialogResponse
#include "dtb/lboard/call/dialog.pwn"
#include "dtb/db/call/dialog.pwn"

// OnPlayerClickPlayer
#include "dtb/pstats/call/clickplayer.pwn"

// OnPlayerXPReceived
#include "dtb/rdata/call/xpreceived.pwn"

// OnPlayerKeystateChanged
#include "dtb/bomb/call/keystate.pwn"

// OnPlayerPickupPickup
#include "dtb/bomb/call/pickup.pwn"

// OnPlayerClickPlayerTextDraw
#include "dtb/wepmenu/call/clickptd.pwn"

// OnPlayerClickTextDraw
#include "dtb/wepmenu/call/clicktd.pwn"

// IRC Callbacks
#include "dtb/irc/call/irc.pwn"

// OnPlayerSpectate
#include "dtb/pshow/call/spec.pwn"

// OnPlayerStreamIn
#include "dtb/pshow/call/pstreamin.pwn"

// OnVehicleStreamIn
#include "dtb/veh/call/vstreamin.pwn"

// OnRconLoginAttempt
#include "dtb/rconkick.pwn"

// Commands
#include "dtb/cmd/stats.pwn"
#include "dtb/cmd/register.pwn"
#include "dtb/cmd/aka.pwn"
#include "dtb/cmd/cancelgame.pwn"
#include "dtb/cmd/clearchat.pwn"
#include "dtb/cmd/get.pwn"
#include "dtb/cmd/goto.pwn"
#include "dtb/cmd/ban.pwn"
#include "dtb/cmd/kick.pwn"
#include "dtb/cmd/kill.pwn"
#include "dtb/cmd/pm.pwn"
#include "dtb/cmd/report.pwn"
#include "dtb/cmd/restart.pwn"
#include "dtb/cmd/shutdown.pwn"
#include "dtb/cmd/loadfs.pwn"
#include "dtb/cmd/unloadfs.pwn"
#include "dtb/cmd/reloadfs.pwn"
#include "dtb/cmd/hostname.pwn"
#include "dtb/cmd/password.pwn"
#include "dtb/cmd/setadmin.pwn"
#include "dtb/cmd/getid.pwn"
#include "dtb/cmd/cmds.pwn"
#include "dtb/cmd/leaderboard.pwn"

// IRC Channel Commands
#include "dtb/irc/cmd/cmds.pwn"
#include "dtb/irc/cmd/players.pwn"
#include "dtb/irc/cmd/kick.pwn"
#include "dtb/irc/cmd/ban.pwn"
#include "dtb/irc/cmd/restart.pwn"
#include "dtb/irc/cmd/shutdown.pwn"

/******************************************************************************/

main(){}

public OnGameModeInit()
{
	// Hostname
	SendRconCommand("hostname [DTB] Defend The Bombsite");

	// Gamemode Name
	SetGameModeText("Search and Destroy");

	// "CJ Walk"
	UsePlayerPedAnims();

	// Disable Stunt Cash (do not remove!)
    EnableStuntBonusForAll(0);

	// Disable Door Entries & Exits
	DisableInteriorEnterExits();

	// Streamed Player Markers (do not remove!)
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_STREAMED);

	// Essential class (do not remove!)
	AddPlayerClass(0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);

	// create the custom map "italy" (credits to DarknessLighter, do not remove)
	#include "dtb/map/italy.pwn"
}

public OnGameModeExit()
{
	// destroy custom map
	for(new objectid = 1; objectid <= MAX_OBJECTS; objectid ++)
	{
		if(IsValidObject(objectid))
		    DestroyObject(objectid);
	}
}

public OnPlayerSpawn(playerid)
{
	if(g_PlayerRoundKilled{playerid})
	    return TogglePlayerSpectating(playerid, true), 1;

	// Set Weapon Skills
    SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 998);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 998);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 998);

	// Preload Animations
	PreloadAnimLib(playerid, "OTB");

	// Countdown Freeze
    TogglePlayerControllable(playerid, false);
	return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
	if(ac_CheckPlayerFlooding(playerid))
		return 0;
	else
		return 1;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	if(!success)
	{
		SendClientMessage(playerid, COLOR_RED, "This command is unknown!");
		cmd_cmds(playerid);
	}
	return  1;
}


public OnPlayerUpdate(playerid)
{
	// Only send player updates if the player is not frozen
	return IsPlayerControllable(playerid);
}
