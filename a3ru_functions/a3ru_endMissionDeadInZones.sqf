// fnc_a3ru_endMissionDeadInZones
// Checks if units are alive or in zones area. Mission ends if everyone has been killed or left the zones
// [
//   [MARKER1/POS1/OBJ1, SIZE1, OBJECT1],
//   [MARKER2/POS2/OBJ2, SIZE2, OBJECT2]
// ] spawn fnc_a3ru_endMissionDeadInZones
// Example: [["mark_1", 0, vip1], ["mark_2", 0, vip2], ["mark_3", 0, vip3]] spawn fnc_a3ru_endMissionDeadInZones;

private ["_winSide", "_array", "_checkArray"];
_array = _this;
_checkArray = [];

{
	private ["_zone", "_zoneSize", "_unit", "_unitsInZone", "_zonePos"];
	_zone = _x select 0;
	_zoneSize = _x select 1;
	_unit = _x select 2;
	
	switch toLower(typeName _zone) do {
		case "array": { _zonePos = _zone };
		case "string": { _zonePos = getMarkerPos _zone };
		case "object": { _zonePos = getPos _zone };
		default { hintC "[fnc_a3ru_endMissionDeadInZone] Wrong zone parameter!" };
	};
	
	if (_zoneSize == 0 && typeName _zone == "STRING") then {
		_zoneSize = (getMarkerSize _zone) select 0;
	};
	
	switch (side _unit) do {
		case WEST: { _winSide = EAST };
		case EAST: { _winSide = WEST };
		default { _winSide = CIVILIAN };
	};
	
	_checkArray SET [count _checkArray, [_zonePos, _zoneSize, _unit, false]];

} forEach _array;

while {true} do {
	_standingZones = 0;
	{
		private ["_zonePos", "_zoneSize", "_unit", "_failed", "_name", "_remove"];
		_zonePos = _x select 0;
		_zoneSize = _x select 1;
		_unit = _x select 2;
		_failed = _x select 3;
		_remove = false;
		
		if (!(isNull _unit) && !(_failed)) then {
			if (_unit distance _zonePos > _zoneSize) then {
				_name = name _unit;
				if (_name == "Error: No unit") then { _name = "VIP" };
				[format["%1 has left mission zone!", _name], 1] call fnc_a3ru_message;
				_remove = true;
			};
			if !(alive _unit) then {
				_name = name _unit;
				if (_name == "Error: No unit") then { _name = "VIP" };
				[format["%1 is dead!", _name], 3] call fnc_a3ru_message;
				_remove = true;
			};
			if (_remove) then {
				_checkArray SET [_forEachIndex, [_zonePos, _zoneSize, _unit, true]];
			} else {
				_standingZones = _standingZones + 1;
			};
		};
	} forEach _checkArray;
	
	if (_standingZones == 0) exitWith {
		["All VIP targets has been killed!", _winSide] call fnc_a3ru_endMission;
	};
	sleep 5.863;
};