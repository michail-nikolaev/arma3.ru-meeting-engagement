// Combat losses
private ["_A3RU_lossUnits", "_BFSide", "_OFSide", "_BFLoss", "_OFLoss", "_sideSupremacy", "_BFStart", "_OFStart", "_BFCount", "_OFCount"];
_BFSide = call compile (getText (MissionConfigFile >> "A3RU_MissionParams" >> "blueforSide"));
_OFSide = call compile (getText (MissionConfigFile >> "A3RU_MissionParams" >> "opforSide"));
_BFLoss = getNumber (MissionConfigFile >> "A3RU_MissionParams" >> "BFLoss");
_OFLoss = getNumber (MissionConfigFile >> "A3RU_MissionParams" >> "OFLoss");
_sideSupremacy = getNumber (MissionConfigFile >> "A3RU_MissionParams" >> "sideSupremacy");


if (isDedicated) then {	_A3RU_lossUnits = playableUnits } else { _A3RU_lossUnits = allUnits };
_BFstart = {(alive _x) && (side _x == _BFSide)} count _A3RU_lossUnits;
_OFstart = {(alive _x) && (side _x == _OFSide)} count _A3RU_lossUnits;

while {true} do {
	if (isDedicated) then {	_A3RU_lossUnits = playableUnits } else { _A3RU_lossUnits = allUnits };
	_BFCount = {(alive _x) && (side _x == _BFSide)} count _A3RU_lossUnits;
	_OFCount = {(alive _x) && (side _x == _OFSide)} count _A3RU_lossUnits;
	if ((_OFCount * _sideSupremacy < _BFCount) || (_OFCount < _OFstart / 100 * _OFLoss)) exitWith {
		[format["%1 had heavy losses. %2 WIN.", _OFSide, _BFSide], _BFSide] call fnc_a3ru_endMission;
	};

	if ((_BFCount * _sideSupremacy < _OFCount) || (_BFCount < _BFstart / 100 * _BFLoss)) exitWith {
		[format["%1 had heavy losses. %2 WIN.", _BFSide, _OFSide], _OFSide] call fnc_a3ru_endMission;
	};
	sleep 7.326;
};