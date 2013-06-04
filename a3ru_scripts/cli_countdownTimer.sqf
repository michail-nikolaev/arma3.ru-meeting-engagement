disableSerialization;
_ui = uiNamespace getVariable "A3RU_HUD";
_timer = _ui displayCtrl 1001;
_timer ctrlShow true;
_timer ctrlSetBackgroundColor [if (side player == WEST) then {0} else {1}, 0, if (side player == WEST) then {1} else {0}, 0.3];
waitUntil {!isNil "a3ru_startCount"};

_countStarted = diag_tickTime;
_ctrlBackIter = 0;
a3ru_timerCorrection = false;

while {a3ru_startCount > 0 && !a3ru_started} do {
	if !(isServer) then {
		if (a3ru_timerCorrection) then {
			a3ru_timerCorrection = false;
			_countStarted = diag_tickTime;
		};
		a3ru_startCount = a3ru_startCount - diag_tickTime + _countStarted;
	};
	_minutes = floor (a3ru_startCount / 60);
	_seconds = floor (a3ru_startCount mod 60);
	if (a3ru_startCount < 0) then
	{
		_minutes = 0;
		_seconds = 0;
	};
	if (a3ru_startCount < 15) then {
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
_timer ctrlSetText "STARTED!!!";
sleep 5;
_timer ctrlShow false;