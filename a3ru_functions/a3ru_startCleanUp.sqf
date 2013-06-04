// Server bots cleanup

{
	_slotName = _x getVariable ["PlayerName", nil];
	if (isNil "_slotName") then {
		deleteVehicle _x;
	};
} forEach playableUnits;