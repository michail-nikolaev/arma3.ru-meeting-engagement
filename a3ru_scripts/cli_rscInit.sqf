disableSerialization;
cutRsc ["A3RU_HUD","PLAIN"];

_ui = uiNamespace getVariable "A3RU_HUD";
_timer = _ui displayCtrl 1001;
_playerTag = _ui displayCtrl 1002;

{_x ctrlShow false} foreach [_timer, _playerTag];