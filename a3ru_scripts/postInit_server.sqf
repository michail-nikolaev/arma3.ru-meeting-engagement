// Server postInit

// Functions
fnc_a3ru_endMissionTimer = compile preProcessFileLineNumbers "a3ru_functions\a3ru_endMissionTimer.sqf";
_fnc_a3ru_srv_cleanUp = compile preprocessFileLineNumbers "a3ru_functions\a3ru_startCleanUp.sqf";
_fnc_a3ru_srv_combatLosses = compile preprocessFileLineNumbers "a3ru_functions\a3ru_combat_losses.sqf";
fnc_a3ru_endMissionCountUnits = compile preprocessFileLineNumbers "a3ru_functions\a3ru_endMissionCountUnits.sqf";
fnc_a3ru_endMissionCapture = compile preprocessFileLineNumbers "a3ru_functions\a3ru_endMissionCapture.sqf";
fnc_a3ru_endMissionDeadInZone = compile preprocessFileLineNumbers "a3ru_functions\a3ru_endMissionDeadInZone.sqf";

_a3ru_countDown = {
	_prepareTime = a3ru_preTime;
	a3ru_startCount = _prepareTime;
	publicVariable "a3ru_startCount";
	_countStart = diag_tickTime;
	_countSync = 0;
	while {!a3ru_started} do {
		a3ru_startCount = _prepareTime - diag_tickTime + _countStart;
		if (a3ru_startCount <= 0) exitWith {
			a3ru_started = true;
			publicVariable "a3ru_started";
			if (!isDedicated) then {
				[] spawn fnc_a3ru_started
			};
		};
		if (_countSync > 9) then {
			_countSync = 0;
			publicVariable "a3ru_startCount";
			if (!isDedicated) then {
				a3ru_startCount spawn fnc_a3ru_timer
			};
		};
		_countSync = _countSync + 1;
		sleep 1;
	};
};

a3ru_started = false;
publicVariable "a3ru_started";
[] spawn _a3ru_countDown;

[] execVM "a3ru_scripts\srv_vehicle_freeze.sqf";

waitUntil { sleep 0.512; a3ru_started };
call _fnc_a3ru_srv_cleanUp;
[] spawn _fnc_a3ru_srv_combatLosses;
call compile preprocessFileLineNumbers "a3ru_server_scripts.sqf";