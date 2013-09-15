enableRadio false;
enableSentences false;

waitUntil {!isNil "a3ru_started" && (!isNull (findDisplay 46) || !(alive player))}; // Wait for init

titleText ["", "BLACK IN"];

// Slot reservation check
if (!isNull player && (a3ru_slotReservation == 0)) then {
	[] execVM "a3ru_scripts\cli_slotReservation.sqf";
};

_sg = getNumber (MissionConfigFile >> "A3RU_MissionParams" >> "sundayGames");
if (_sg == 1 && !(a3ru_started) && !(isServer)) then {
	call compile preprocessFileLineNumbers "a3ru_functions\a3ru_sg_intro.sqf";
};

_script = [] execVM "a3ru_scripts\cli_rscInit.sqf";
waitUntil { sleep 0.1; scriptDone _script };

a3ru_UI_array = [];
a3ru_ui_DEH = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call fnc_a3ru_ui_show"];
(findDisplay 46) displayAddEventHandler ["MouseZChanged", 'if ((_this select 1) > 0) then { [] spawn fnc_a3ru_vehiclePlayers }'];

fnc_a3ru_timer = compile preprocessFileLineNumbers "a3ru_functions\a3ru_timer.sqf"; // Timer visualisation

fnc_a3ru_ui_add = compile preprocessFileLineNumbers "a3ru_functions\a3ru_ui_add.sqf";
fnc_a3ru_ui_remove = compile preprocessFileLineNumbers "a3ru_functions\a3ru_ui_remove.sqf";
fnc_a3ru_ui_show = compile preprocessFileLineNumbers "a3ru_functions\a3ru_ui_show.sqf";

fnc_a3ru_end_prepare = compile preprocessFileLineNumbers "a3ru_functions\a3ru_end_prepare.sqf";
fnc_a3ru_pb_visual = compile preprocessFileLineNumbers "a3ru_functions\a3ru_pb_visual.sqf";

fnc_a3ru_vehiclePlayers = compile preprocessFileLineNumbers "a3ru_functions\a3ru_vehiclePlayers.sqf";

fnc_a3ru_pushBoat = compile preprocessFileLineNumbers "a3ru_functions\a3ru_pushBoat.sqf";

fnc_a3ru_FTHUDShow = compile preprocessFileLineNumbers "a3ru_functions\a3ru_FTHUDShow.sqf";

"a3ru_startCount" addPublicVariableEventHandler { a3ru_startCount spawn fnc_a3ru_timer };
fnc_a3ru_started = {
	disableSerialization;
	_ui = uiNamespace getVariable "A3RU_HUD";
	_timer = _ui displayCtrl 1001;
	_timer ctrlSetText "STARTED!!!";
	sleep 5;
	_timer ctrlShow false;
};

"a3ru_zoneCap" addPublicVariableEventHandler { (_this select 1) spawn fnc_a3ru_pb_visual; };

"a3ru_started" addPublicVariableEventHandler { if (_this select 1) then { [] spawn fnc_a3ru_started } };
[] spawn { call compile preprocessFileLineNumbers "a3ru_functions\a3ru_playerTags.sqf" };
[] spawn { call compile preprocessFileLineNumbers "a3ru_equipment\init_equipment.sqf"; };
player setVariable ["PlayerName", name player, true];

call compile preprocessFileLineNumbers "a3ru_scripts\cli_actions.sqf";

call compile preprocessFileLineNumbers "a3ru_client_scripts.sqf";