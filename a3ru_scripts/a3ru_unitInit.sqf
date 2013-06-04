_unit = _this select 0;
_unitSide = _this select 1;
_unitEquip = _this select 2;

_unit allowFleeing 0;
_unit disableAI "AUTOTARGET";
_unit disableAI "ANIM";
_unit disableAI "FSM";
_unit disableAI "MOVE";
_unit disableAI "PATHPLAN";
_unit doWatch objNull;
_unit setVariable ["BIS_noCoreConversations", false];

removeAllWeapons _unit;
removeBackpack _unit;

_unit setVariable ["a3ru_equipment", [_unitSide, _unitEquip], true];