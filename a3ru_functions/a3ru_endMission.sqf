// fnc_a3ru_endMission
_this spawn {
	if (!isNil "a3ru_missionFinished") exitWith {};
	a3ru_missionFinished = true;
	if (typeName _this == "STRING") then { // Old Atrium version End Mission fix
		_this = [_this];
	};
	[_this select 0, 2] call fnc_a3ru_message;
	sleep 3;
	if (count _this > 1) then {
		a3ru_endMission = _this select 1;
		publicVariable "a3ru_endMission";
		if (!isDedicated) then {
			if (side player == _this select 1) then {
				["end5",true,true] call BIS_fnc_endMission;
			} else {
				["end5",false,true] call BIS_fnc_endMission;
			};
		};
	} else {
		a3ru_endMission = "true";
		publicVariable "a3ru_endMission";
		if (!isDedicated) then {
			["end5",true,true] call BIS_fnc_endMission;
		};
	};
};