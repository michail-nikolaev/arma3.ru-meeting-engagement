_vehicleFreeze = getArray (MissionConfigFile >> "A3RU_MissionParams" >> "prepareVehicleFreeze");
_frozenVehicles = [];

{
	_vehSide = getText (configFile >> "CfgVehicles" >> typeOf _x >> "faction");
	if (_vehSide in _vehicleFreeze) then {
		if (_x isKindOf "StaticWeapon") then {
			_x lock 2;
		} else {
			_pos = getPos _x;
			_dir = getDir _x;
			_vectorUp = vectorUp _x;
			_obj = "Land_HelipadEmpty_F" createVehicle _pos;
			_obj setDir _dir;
			_obj setVectorUp _vectorUp;
			_x setVariable ["AttachObj", _obj, true];
			_x attachTo [_obj];
		};
		_frozenVehicles SET [count _frozenVehicles, _x];
	};
} forEach vehicles;

waitUntil { sleep 0.5; a3ru_started };
{
	if (_x isKindOf "StaticWeapon") then {
		_x lock 0;
	} else {
		[_x,"fnc_a3ru_detach"] spawn BIS_fnc_MP;
	};
} forEach _frozenVehicles;