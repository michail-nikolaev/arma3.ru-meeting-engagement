a3ru_markersArray = [];
a3ru_markersVehiclesArray = [];

private ["_zoneSize", "_westGroups", "_eastGroups", "_guerGroups", "_westVehicles", "_eastVehicles", "_guerVehicles", "_a3ru_units", "_pos", "_group", "_vehicles", "_veh", "_vehPos"];

_zoneSize = getNumber (MissionConfigFile >> "A3RU_MissionParams" >> "prepareZoneSize");

_westGroups = [];
_eastGroups = [];
_guerGroups = [];

_westVehicles = [];
_eastVehicles = [];
_guerVehicles = [];

if (isDedicated) then {
	_a3ru_units = playableUnits
} else {
	_a3ru_units = allUnits
};

{
	if (leader _x == _x) then {
		_pos = getPos _x;
		_group = group _x;
		if !(isNull _group) then {
			switch (side _x) do {
				case WEST: {
					_westGroups SET [count _westGroups, [_pos, _group]];
					_vehicles = _pos nearEntities [["LandVehicle", "Air", "Ship"], _zoneSize];
					for "_i" from 0 to (count _vehicles) do {
						_veh = _vehicles select _i;
						if !(_veh in _westVehicles) then {
							_vehPos = getPos _veh;
							_westVehicles SET [count _westVehicles, [_vehPos, _veh]];
						};
					};
				};
				case EAST: {
					_eastGroups SET [count _eastGroups, [_pos, _group]];
					_vehicles = _pos nearEntities [["LandVehicle", "Air", "Ship"], _zoneSize];
					for "_i" from 0 to (count _vehicles) do {
						_veh = _vehicles select _i;
						if !(_veh in _eastVehicles) then {
							_vehPos = getPos _veh;
							_eastVehicles SET [count _eastVehicles, [_vehPos, _veh]];
						};
					};
				};
				case INDEPENDENT: {
					_guerGroups SET [count _guerGroups, [_pos, _group]];
					_vehicles = _pos nearEntities [["LandVehicle", "Air", "Ship"], _zoneSize];
					for "_i" from 0 to (count _vehicles) do {
						_veh = _vehicles select _i;
						if !(_veh in _guerVehicles) then {
							_vehPos = getPos _veh;
							_guerVehicles SET [count _guerVehicles, [_vehPos, _veh]];
						};
					};
				};
			};
		};
	};
} forEach _a3ru_units;

a3ru_markersArray = [_westGroups, _eastGroups, _guerGroups];
a3ru_markersVehiclesArray = [_westVehicles, _eastVehicles, _guerVehicles];

publicVariable "a3ru_markersArray";
publicVariable "a3ru_markersVehiclesArray";