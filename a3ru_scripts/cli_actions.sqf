// Добавление в меню действий администратора: завершение подготовки
[
	'(ADMIN) End Prepare Time',
	'[]',
	'fnc_a3ru_end_prepare',
	'(serverCommandAvailable "#kick" || isServer) && !a3ru_started'
] call fnc_a3ru_ui_add;

// Добавление в меню действий администратора: завершение миссии
[
	'(ADMIN) Finish Mission',
	str(format['Mission finished by admin: %1', name player]),
	'fnc_a3ru_endMission',
	'(serverCommandAvailable "#kick" || isServer) && a3ru_started'
] call fnc_a3ru_ui_add;

// Добавление в меню действий: Толкнуть лодку (Push boat)
[
	'Push Boat',
	'[]',
	'fnc_a3ru_pushBoat',
	'cursorTarget isKindOf "ship" && player distance cursorTarget < 5'
] call fnc_a3ru_ui_add;

if (isClass (configFile >> "A3RU_PostInit_EventHandlers" >> "FireteamHUD")) then {
	a3ru_FTHUD_disabled = true;

	[
		'Enable Fireteam HUD',
		'0',
		'fnc_a3ru_FTHUDShow',
		'a3ru_FTHUD_disabled && ("ItemTCubeMT" in (assignedItems player))'
	] call fnc_a3ru_ui_add;
	
	[
		'Disable Fireteam HUD',
		'1',
		'fnc_a3ru_FTHUDShow',
		'!a3ru_FTHUD_disabled'
	] call fnc_a3ru_ui_add;
};