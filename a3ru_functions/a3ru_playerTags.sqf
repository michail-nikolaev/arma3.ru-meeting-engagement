if (a3ru_tags == 0) then {
	disableSerialization;

	_ui = uiNamespace getVariable "A3RU_HUD";
	_playerTag = _ui displayCtrl 1002;

	while {alive player} do {
		_object = cursorTarget;
		if !(isNull _object) then {
			if ((_object in playableUnits) && (side _object == side player) && (player distance _object <= 20) && (_object != player)) then {
				_playerTag ctrlShow true;
				if (isPlayer _object) then {
					_playerTag ctrlSetStructuredText parseText format["<img image='\a3\ui_f\data\gui\Rsc\RscDisplayMultiplayerSetup\disabledai_ca.paa' /> %1", name _object];
				} else {
					_playerTag ctrlSetStructuredText parseText format["<img image='\a3\ui_f\data\gui\Rsc\RscDisplayMultiplayerSetup\enabledai_ca.paa' /> %1", name _object];
				};
			} else {
				_playerTag ctrlShow false;
			};
		} else {
			_playerTag ctrlShow false;
		};
		sleep 1.021;
	};
};