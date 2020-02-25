/* NAPOMINJEM
	xMisija1 i ostalo definisite u vasoj skripti..
	Takodje prilagodite modul vasoj skripti..*/

#include  <YSI_Coding\y_hooks>
#include  <YSI_Coding\y_va>
#include  <YSI_Coding\y_timers>

static 
		OtvaranjeTdova[MAX_PLAYERS char],
		ActorPrvaMisija[MAX_PLAYERS char],
		ActorUbijanje[MAX_PLAYERS char],
		ActorUbijanje1[MAX_PLAYERS char],
		MisijaBroj1[MAX_PLAYERS char],
		MisijaBroj2[MAX_PLAYERS char],
		MisijaBroj3[MAX_PLAYERS char],
		MisijaBroj4[MAX_PLAYERS char],
		MisijaBroj5[MAX_PLAYERS char],
		MisijaBroj6[MAX_PLAYERS char],
		MisijaBroj7[MAX_PLAYERS char],
		MisijaBroj8[MAX_PLAYERS char],
		//checkpointi
		bool:CP1[MAX_PLAYERS char],
		bool:CP2[MAX_PLAYERS char],
		bool:CP3[MAX_PLAYERS char],
		bool:CP4[MAX_PLAYERS char],
		bool:CP5[MAX_PLAYERS char],
		bool:CP6[MAX_PLAYERS char],
		bool:CP7[MAX_PLAYERS char],
		bool:CP8[MAX_PLAYERS char],
		VoziloTransport[MAX_PLAYERS char],
		VoziloUnistenje[MAX_PLAYERS char],
		VoziloOruzje[MAX_PLAYERS char],
		//za mission respec
		MissionRespect[MAX_PLAYERS char],
		MissionRespect1[MAX_PLAYERS char],
		//textdraws
		PlayerText:MisijaTexDraw[MAX_PLAYERS char][11];

enum {
	OBJECT_SLOT_KUTIJA,
}	

hook OnGameModeInit()
{
	//kreirati actore
	CreateDynamicActor(289,1977.4031,-1362.1610,23.9250,271.6468,0,100.0,0,0);
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerConnect(playerid)
{
	OtvaranjeTdova{playerid} =
	MissionRespect{playerid} =
	MissionRespect1{playerid} =
	MisijaBroj1{playerid} =
	MisijaBroj2{playerid} =
	MisijaBroj3{playerid} =
	MisijaBroj4{playerid} =
	MisijaBroj5{playerid} =
	PlayerInfo[playerid][xMisija1] =
	PlayerInfo[playerid][xMisija2] = 
	PlayerInfo[playerid][xMisija3] = 
	PlayerInfo[playerid][xMisija4] = 
	PlayerInfo[playerid][xMisija5] = 0;	
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerDeath(playerid)
{
	OtvaranjeTdova{playerid} = 
	MissionRespect{playerid} = 
	MissionRespect1{playerid} = 
	MisijaBroj1{playerid} = 
	MisijaBroj2{playerid} = 
	MisijaBroj3{playerid} = 
	MisijaBroj4{playerid} = 
	MisijaBroj5{playerid} = 0;
	DisablePlayerCheckpoint(playerid);
	DestroyActor(ActorPrvaMisija{playerid});
	DestroyVehicle(VoziloTransport{playerid});
	DestroyVehicle(VoziloUnistenje{playerid});
	DestroyActor(ActorUbijanje{playerid});
	DestroyActor(ActorUbijanje1{playerid});	
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	OtvaranjeTdova{playerid} = 
	MissionRespect{playerid} = 
	MissionRespect1{playerid} =
	MisijaBroj1{playerid} =
	MisijaBroj2{playerid} =
	MisijaBroj3{playerid} =
	MisijaBroj4{playerid} =
	MisijaBroj5{playerid} = 0;
	DestroyVehicle(VoziloTransport{playerid});	
	DestroyVehicle(VoziloUnistenje{playerid});
	DisablePlayerCheckpoint(playerid);
	DestroyActor(ActorPrvaMisija{playerid});
	DestroyActor(ActorUbijanje{playerid});
	DestroyActor(ActorUbijanje1{playerid});		
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerClickPlayerTextDraw(playerid,PlayerText:playertextid) {
	if(playertextid == MisijaTexDraw[playerid][2]) {
		if(PlayerInfo[playerid][xMisija1] == 5) return SendClientMessage(playerid, -1, "Ovu misiju ste vec uradili maximalan broj puta(5).");
		if(MisijaBroj1{playerid} == 0 && MisijaBroj2{playerid} == 0 && MisijaBroj3{playerid} == 0 && MisijaBroj4{playerid} == 0 && MisijaBroj5{playerid} == 0 && MisijaBroj6[playerid] == 0 && MisijaBroj7[playerid] == 0 && MisijaBroj8[playerid] == 0) {	
			MisijaBroj1{playerid} = 1;
			OtvaranjeTdova{playerid} = 0;
			MisijaCreatePlayerTextDraw(playerid, false);
			CancelSelectTextDraw(playerid);
			va_SendClientMessage(playerid, -1, "%s-e krenuli ste prenos droge, idite do CheckPointa, a dalje cete biti obavesteni kada dodjete na CP!", ImeIgraca(playerid));
			DisablePlayerCheckpoint(playerid);
			Ivan_SetPlayerCheckPoint(playerid, 2896.4783,-2133.9797,3.2695,2.0);
			ActorPrvaMisija{playerid} = CreateActor(294, 2896.4783,-2133.9797,3.2695,98.9174); 
			CP1{playerid} = 
			CP2{playerid} = true;
		}	
		else return SendClientMessage(playerid, -1, "Vec radite neku misiju!");
	}
	if(playertextid == MisijaTexDraw[playerid][3]) {
		if(PlayerInfo[playerid][xMisija2] == 5) return SendClientMessage(playerid, -1, "Ovu misiju ste vec uradili maximalan broj puta(5).");
		if(MisijaBroj1{playerid} == 0 && MisijaBroj2{playerid} == 0 && MisijaBroj3{playerid} == 0 && MisijaBroj4{playerid} == 0 && MisijaBroj5{playerid} == 0 && MisijaBroj6[playerid] == 0 && MisijaBroj7[playerid] == 0 && MisijaBroj8[playerid] == 0) {
			MisijaBroj2{playerid} = 1;
			OtvaranjeTdova{playerid} = 0;
			MisijaCreatePlayerTextDraw(playerid, false);
			CancelSelectTextDraw(playerid);
			va_SendClientMessage(playerid, -1, "%s-e krenuli ste sa ilegalnim prevozom vozila, sledeca uputstva dobicete kada dodjete na zadatu lokaciju!", ImeIgraca(playerid));
			DisablePlayerCheckpoint(playerid);
			Ivan_SetPlayerCheckPoint(playerid, 2023.4419,-1483.0132,10.8281,2.0);
			VoziloTransport{playerid} = Ivan_CreateVehicle(-1,-1,-1,-1,-1,560,2023.4419,-1483.0132,10.8281,90.0,1,1,-1);
			LinkVehicleToInterior(VoziloTransport{playerid},GetPlayerInterior(playerid));
	        SetVehicleVirtualWorld(VoziloTransport{playerid},GetPlayerVirtualWorld(playerid));
			vCanDrive[VoziloTransport{playerid}] = 1;
		    Fuel[VoziloTransport{playerid}] = 100;
			ResetVehicleStatistics(VoziloTransport{playerid});
			Ivan_SetVehicleHealth(VoziloTransport{playerid},1000.0);
			CP3{playerid} = 
			CP4{playerid} = true;
		}
		else return SendClientMessage(playerid, -1, "Vec radite neku misiju!");
	}	
	if(playertextid == MisijaTexDraw[playerid][4]) {
		if(PlayerInfo[playerid][xMisija3] == 5) return SendClientMessage(playerid, -1, "Ovu misiju ste vec uradili maximalan broj puta(5).");
		if(MisijaBroj1{playerid} == 0 && MisijaBroj2{playerid} == 0 && MisijaBroj3{playerid} == 0 && MisijaBroj4{playerid} == 0 && MisijaBroj5{playerid} == 0 && MisijaBroj6[playerid] == 0 && MisijaBroj7[playerid] == 0 && MisijaBroj8[playerid] == 0) {
			MisijaBroj3{playerid} = 1;
			OtvaranjeTdova{playerid} = 0;
			MisijaCreatePlayerTextDraw(playerid, false);
			CancelSelectTextDraw(playerid);
			va_SendClientMessage(playerid, -1, "%s-e morate raniti 2 civila, idite do markera imamo dojavu da se tu nalaze, kada stignete do markera dobicete oruzje!", ImeIgraca(playerid));
			DisablePlayerCheckpoint(playerid);
			Ivan_SetPlayerCheckPoint(playerid, 1089.5032,-769.3005,108.7004,2.0);
			ActorUbijanje{playerid} = CreateActor(60,1082.9077,-766.0682,108.2871,6.4206); SetActorHealth(ActorUbijanje{playerid}, 999); SetActorInvulnerable(ActorUbijanje{playerid}, false);
			ActorUbijanje1{playerid} = CreateActor(65, 1082.8481,-763.8093,108.0572,188.0279); SetActorHealth(ActorUbijanje1{playerid}, 999); SetActorInvulnerable(ActorUbijanje1{playerid}, false);
			CP5{playerid} = true;
		}
		else return SendClientMessage(playerid, -1, "Vec radite neku misiju!");	
	}
	if(playertextid == MisijaTexDraw[playerid][5]) {
		if(PlayerInfo[playerid][xMisija4] == 5) return SendClientMessage(playerid, -1, "Ovu misiju ste vec uradili maximalan broj puta(5).");
		if(MisijaBroj1{playerid} == 0 && MisijaBroj2{playerid} == 0 && MisijaBroj3{playerid} == 0 && MisijaBroj4{playerid} == 0 && MisijaBroj5{playerid} == 0 && MisijaBroj6[playerid] == 0 && MisijaBroj7[playerid] == 0 && MisijaBroj8[playerid] == 0) {
			MisijaBroj4{playerid} = 1;
			OtvaranjeTdova{playerid} = 0;
			MisijaCreatePlayerTextDraw(playerid, false);
			CancelSelectTextDraw(playerid);
			va_SendClientMessage(playerid, -1, "%s-e morate postaviti dinamit na automobil, lokacija oznacena na mapi!", ImeIgraca(playerid));
			DisablePlayerCheckpoint(playerid);
			Ivan_SetPlayerCheckPoint(playerid, 1490.7350,-491.2720,54.3898,2.0);
			VoziloUnistenje{playerid} = Ivan_CreateVehicle(-1,-1,-1,-1,-1,411,1490.7350,-491.2720,54.3898,90.0,1,1,-1);
			CP6{playerid} = true;
		}
		else return SendClientMessage(playerid, -1, "Vec radite neku misiju!");		
	}
	if(playertextid == MisijaTexDraw[playerid][6]) {
		if(PlayerInfo[playerid][xMisija5] == 5) return SendClientMessage(playerid, -1, "Ovu misiju ste vec uradili maximalan broj puta(5).");
		if(MisijaBroj1{playerid} == 0 && MisijaBroj2{playerid} == 0 && MisijaBroj3{playerid} == 0 && MisijaBroj4{playerid} == 0 && MisijaBroj5{playerid} == 0 && MisijaBroj6[playerid] == 0 && MisijaBroj7[playerid] == 0 && MisijaBroj8[playerid] == 0) {
			MisijaBroj5{playerid} = 1;
			OtvaranjeTdova{playerid} = 0;
			MisijaCreatePlayerTextDraw(playerid, false);
			CancelSelectTextDraw(playerid);
			va_SendClientMessage(playerid, -1, "%s-e krenuli ste transport oruzja. Idite do CP-a i utovarite kutiju u kombi!", ImeIgraca(playerid));
			VoziloOruzje{playerid} = Ivan_CreateVehicle(-1,-1,-1,-1,-1,413,1984.3978,-1362.5410,23.7592,179.5910,1,1,-1);
			LinkVehicleToInterior(VoziloOruzje{playerid},GetPlayerInterior(playerid));
	        SetVehicleVirtualWorld(VoziloOruzje{playerid},GetPlayerVirtualWorld(playerid));
			vCanDrive[VoziloOruzje{playerid}] = 1;
		    Fuel[VoziloOruzje{playerid}] = 100;
			ResetVehicleStatistics(VoziloOruzje{playerid});
			Ivan_SetVehicleHealth(VoziloOruzje{playerid},1000.0);
			Ivan_PutPlayerInVehicle(playerid, VoziloOruzje{playerid}, 0);
			DisablePlayerCheckpoint(playerid);
			Ivan_SetPlayerCheckPoint(playerid, 411.85373, -1729.24756, 8.58842, 2.0);
			CP7{playerid} = true;
		}
		else return SendClientMessage(playerid, -1, "Vec radite neku misiju!");		
	}	
	return Y_HOOKS_CONTINUE_RETURN_1;
}	

hook OnPlayerEnterCheckpoint(playerid) {

	if(CP1{playerid}) {
		SendClientMessage(playerid, -1, "Gospodine, dobili ste 30g droge, odnesite je na mesto odakle ste krenuli misiju!");
		DisablePlayerCheckpoint(playerid);
		Ivan_SetPlayerCheckPoint(playerid, 1977.4031,-1362.1610,23.9250,2.0);
		DestroyActor(ActorPrvaMisija{playerid});
		CP1{playerid} = false;
	}
	else if(CP2{playerid}) {	
		SendClientMessage(playerid, -1, "Uspesno ste odradili turu, dobili ste po 3 grama marihuane i kokaina!");
		PlayerInfo[playerid][xMarihuana] += 3;
		PlayerInfo[playerid][xKokain] += 3;
		DisablePlayerCheckpoint(playerid);
		++ PlayerInfo[playerid][xMisija1];
		SavePlayer(playerid);
		MissionRespect{playerid} = 
		MissionRespect1{playerid} = 1;
		defer Pilav(playerid);
		CP2{playerid} = false;
	}
	//kraj prve
	else if(CP3{playerid}) {
		SendClientMessage(playerid, -1, "Gospodine, odvezite ovaj auto na odredjenu lokaciju kada zavrsite dobicete odredjeni profit!");
		DisablePlayerCheckpoint(playerid);
		Ivan_SetPlayerCheckPoint(playerid, 644.4578,-1867.6359,4.9842,2.0);
		CP3{playerid} = false;	
	}
	else if(CP4{playerid}) {
		SendClientMessage(playerid, -1, "Uspesno ste prevezli automobil na zadatu lokaciju dobili ste 30.000$.");
		DisablePlayerCheckpoint(playerid);
		DajIgracuNovac(playerid, 30000);
		DestroyVehicle(VoziloTransport{playerid});
		++ PlayerInfo[playerid][xMisija2];
		SavePlayer(playerid);
		MissionRespect{playerid} =
		MissionRespect1{playerid} = 1;
		defer Pilav(playerid);
		CP4{playerid} = false;
	}
	//kraj druge
	else if(CP5{playerid}) {
		SendClientMessage(playerid, -1, "Dobili ste oruzje, sada ranite oba Aktora!");
		GiveWeaponToPlayer(playerid, 23, 3);
		DisablePlayerCheckpoint(playerid);
		++ PlayerInfo[playerid][xMisija3];
		SavePlayer(playerid);
		new pilavv = random(1000);
		SetPlayerVirtualWorld(playerid, pilavv);
		SetActorVirtualWorld(ActorUbijanje{playerid}, pilavv); SetActorVirtualWorld(ActorUbijanje1{playerid}, pilavv);
		CP5{playerid} = false;
	}
	//kraj trece	
	else if(CP6{playerid}) {
		SendClientMessage(playerid, -1, "Sada postavljate dinamit, koji ce puci za 5 sekundi!");
		DisablePlayerCheckpoint(playerid);
		++ PlayerInfo[playerid][xMisija4];
		SavePlayer(playerid);
		ApplyAnimation(playerid,"BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
		defer TimerPostavljenje(playerid);
		CP6{playerid} = false;
	}
	//kraj cetvrte
	else if(CP7{playerid}) {
		if(!IsPlayerInVehicle(playerid, VoziloOruzje{playerid})) {
			SendClientMessage(playerid, -1, "Sada pritisnite levi klik misa kako biste uzeli oruzje!");
			CP7{playerid} = false;
		}	
	}
	else if(CP8{playerid}) {
		SendClientMessage(playerid, -1, "Uspesno ste predali oruzje! Dobili ste Deser Eagle i M4!");
		GiveWeaponToPlayer(playerid, 31, 100);
		GiveWeaponToPlayer(playerid, 24, 100);
		DisablePlayerCheckpoint(playerid);
		++ PlayerInfo[playerid][xMisija5];
		SavePlayer(playerid);
		MissionRespect{playerid} =
		MissionRespect1{playerid} = 1;
		defer Pilav(playerid);
		DestroyVehicle(VoziloOruzje{playerid});
		CP8{playerid} = false;
	}	
	return Y_HOOKS_CONTINUE_RETURN_1;
}	

timer TimerPostavljenje[1000](playerid) {
	ClearAnimations(playerid);
	defer TimerPucanje(playerid);
	return 1;
}
timer TimerPucanje[5000](playerid) {
	DestroyVehicle(VoziloUnistenje{playerid});
	CreateExplosion(1490.7350,-491.2720,54.3898,4,2);
	DajIgracuNovac(playerid, 20000);
	MissionRespect{playerid} =
	MissionRespect1{playerid} = 1;
	defer Pilav(playerid);
	return 1;
}

timer Pilav[1000](playerid) {
	if(MissionRespect{playerid} == 1 && MissionRespect1{playerid} == 1) {
		GameTextForPlayer(playerid,"~g~MISSION PASSED",3000,3);
		MissionRespect{playerid} =
		MissionRespect1{playerid} =
		MisijaBroj1{playerid} =
		MisijaBroj2{playerid} =
		MisijaBroj3{playerid} =
		MisijaBroj4{playerid} =
		MisijaBroj5{playerid} = 0;
		SetPlayerVirtualWorld(playerid, 0);
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if(newkeys == KEY_FIRE) {
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 411.85373, -1729.24756, 8.58842)) {
			if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
				if(MisijaBroj5{playerid} == 1) {
					SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
					SetPlayerAttachedObject(playerid,OBJECT_SLOT_KUTIJA,2358,1,0.15,0.4,0.0,0.0,90.0,0.0,1.0,1.0,1.0);
					MisijaBroj5{playerid} = 2;
					DisablePlayerCheckpoint(playerid);
				}
			}
		}		
		else if(MisijaBroj5{playerid} == 2) {
			if(IsPlayerInRangeOfVehicle(playerid, VoziloOruzje{playerid}, 4.0)) {
				RemovePlayerAttachedObject(playerid,OBJECT_SLOT_KUTIJA);
				SendClientMessage(playerid, -1, "Sada idite do glavnom Aktora i predajte mu oruzje!");
				Ivan_SetPlayerCheckPoint(playerid, 1977.4031,-1362.1610,23.9250,2.0);
				SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
				CP8{playerid} = true;

			}	
		}		
	}	
	return Y_HOOKS_CONTINUE_RETURN_1;
}

stock IsPlayerInRangeOfVehicle(playerid, vehicleid, Float:Range)
{
    new Float:pozzx, Float:pozzy, Float:pozzz;
    GetVehiclePos(vehicleid, pozzx, pozzy, pozzz);
    return IsPlayerInRangeOfPoint(playerid, Range, pozzx, pozzy, pozzz);
}

public OnPlayerMakeDamageToActor(playerid, damaged_actorid, Float:amount, weaponid, bodypart, bool:death, bool:IsDynamicActor) {
	if(damaged_actorid == ActorUbijanje{playerid} && IsValidActor(ActorUbijanje{playerid})) {
		if(GetPlayerWeapon(playerid) == 0 && GetPlayerAmmo(playerid) == 0) return SendClientMessage(playerid, -1, "Morate raniti aktora oruzjem!");
		if(MisijaBroj3{playerid} == 1) {
			SendClientMessage(playerid, -1, "Uspesno ste ranili aktora, i uzeli mu 30.000$, od toga 10.000$ ide tvom sefu!");
			DajIgracuNovac(playerid, 20000);
			SavePlayer(playerid);
			DestroyActor(ActorUbijanje{playerid});
			MissionRespect{playerid} = 1;
			defer Pilav(playerid);
		}
	}	
	if(damaged_actorid == ActorUbijanje1{playerid} && IsValidActor(ActorUbijanje1{playerid})) {
		if(GetPlayerWeapon(playerid) == 0 && GetPlayerAmmo(playerid) == 0) return SendClientMessage(playerid, -1, "Morate raniti aktora oruzjem!");
		if(MisijaBroj3{playerid} == 1) {
			SendClientMessage(playerid, -1, "Uspesno ste ranili aktora, i uzeli mu 30.000$, od toga 10.000$ ide tvom sefu!");
			DajIgracuNovac(playerid, 20000);
			SavePlayer(playerid);
			DestroyActor(ActorUbijanje1{playerid});
			MissionRespect1{playerid} = 1;
			defer Pilav(playerid);
		}
	}	
	return 1;
}

CMD:misije(playerid, params[]) {
	if(IsPlayerInRangeOfPoint(playerid, 1.0,1977.4031,-1362.1610,23.9250)) {
		//if(GetFactionType(playerid) != ORG_TIP_MAFIJA && GetFactionType(playerid) != ORG_TIP_BANDA) 
			//return SendClientMessage(playerid, -1, "Ovu komandu mogu samo koristiti Bande/Mafije.");
		if(OtvaranjeTdova{playerid} == 0) {
			MisijaCreatePlayerTextDraw(playerid, true);
			SelectTextDraw(playerid, 0xFFFFFFFF);
			OtvaranjeTdova{playerid} = 1;
		}
		else if(OtvaranjeTdova{playerid} == 1) {
			MisijaCreatePlayerTextDraw(playerid, false);
			CancelSelectTextDraw(playerid);
			MisijaBroj1{playerid} = 
			MisijaBroj2{playerid} = 
			MisijaBroj3{playerid} = 
			MisijaBroj4{playerid} = 
			MisijaBroj5{playerid} = 
			MisijaBroj6[playerid] = 
			MisijaBroj7[playerid] = 
			MisijaBroj8[playerid] = 
			OtvaranjeTdova{playerid} = 0;	
		}
	}			
	return 1;
}		

stock MisijaCreatePlayerTextDraw(playerid, bool:show) {
	if(show == true) {	
		MisijaTexDraw[playerid][0] = CreatePlayerTextDraw(playerid, 276.881774, 173.666717, "box");
		PlayerTextDrawLetterSize(playerid, MisijaTexDraw[playerid][0], 0.000000, 12.483160);
		PlayerTextDrawTextSize(playerid, MisijaTexDraw[playerid][0], 354.000000, 0.000000);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][0], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][0], -1);
		PlayerTextDrawUseBox(playerid, MisijaTexDraw[playerid][0], 1);
		PlayerTextDrawBoxColor(playerid, MisijaTexDraw[playerid][0], 255);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][0], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][0], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][0], 1);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][0], 1);

		MisijaTexDraw[playerid][1] = CreatePlayerTextDraw(playerid, 288.594177, 167.250030, "misije_sistem");
		PlayerTextDrawLetterSize(playerid, MisijaTexDraw[playerid][1], 0.183073, 0.847499);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][1], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][1], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][1], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][1], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][1], 2);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][1], 1);

		MisijaTexDraw[playerid][2] = CreatePlayerTextDraw(playerid, 282.503540, 189.416671, "misija_1");
		PlayerTextDrawLetterSize(playerid, MisijaTexDraw[playerid][2], 0.173234, 0.754166);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][2], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][2], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][2], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][2], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][2], 2);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][2], 1);
		PlayerTextDrawSetSelectable(playerid, MisijaTexDraw[playerid][2], true);

		MisijaTexDraw[playerid][3] = CreatePlayerTextDraw(playerid, 282.335021, 197.017135, "misija_2");
		PlayerTextDrawLetterSize(playerid, MisijaTexDraw[playerid][3], 0.173234, 0.754166);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][3], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][3], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][3], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][3], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][3], 2);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][3], 1);
		PlayerTextDrawSetSelectable(playerid, MisijaTexDraw[playerid][3], true);

		MisijaTexDraw[playerid][4] = CreatePlayerTextDraw(playerid, 282.335021, 204.617599, "misija_3");
		PlayerTextDrawLetterSize(playerid, MisijaTexDraw[playerid][4], 0.173234, 0.754166);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][4], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][4], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][4], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][4], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][4], 2);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][4], 1);
		PlayerTextDrawSetSelectable(playerid, MisijaTexDraw[playerid][4], true);

		MisijaTexDraw[playerid][5] = CreatePlayerTextDraw(playerid, 282.335021, 212.618087, "misija_4");
		PlayerTextDrawLetterSize(playerid, MisijaTexDraw[playerid][5], 0.173234, 0.754166);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][5], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][5], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][5], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][5], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][5], 2);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][5], 1);
		PlayerTextDrawSetSelectable(playerid, MisijaTexDraw[playerid][5], true);

		MisijaTexDraw[playerid][6] = CreatePlayerTextDraw(playerid, 282.335021, 220.418563, "misija_5");
		PlayerTextDrawLetterSize(playerid, MisijaTexDraw[playerid][6], 0.173234, 0.754166);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][6], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][6], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][6], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][6], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][6], 2);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][6], 1);
		PlayerTextDrawSetSelectable(playerid, MisijaTexDraw[playerid][6], true);

		MisijaTexDraw[playerid][7] = CreatePlayerTextDraw(playerid, 275.307525, 182.947952, "LD_SPAC:white");
		PlayerTextDrawTextSize(playerid, MisijaTexDraw[playerid][7], -0.620000, 91.000000);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][7], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][7], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][7], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][7], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][7], 4);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][7], 0);

		MisijaTexDraw[playerid][8] = CreatePlayerTextDraw(playerid, 355.912445, 182.947952, "LD_SPAC:white");
		PlayerTextDrawTextSize(playerid, MisijaTexDraw[playerid][8], -0.620000, 91.000000);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][8], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][8], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][8], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][8], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][8], 4);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][8], 0);

		MisijaTexDraw[playerid][9] = CreatePlayerTextDraw(playerid, 277.200500, 281.531311, "LD_SPAC:white");
		PlayerTextDrawTextSize(playerid, MisijaTexDraw[playerid][9], 2.869955, 3.529999);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][9], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][9], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][9], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][9], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][9], 4);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][9], 0);

		MisijaTexDraw[playerid][10] = CreatePlayerTextDraw(playerid, 350.773498, 281.531311, "LD_SPAC:white");
		PlayerTextDrawTextSize(playerid, MisijaTexDraw[playerid][10], 2.869955, 3.529999);
		PlayerTextDrawAlignment(playerid, MisijaTexDraw[playerid][10], 1);
		PlayerTextDrawColor(playerid, MisijaTexDraw[playerid][10], -1);
		PlayerTextDrawSetShadow(playerid, MisijaTexDraw[playerid][10], 0);
		PlayerTextDrawBackgroundColor(playerid, MisijaTexDraw[playerid][10], 255);
		PlayerTextDrawFont(playerid, MisijaTexDraw[playerid][10], 4);
		PlayerTextDrawSetProportional(playerid, MisijaTexDraw[playerid][10], 0);

		for(new i = 0; i < 11; i++) { PlayerTextDrawShow(playerid, MisijaTexDraw[playerid][i]); }
	}
	else if(show == false) {
		for(new i = 0; i < 11; i++) { PlayerTextDrawDestroy(playerid, MisijaTexDraw[playerid][i]); }	
		CancelSelectTextDraw(playerid);
	}	
	return 1;
}
