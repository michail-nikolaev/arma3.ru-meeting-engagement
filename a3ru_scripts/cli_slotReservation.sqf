fnc_cli_res_startCount = {
	private "_time";
	_time = 180;
	sleep _time;
	//if (isServer) then {
		//[1, player, getPlayerUID player, name player] spawn fnc_srv_checkSlot
	//} else {
		a3ru_srv_reservedSlot = [1, player, getPlayerUID player, name player];
		publicVariableServer "a3ru_srv_reservedSlot";
	//};
};

fnc_cli_res_checkSlot = {
	private "_action";
	_action = _this select 0;
	switch (_action) do {
		case 0: { // Not found
			[] call fnc_cli_res_startCount;
		};
		case 1: { // Match
			
		};
		case 2: { // Dismatch
			titleText [format["Этот слот уже занят игроком %1!", _this select 1], "BLACK OUT"];
			hint format["Этот слот уже занят игроком %1!", _this select 1];
			sleep 10;
			["loser",false,0] call BIS_fnc_endMission;
		};
		case 3: { // Set
			titleText ["Теперь этот слот зарезервирован на вас!\nВы не сможете занять другие до рестарта миссии", "PLAIN DOWN"];
			hint "Теперь этот слот зарезервирован на вас!\nВы не сможете занять другие до рестарта миссии";
		};
		case 4: { // Present
			titleText [format["За вами уже закреплен слот: %1!", _this select 1], "BLACK OUT"];
			hint format["За вами уже закреплен слот: %1!", _this select 1];
			sleep 10;
			["loser",false,2] call BIS_fnc_endMission;
		};
	};
};

"a3ru_cli_reservedSlot" addPublicVariableEventHandler { (_this select 1) spawn fnc_cli_res_checkSlot };

//if (isServer) then {
	//[0, player, getPlayerUID player, name player] spawn fnc_srv_checkSlot
//} else {
	a3ru_srv_reservedSlot = [0, player, getPlayerUID player, name player];
	publicVariableServer "a3ru_srv_reservedSlot";
//};