// End mission when units are dead in zone
// Usage: [Pos or Marker or Object, Area size, Area Name, Array of Units, Minimum number of units or 0 if everyone should be in zone] spawn fnc_a3ru_endMissionDeadInZone;
// Example: ["mark_port", 0, "West Port", [vip1, vip2], 1] spawn fnc_a3ru_endMissionDeadInZone;
// Example: [[1520, 1321, 5], 150, "West Port", [vip1], 0] spawn fnc_a3ru_endMissionDeadInZone;

private ["_BFSide", "_OFSide", "_zone", "_area", "_area_name", "_units", "_unitsInZone", "_winSide", "_zonePos", "_inZone", "_action", "_name"];

_BFSide = call compile (getText (MissionConfigFile >> "A3RU_MissionParams" >> "blueforSide"));
_OFSide = call compile (getText (MissionConfigFile >> "A3RU_MissionParams" >> "opforSide"));

_zone = _this select 0;
_area = _this select 1; 
_area_name = _this select 2;
_units = _this select 3;
_unitsInZone = _this select 4;

if (_unitsInZone == 0) then { _unitsInZone = (count _units) };
switch (side (_units select 0)) do {
	case _BFSide: { _winSide = _OFSide };
	case _OFSide: { _winSide = _BFSide };
	default { _winSide = CIVILIAN };
};

switch toLower(typeName _zone) do {
	case "array": { _zonePos = _zone };
	case "string": { _zonePos = getMarkerPos _zone };
	case "object": { _zonePos = getPos _zone };
	default { hintC "[fnc_a3ru_endMissionDeadInZone] Wrong zone parameter!" };
};

if (_area == 0 && typeName _zone == "STRING") then {
	_area = (getMarkerSize _zone) select 0;
};

while {true} do {
	_inZone = 0;
	{
		if (isNull _x) then {
			_units = _units - [_x];
		} else {
			_remove = false;
			if (_x distance _zonePos > _area) then {
				_name = name _x;
				if (_name == "Error: No unit") then { _name = "VIP" };
				[format["%1 has left mission zone!", _name], 1] call fnc_a3ru_message;
				_remove = true;
			};
			if !(alive _x) then {
				_name = name _x;
				if (_name == "Error: No unit") then { _name = "VIP" };
				[format["%1 is dead!", _name], 3] call fnc_a3ru_message;
				_remove = true;
			};
			if (_remove) then {
				_units = _units - [_x];
			} else {
				_inZone = _inZone + 1;
			};
		};
	} forEach _units;
	if (_inZone < _unitsInZone) exitWith {
		[format["VIP targets has been killed on %1!", _area_name], _winSide] call fnc_a3ru_endMission;
	};
	sleep 5.863;
};