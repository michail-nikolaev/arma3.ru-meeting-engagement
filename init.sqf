// ARMA3.RU Mission Template
enableSaving [false, false];
//titleText ["Loading...", "BLACK"];

if (!isDedicated) then { waitUntil {player == player} };

// PreInit
if (isClass(configFile >> "A3RU_PreInit_EventHandlers")) then	{
	_a3ru_count = count (configFile >> "A3RU_PreInit_EventHandlers");
	if (_a3ru_count > 0) then {
		for "_i" from 0 to (_a3ru_count - 1) do {
			_configEntry = (configFile >> "A3RU_PreInit_EventHandlers") select _i;
			if (isServer) then {
				_serverInit = _configEntry / "serverInit";
				if (isText _serverInit) then {
					call compile(getText _serverInit);
				};
			};
			if !(isDedicated) then {
				_clientInit = _configEntry / "clientInit";
				if (isText _clientInit) then {
					call compile(getText _clientInit);
				};
			};
		};
	};
};

if (isServer) then {
	[] execVM "a3ru_scripts\srv_briefMarkers.sqf";
};

if (!isDedicated) then {
	//[] execVM "a3ru_scripts\spectator\specta_init.sqf";
	[] execVM "a3ru_scripts\briefing.sqf";
	[] execVM "a3ru_scripts\cli_prepareTime.sqf";
	"a3ru_broadCast" addPublicVariableEventHandler { (_this select 1) call fnc_a3ru_getMessage };
};

"a3ru_endMission" addPublicVariableEventHandler {
	_this = _this select 1;
	if (typeName _this == "STRING") then {
		["end5",true,true] spawn BIS_fnc_endMission
	} else {
		if (side player == _this) then {
			["end5",true,true] spawn BIS_fnc_endMission
		} else {
			["end5",false,true] spawn BIS_fnc_endMission
		};
	};
};

fnc_a3ru_getMessage = compile preprocessFileLineNumbers "a3ru_functions\a3ru_getMessage.sqf"; // Get message function
fnc_a3ru_detach = {
	if (local _this) then {
		_pos = getPos _this;
		detach _this;
		_this setPos _pos;
		_this setVelocity [0, 0, 0];
		_obj = _this getVariable ["AttachObj", objNull];
		if (!isNull _obj) then {
			deleteVehicle _obj;
		};
	};
}; // Detach vehicles

fnc_a3ru_message = compile preprocessFileLineNumbers "a3ru_functions\a3ru_message.sqf";
// fnc_a3ru_message
// Syntax: [Message, TypeOf Message, Side]
// Message - your message
// TypeOf Message can be 0, 1, 2 or 3.
// 0 - displays Successfully completed task
// 1 - Failed task
// 2 - Assigned task
// 3 - Canceled task
// More info on BIKI: http://community.bistudio.com/wiki/Notification
// Side - side which receive this message. If no side is specified - everyone will receive the message
// For example:
// ["Victory!", 0, EAST] call fnc_a3ru_message;
// ["VIP is dead!", 1] call fnc_a3ru_message;

fnc_a3ru_endMission = compile preprocessFileLineNumbers "a3ru_functions\a3ru_endMission.sqf";
// fnc_a3ru_endMission - ends current mission
// Syntax: [message, win side] or [message]
// Usage: [MESSAGE, EAST] call fnc_a3ru_endMission;
// Example: ["All Iranian Troops were killed", WEST] call fnc_a3ru_endMission;

_script = [] execVM "a3ru_scripts\setMissionParams.sqf";
waitUntil { scriptDone _script };

if (isServer) then { if (a3ru_slotReservation == 0) then { _script = [] execVM "a3ru_scripts\srv_slotReservation.sqf" } };

// PostInit
waitUntil {time > 0};

if (isClass(configFile >> "A3RU_PostInit_EventHandlers")) then	{
	_a3ru_count = count (configFile >> "A3RU_PostInit_EventHandlers");
	if (_a3ru_count > 0) then {
		for "_i" from 0 to (_a3ru_count - 1) do {
			_configEntry = (configFile >> "A3RU_PostInit_EventHandlers") select _i;
			if (isServer) then {
				_serverInit = _configEntry / "serverInit";
				if (isText _serverInit) then {
					call compile(getText _serverInit);
				};
			};
			if !(isDedicated) then {
				_clientInit = _configEntry / "clientInit";
				if (isText _clientInit) then {
					call compile(getText _clientInit);
				};
			};
		};
	};
};

// Server
if (isServer) then {
	[] execVM "a3ru_scripts\postInit_server.sqf";
};

// Client
if (!isDedicated) then {
	[] execVM "a3ru_scripts\postInit_client.sqf";
};