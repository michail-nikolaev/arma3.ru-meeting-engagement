if !(alive player) exitWith {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", a3ru_ui_DEH]
};

_a3ru_actionKey = 221; // Правая клавиша вызова контекстного меню WINDOWS
if (isClass (configFile >> "a3ru_keys")) then {
	_a3ru_actionKey = getNumber (configFile >> "a3ru_common_keys" >> "a3ru_keys" >> "a3ru_actionMenu" >> "key")
};

_handled = false;
if (_this select 1 == _a3ru_actionKey) then {
	if (!dialog) then {
		createDialog "A3RU_POPUP_UI";
		_display = uiNamespace getVariable "A3RU_POPUP_UI";
		_controls = [1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 1710];
		_selectedCtrl = 0;
		
		{ ctrlShow [_x, false] } forEach _controls;
		if (count a3ru_UI_array == 0) then {
			ctrlShow [1702, true];
			ctrlEnable [1702, false];
			ctrlSetText [1702, "No actions"];
		};
		{
			if (_selectedCtrl > 8) exitWith {};
			_ctrl = _controls select _selectedCtrl;
			
			_UI_text = _x select 0;
			_UI_args = _x select 1;
			_UI_func = _x select 2;
			_UI_requ = _x select 3;
			if (call compile _UI_requ) then {
				_selectedCtrl = _selectedCtrl + 1;
				ctrlShow [_ctrl, true];
				ctrlSetText [_ctrl, _UI_text];
				buttonSetAction [_ctrl, format["%1 spawn %2; closeDialog 0", _UI_args, _UI_func]];
			};
		} forEach a3ru_UI_array;
	};
	_handled = true;
};
_handled