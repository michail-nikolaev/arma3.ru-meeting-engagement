_fnc_a3ru_logo_rsc = {
	disableSerialization;
	titleRsc ["a3ru_sg_logo", "PLAIN", 0];

	_display = uiNamespace getVariable "a3ru_sg_logo";

	_c1 = _display displayCtrl 1100;
	_c2 = _display displayCtrl 1101;
	_c3 = _display displayCtrl 1102;
	_c1Pos = ctrlPosition _c1;
	_c2Pos = ctrlPosition _c2;
	_c3Pos = ctrlPosition _c3;
	_c1 ctrlSetPosition [safeZoneX - 0.5, (_c1Pos select 1) + 0.5];
	_c2 ctrlSetPosition [safeZoneX - 0.5, _c2Pos select 1];
	_c3 ctrlSetPosition [safeZoneX - 0.5, (_c3Pos select 1)];
	_c1 ctrlSetStructuredText parseText format["<t align='center' size='1.2' color='#ffe92e'>Mission: %1</t>", localize "STR_A3RU_MissionName"];
	_c1 ctrlCommit 0;
	_c2 ctrlSetStructuredText parseText format["<t align='center' size='1.2' color='#ffe92e'>Author: %1</t>", localize "STR_A3RU_MissionAuthor"];
	_c2 ctrlCommit 0;
	_c3 ctrlSetStructuredText parseText format["<t align='left' size='2.5'>Atrium v%1</t>", getNumber (MissionConfigFile >> "atrium_version")];
	_c3 ctrlCommit 0;
	
	sleep 1.5;
	
	_c1 ctrlSetPosition _c1Pos;
	_c1 ctrlCommit 1;
	sleep 0.3;

	_c2 ctrlSetPosition _c2Pos;
	_c2 ctrlCommit 1;
	sleep 0.3;

	_c3 ctrlSetPosition _c3Pos;
	_c3 ctrlSetScale 1;
	_c3 ctrlCommit 4;
};

_playerPos = getPosATL player;
_startPos = _playerPos;

playMusic "Track07_ActionDark";
[] spawn { sleep 111; 5 fadeMusic 1 };

_height = 50;
_flyTime = 3;
_startPos SET [2, (_startPos select 2) + (_height / 2)];

_camera = "camera" camCreate _startPos;
_camera cameraEffect ["EXTERNAL", "BACK"];

[] spawn _fnc_a3ru_logo_rsc;

_tpos = [(_startPos select 0) + 5, (_startPos select 1), (_startPos select 2) + 5];
_cpos = _startPos;
_camera camPrepareTarget _tpos;
_camera camPreparePos _cpos;
_camera camPrepareFOV 0.700;
_camera camCommitPrepared _flyTime;
WaitUntil {camCommitted _camera};

_tpos = player;
_cpos = [_startPos select 0, (_startPos select 1) - (_height / 4), _startPos select 2];
_camera camPrepareTarget _tpos;
_camera camPreparePos _cpos;
_camera camPrepareFOV 0.700;
_camera camCommitPrepared _flyTime * 2;
WaitUntil {camCommitted _camera};

_tpos = player;
_cpos = [(_startPos select 0) - (_height / 4), (_startPos select 1) - (_height / 4), _startPos select 2];
_camera camPrepareTarget _tpos;
_camera camPreparePos _cpos;
_camera camPrepareFOV 0.700;
_camera camCommitPrepared _flyTime;
WaitUntil {camCommitted _camera};

_tpos = player;
_cpos = [(_startPos select 0) - (_height / 4), (_startPos select 1), (_startPos select 2)];
_camera camPrepareTarget _tpos;
_camera camPreparePos _cpos;
_camera camPrepareFOV 0.700;
_camera camCommitPrepared _flyTime;
WaitUntil {camCommitted _camera};

_cpos = [(_startPos select 0) - (_height / 2), (_startPos select 1) + (_height / 4), (_startPos select 2) / 2];
_camera camPrepareTarget player;
_camera camPreparePos _cpos;
_camera camPrepareFOV 0.700;
_camera camCommitPrepared _flyTime;
WaitUntil {camCommitted _camera};

_flyTime fadeMusic 0;

_cpos = [getPos player select 0, getPos player select 1, (getPos player select 2) + 1.5];
_camera camPrepareTarget player;
_camera camPreparePos _cpos;
_camera camPrepareFOV 0.700;
_camera camCommitPrepared _flyTime;
WaitUntil {camCommitted _camera};

player cameraEffect ["terminate","back"];
camDestroy _camera;