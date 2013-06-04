// Message Broadcast

if (count _this > 2) then {
	a3ru_broadCast = [_this select 0, _this select 1, _this select 2];
	if (!isDedicated) then { [_this select 0, _this select 1, _this select 2] call fnc_a3ru_getMessage };
} else {
	a3ru_broadCast = [_this select 0, _this select 1];
	if (!isDedicated) then { [_this select 0, _this select 1] call fnc_a3ru_getMessage };
};
publicVariable "a3ru_broadCast";