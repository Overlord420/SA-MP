// NAPOMENA: OVO NIJE FS, VEC MODUL!
// NARAVNO OVAJ MODUL PRILAGODITE VASOJ SKRIPTI!
// Stavite tamo gde gde se cuvaju podaci od igracu kao sto su sifra, email itd - pPrljavNovac - i stavite da se cuva!
#include <YSI_Coding\y_hooks>

static
	skupljadrogu[MAX_PLAYERS],
	PlayerText:DrugTDS[MAX_PLAYERS];

hook OnPlayerConnect(playerid) {

	DrugTDS[playerid] = CreatePlayerTextDraw(playerid, 573.924011, 341.083374, "+drug");
	PlayerTextDrawLetterSize(playerid, DrugTDS[playerid], 0.311449, 1.226666);
	PlayerTextDrawAlignment(playerid, DrugTDS[playerid], 1);
	PlayerTextDrawColor(playerid, DrugTDS[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DrugTDS[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, DrugTDS[playerid], 255);
	PlayerTextDrawFont(playerid, DrugTDS[playerid], 2);
	PlayerTextDrawSetProportional(playerid, DrugTDS[playerid], 1);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {

	skupljadrogu[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)	{

	if(newkeys & KEY_NO) {
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, 2506.7070,-1115.4467,56.5926)) {
	    	if(skupljadrogu[playerid] == 0) {
	    		ac_TogglePlayerControllable(playerid, false);
	    		SCM(playerid, -1, "Krenuo si da skupljas drogu! Ako zelis da prestanes pritisni opet N!");
	    		skupljadrogu[playerid] = 1;
	    		defer SakupljanjeDroge(playerid, 1);
	    	}
	    	else {
	    		ac_TogglePlayerControllable(playerid, true);
	    		SCM(playerid, -1, "Prekinuo si sakupljanje droge!");
	    		PlayerTextDrawHide(playerid, DrugTDS[playerid]);
	    		skupljadrogu[playerid] = 0;
	    		stop SakupljanjeDroge(playerid, 1);
	    	}	
	    }
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, 921.7196,-1287.5466,14.4063)) {
	    	if(prodajedrogu[playerid] == 0) {
	    		if(e_ACCOUNT_INFO[playerid][pDroga] <= 0) 
	    			return SCM(playerid, -1, "Nemas droge kod sebe!");
	    		ac_TogglePlayerControllable(playerid, false);
	    		SCM(playerid, -1, "Krenuo si sa prodajom droge! Ako zelis da prestanes pritisni opet N!");
	    		prodajedrogu[playerid] = 1;
	    		defer SakupljanjeDroge(playerid, 3);
	    	}
	    	else {
	    		ac_TogglePlayerControllable(playerid, true);
	    		SCM(playerid, -1, "Prekinuo si prodaju droge!");
	    		prodajedrogu[playerid] = 0;
	    		stop SakupljanjeDroge(playerid, 3);
	    	}
	    }
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, 725.3523,-1276.1157,13.6484)) {
	    	if(e_ACCOUNT_INFO[playerid][pPrljavNovac] == 0)
	    		return SCM(playerid, -1, "Nemas prljavog novca kod sebe!");
	    	SCM(playerid, -1, "Sacekajte 5 sekundi da bi oprali prljav novac!");
	    	ac_TogglePlayerControllable(playerid, false);
	    	defer SakupljanjeDroge(playerid, 4);
	    }
    }
	return 1;
}

timer SakupljanjeDroge[5000](playerid, opcion) {

	if(opcion == 1) {
		if(skupljadrogu[playerid] == 1) {
			defer SakupljanjeDroge(playerid, 1);
			defer SakupljanjeDroge[3000](playerid, 2);
			++ e_ACCOUNT_INFO[playerid][pDroga];
			PlayerTextDrawShow(playerid, DrugTDS[playerid]);
		}
	}
	if(opcion == 2) {
		PlayerTextDrawHide(playerid, DrugTDS[playerid]);
	}
	if(opcion == 3) {
		if(prodajedrogu[playerid] == 1) {
			defer SakupljanjeDroge(playerid, 3);
			defer SakupljanjeDroge[2000](playerid, 2);
			-- e_ACCOUNT_INFO[playerid][pDroga];
			PlayerTextDrawSetString(playerid, DrugTDS[playerid], "- drug");
			PlayerTextDrawShow(playerid, DrugTDS[playerid]);
			g_PrljavNovacPlus(playerid, 200);
			if(e_ACCOUNT_INFO[playerid][pDroga] == 0) {
				SCM(playerid, -1, "Nemas vise droge!");
				prodajedrogu[playerid] = 0;
				ac_TogglePlayerControllable(playerid, true);
				stop SakupljanjeDroge(playerid, 3);
				PlayerTextDrawHide(playerid, DrugTDS[playerid]);
			}
		}
	}
	if(opcion == 4)	{
		new 
			prljavnovac = e_ACCOUNT_INFO[playerid][pPrljavNovac]/2;
		g_NovacPlus(playerid, prljavnovac);
		e_ACCOUNT_INFO[playerid][pPrljavNovac] = 0;
		ac_TogglePlayerControllable(playerid, true);
		SCM(playerid, -1, "Uspesno ste oprali novac!");
		SavePlayer(playerid);
	}
	return 1;
}
