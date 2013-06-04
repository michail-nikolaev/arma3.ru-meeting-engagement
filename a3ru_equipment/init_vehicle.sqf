// Vehicle cargo
if !(isServer) exitWith {};

_veh = _this select 0;
_side = _this select 1;
_template = _this select 2;

[_veh, _template] call compile preprocessFileLineNumbers format["a3ru_equipment\vehicles_%1.sqf", _side];