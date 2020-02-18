#include <YSI\y_hooks>
#include <YSI\y_timers>
#include <actor_plus>

enum {
	DIALOG_WHORE,
}

static 
		WhoreActor;

hook OnGameModeInit()
{
	WhoreActor = CreateActor(63, 1861.4631,-1352.4708,13.5450,92.3789); //kreiranje kurve
	return Y_HOOKS_CONTINUE_RETURN_1;
}	

CMD:whore(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 2.0, 1861.4631,-1352.4708,13.5450))
		return SendClientMessage(playerid, -1, "Must be next to the whore");
	ShowPlayerDialog(playerid, DIALOG_WHORE, DIALOG_STYLE_LIST, "Whore sistem", "Kiss\nBlow Job\nSexy Dance", "Continue", "Exit");
	return Y_HOOKS_CONTINUE_RETURN_1;
} 

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid) {
		case DIALOG_WHORE: {
			if(!response) return 1;
			switch(listitem) {
				case 0: SendClientMessage(playerid, -1, "You paid the whore a kiss !"), TogglePlayerControllable(playerid, 0), AP_ApplyActorAnimation(WhoreActor,"KISSING","Playa_Kiss_01",4.1,0,1,1,1,1), defer firstTimer(playerid);
				case 1: SendClientMessage(playerid, -1, "You paid the whore a blow job!"), TogglePlayerControllable(playerid, 0), AP_ApplyActorAnimation(WhoreActor,"BLOWJOBZ","BJ_COUCH_LOOP_W",4.0,1,1,1,1,0), defer secondTimer(playerid);
				case 2: SendClientMessage(playerid, -1, "You paid the whore a sexy dance!"), TogglePlayerControllable(playerid, 0), AP_ApplyActorAnimation(WhoreActor,"STRIP","strip_E",4.1,1,1,1,1,1), defer thirdTimer(playerid);
			}
		}
	}
	return Y_HOOKS_CONTINUE_RETURN_1;
}	

timer firstTimer[5000](playerid) {
	TogglePlayerControllable(playerid, 1);
	ClearActorAnimations(WhoreActor);
	SendClientMessage(playerid, -1, "The kiss that lasted ended five second!");
	GivePlayerMoney(playerid, -2000);
	return 1;
}

timer secondTimer[4000](playerid) {
	TogglePlayerControllable(playerid, 1);
	ClearActorAnimations(WhoreActor);
	SendClientMessage(playerid, -1, "The whore ended up suck for four seconds, the fuck better the second time!");
	GivePlayerMoney(playerid, -1000);
	return 1;
}

timer thirdTimer[3000](playerid) {
	TogglePlayerControllable(playerid, 1);
	ClearActorAnimations(WhoreActor);
	SendClientMessage(playerid, -1, "The dance that lasted ended sexy dance!");
	GivePlayerMoney(playerid, -2000);
	return 1;
}


