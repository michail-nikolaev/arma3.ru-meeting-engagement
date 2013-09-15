// Counter function

disableSerialization;
_ui = uiNamespace getVariable "A3RU_HUD";
_timer = _ui displayCtrl 1001;
_timer ctrlShow true;
_timer ctrlSetBackgroundColor [if (side player == WEST) then {0} else {1}, 0, if (side player == WEST) then {1} else {0}, 0.3];

_time1 = _this;

if (isNil "a3ru_timerCorr") then { a3ru_timerCorr = false } else { a3ru_timerCorr = true };;

waitUntil { sleep 0.01; !a3ru_timerCorr };

_a3ru_startTime = diag_tickTime;
_ctrlBackIter = 0;

while { !a3ru_started } do {
	if (a3ru_timerCorr) exitWith { a3ru_timerCorr = false };
	_time = _time1 - diag_tickTime + _a3ru_startTime;
	if (_time <= 0) exitWith {};
	
	_minutes = floor (_time / 60);
	_seconds = floor (_time mod 60);
	if (_time < 0) then
	{
		_minutes = 0;
		_seconds = 0;
	};
	if (_time < 10) then {
		if (_ctrlBackIter == 0) then {
			_timer ctrlSetBackgroundColor [1, 0, 0, 0.3];
			_ctrlBackIter = 1;
		} else {
			_timer ctrlSetBackgroundColor [0, 0, 1, 0.3];
			_ctrlBackIter = 0;
		};
	};
	_timer ctrlSetText format["Prepare %1:%2%3", _minutes, floor (_seconds / 10), floor (_seconds mod 10)];
	sleep 1;
};