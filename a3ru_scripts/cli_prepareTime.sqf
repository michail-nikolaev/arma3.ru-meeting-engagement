if (isNil "a3ru_started") then {
	a3ru_started = false;
};

fnc_a3ru_vehMark = {
	private ["_array", "_marker", "_name"];
	
	if (isNil "a3ru_markersVehiclesArray") then {
		"a3ru_markersVehiclesArray" addPublicVariableEventHandler { [] spawn fnc_a3ru_vehMark };
	} else {
		if (isNil "a3ru_brief_vehArray") then {
			if !(a3ru_started) then {
				a3ru_brief_vehArray = [];
				switch (side player) do {
					case WEST: { _array = a3ru_markersVehiclesArray select 0 };
					case EAST: { _array = a3ru_markersVehiclesArray select 1 };
					case INDEPENDENT: { _array = a3ru_markersVehiclesArray select 2 };
				};
				{
					_marker = str(_x select 1);
					createMarkerLocal[_marker, _x select 0];
					_marker setMarkerShapeLocal "ICON";
					_marker setMarkerTypeLocal "mil_dot";
					_name = getText (configFile >> "CfgVehicles" >> (typeOf (_x select 1)) >> "displayName");
					_marker setMarkerTextLocal _name;
					_marker setMarkerColorLocal "ColorYellow";
					a3ru_brief_vehArray SET [count a3ru_brief_vehArray, _marker];
				} forEach _array;
			};
		} else {
			{ deleteMarkerLocal _x } forEach a3ru_brief_vehArray;
			a3ru_brief_vehArray = nil;
		};
	};
};

fnc_a3ru_markGroups = {
	private ["_array", "_marker"];
	
	if (isNil "a3ru_markersArray") then {
		"a3ru_markersArray" addPublicVariableEventHandler { [] spawn fnc_a3ru_markGroups };
	} else {
		if (isNil "a3ru_briefGroupsArray") then {
			if !(a3ru_started) then {
				a3ru_briefGroupsArray = [];
				switch (side player) do {
					case WEST: { _array = a3ru_markersArray select 0 };
					case EAST: { _array = a3ru_markersArray select 1 };
					case INDEPENDENT: { _array = a3ru_markersArray select 2 };
				};
				{
					_marker = str(_x select 1);
					createMarkerLocal[_marker, _x select 0];
					_marker setMarkerShapeLocal "ICON";
					_marker setMarkerTypeLocal "mil_dot";
					_marker setMarkerTextLocal _marker;
					_marker setMarkerColorLocal "ColorOrange";
					a3ru_briefGroupsArray SET [count a3ru_briefGroupsArray, _marker];
				} forEach _array;
			};
		} else {
			{ deleteMarkerLocal _x } forEach a3ru_briefGroupsArray;
			a3ru_briefGroupsArray = nil;
		};
	};
};

if !(a3ru_started) then {
	_firedEHIndex = player addEventHandler ["fired", {deleteVehicle (_this select 6)}];
	_startPos = player getVariable ["StartPos", nil];
	if (isNil "_startPos") then {
		_startPos = getPos player;
		player setVariable ["StartPos", _startPos];
	};
	_markerSize = getNumber (MissionConfigFile >> "A3RU_MissionParams" >> "prepareZoneSize");
	_marker = "prepareZone";
	createMarkerLocal[_marker, _startPos];
	_marker setMarkerSizeLocal [_markerSize, _markerSize];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerTypeLocal "EMPTY";
	_marker setMarkerColorLocal "ColorGreen";
	
	[] spawn fnc_a3ru_vehMark;
	[] spawn fnc_a3ru_markGroups;

	while {alive player && !a3ru_started} do {
		_distance = player distance _startPos;
		if (_distance >= (_markerSize + 20)) then {
			if (vehicle player != player) then {
				moveOut player;
			};
			player setPos _startPos;
			_distance = player distance _startPos;
			titleText ["You were teleported back to the spawn zone!\nPlease wait for countdown timer", "PLAIN"];
		};
		if (_distance >= _markerSize) then {
			titleText ["You are leaving startup zone!\nBack off immediately!", "PLAIN"];
		};
		sleep 1;
	};
	deleteMarkerLocal _marker;
	
	[] spawn fnc_a3ru_vehMark;
	[] spawn fnc_a3ru_markGroups;
	player removeEventHandler ["fired", _firedEHIndex];
};