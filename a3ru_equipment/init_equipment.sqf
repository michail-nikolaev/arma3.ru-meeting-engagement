// Weapon equipment
private ["_unitSide", "_unitEquip"];

_weap_check = player getVariable ["WeaponTaken", false];
if (_weap_check) exitWith {};

_equipArray = player getVariable ["a3ru_equipment", ["OPFOR", "unarmed"]];
_unitSide = _equipArray select 0;
_unitEquip = _equipArray select 1;

_selectedEquip = _unitEquip call compile preprocessFileLineNumbers format["a3ru_equipment\equip_%1.sqf", _unitSide];

a3ru_w_primary = (_selectedEquip select 0) + ["empty"];
a3ru_w_primary_mag = (_selectedEquip select 1);
a3ru_w_mod1 = (_selectedEquip select 2) + ["empty"];
a3ru_w_mod2 = (_selectedEquip select 3) + ["empty"];
a3ru_w_mod3 = (_selectedEquip select 4) + ["empty"];
a3ru_w_secondary = (_selectedEquip select 5) + ["empty"];
a3ru_w_secondary_mag = (_selectedEquip select 6);
a3ru_w_side = (_selectedEquip select 7) + ["empty"];
a3ru_w_side_mag = (_selectedEquip select 8);
a3ru_w_items = (_selectedEquip select 9);
a3ru_w_back = (_selectedEquip select 10) + ["empty"];

fnc_a3ru_weap_iter = {
	private ["_b_slot", "_b_pic", "_b_name", "_b_type"];
	_action = _this select 0;
	_this = _this select 1;
	switch (_this) do {
		case 0: {
			_b_slot = a3ru_w_primary;
			_b_pic = 1200;
			_b_name = 1400;
			_b_type = "CfgWeapons";
		};
		case 1: {
			_b_slot = a3ru_w_mod1;
			_b_pic = 1201;
			_b_name = -1;
			_b_type = "CfgWeapons";
		};
		case 2: {
			_b_slot = a3ru_w_mod2;
			_b_pic = 1202;
			_b_name = -1;
			_b_type = "CfgWeapons";
		};
		case 3: {
			_b_slot = a3ru_w_mod3;
			_b_pic = 1203;
			_b_name = -1;
			_b_type = "CfgWeapons";
		};
		case 4: {
			_b_slot = a3ru_w_secondary;
			_b_pic = 1204;
			_b_name = 1401;
			_b_type = "CfgWeapons";
		};
		case 5: {
			_b_slot = a3ru_w_side;
			_b_pic = 1205;
			_b_name = 1402;
			_b_type = "CfgWeapons";
		};
		case 6: {
			_b_slot = a3ru_w_back;
			_b_pic = 1206;
			_b_name = 1403;
			_b_type = "CfgVehicles";
		};
	};
	if (count _b_slot > 0) then {
		if (_action == 0) then {
			if ((a3ru_weapvar select _this) == 0) then {
				a3ru_weapvar SET [_this, (count _b_slot) - 1];
			} else {
				a3ru_weapvar SET [_this, (a3ru_weapvar select _this) - 1];
			};
		} else {
			if ((a3ru_weapvar select _this) >= (count _b_slot) - 1) then {
				a3ru_weapvar SET [_this, 0];
			} else {
				a3ru_weapvar SET [_this, (a3ru_weapvar select _this) + 1];
			};
		};
		if ((a3ru_weapvar select _this) == (count _b_slot) - 1) then {
			ctrlSetText [_b_pic, "a3ru_resources\a3ru_empty.paa"];
			((findDisplay 1350) displayCtrl _b_pic) ctrlSetTooltip localize "STR_A3RU_weap_notsel";
			if (_b_name != -1) then {
				ctrlSetText [_b_name, localize "STR_A3RU_weap_notsel"];
			};
		} else {
			ctrlSetText [_b_pic, getText (ConfigFile >> _b_type >> _b_slot select (a3ru_weapvar select _this) >> "picture")];
			((findDisplay 1350) displayCtrl _b_pic) ctrlSetTooltip (getText (ConfigFile >> _b_type >> _b_slot select (a3ru_weapvar select _this) >> "displayName"));
			if (_b_name != -1) then {
				if (_b_name == 1403) then {
					_b_disLoad = getNumber (ConfigFile >> _b_type >> _b_slot select (a3ru_weapvar select _this) >> "maximumload");
					_b_disName = getText (ConfigFile >> _b_type >> _b_slot select (a3ru_weapvar select _this) >> "displayName");
					ctrlSetText [_b_name, format["%1 \ %2", _b_disName, _b_disLoad]];
				} else {
					ctrlSetText [_b_name, getText (ConfigFile >> _b_type >> _b_slot select (a3ru_weapvar select _this) >> "displayName")];
				};
			};
		};
	};
};

fnc_a3ru_weap_equip = {
	_unit = player;
	a3ru_weapon_closeCode = true;
	_unit setVariable ["WeaponTaken", true, true];
	
	////// BACKPACK //////
	_bp_count = count a3ru_w_back;
	_bp_index = a3ru_weapvar select 6;
	if (_bp_count > 1 && _bp_index != _bp_count - 1) then {
		_unit addBackpack (a3ru_w_back select _bp_index);
	};
	
	////// PRIMARY //////
	_p_count = count a3ru_w_primary;
	if (_p_count > 1) then {
		_p_index = a3ru_weapvar select 0;
		if (_p_index != _p_count - 1) then {
			_unit addWeapon (a3ru_w_primary select _p_index);
			_p_magz = a3ru_w_primary_mag select _p_index;
			{
				_unit addMagazines _x;
			} forEach _p_magz;
			_p_m1_count = count a3ru_w_mod1;
			_p_m1_index = a3ru_weapvar select 1;
			if (_p_m1_count > 1 && _p_m1_index != _p_m1_count - 1) then {
				_unit addPrimaryWeaponItem (a3ru_w_mod1 select _p_m1_index);
			};
			_p_m2_count = count a3ru_w_mod2;
			_p_m2_index = a3ru_weapvar select 2;
			if (_p_m2_count > 1 && _p_m2_index != _p_m2_count - 1) then {
				_unit addPrimaryWeaponItem (a3ru_w_mod2 select _p_m2_index);
			};
			_p_m3_count = count a3ru_w_mod3;
			_p_m3_index = a3ru_weapvar select 3;
			if (_p_m3_count > 1 && _p_m3_index != _p_m3_count - 1) then {
				_unit addPrimaryWeaponItem (a3ru_w_mod3 select _p_m3_index);
			};
		};
	};

	////// SECONDARY //////
	_s_count = count a3ru_w_secondary;
	_s_index = a3ru_weapvar select 4;
	if (_s_count > 1 && _s_index != _s_count - 1) then {
		_unit addWeapon (a3ru_w_secondary select _s_index);
		_s_magz = a3ru_w_secondary_mag select _s_index;
		{
			_unit addMagazines [_x select 0, _x select 1];
		} forEach _s_magz;
	};

	////// SIDEARM //////
	_side_count = count a3ru_w_side;
	_side_index = a3ru_weapvar select 5;
	if (_side_count > 1 && _side_index != _side_count - 1) then {
		_unit addWeapon (a3ru_w_side select _side_index);
		_side_magz = a3ru_w_side_mag select _side_index;
		{
			_unit addMagazines _x;
		} forEach _side_magz;
	};
	
	////////////////// ADD/REMOVE ITEMS //////////////////
	_rem_items = ["ItemCompass", "ItemGPS", "ItemMap", "ItemWatch", "Medikit", "NVGoggles", "Binocular"];
	{ _unit unassignItem _x; _unit removeItem _x } forEach _rem_items;
	
	_fireteamHUD = getNumber (MissionConfigFile >> "A3RU_MissionParams" >> "fireteamHUD");

	{
		if (typeName _x == "ARRAY") then {
			_item = _x select 0;
			_amount = _x select 1;
			for "_i" from 1 to _amount do {
				switch toLower (_item) do {
					default {
						_unit addItem _item;
						_unit assignItem _item;
					};
					case "itemtcubemt": {
						if (_fireteamHUD == 1) then {
							_unit addItem _item;
							_unit assignItem _item;
						} else {
							_unit addItem "ItemGPS";
							_unit assignItem "ItemGPS";
						};
					};
					case "firstaidkit": {
						_unit addItem _item;
					};
					case "medikit": {
						_unit addItem _item;
					};
					case "Binocular": {
						_unit addWeapon _item;
					};
				};
			};
		} else {
			switch toLower (_x) do {
				default {
					_unit addItem _x;
					_unit assignItem _x;
				};
				case "itemtcubemt": {
					if (_fireteamHUD == 1) then {
						_unit addItem _x;
						_unit assignItem _x;
					} else {
						_unit addItem "ItemGPS";
						_unit assignItem "ItemGPS";
					};
				};
				case "firstaidkit": {
					_unit addItem _x;
				};
				case "medikit": {
					_unit addItem _x;
				};
				case "binocular": {
					_unit addWeapon _x;
				};
			};
		};
	} forEach a3ru_w_items;
	///////////////// END OF ADD/REMOVE ITEMS ///////////////
};

_a3ru_weap_dialog = {
	disableSerialization;
	if (!(createDialog "A3RU_WEAPON_HUD")) exitWith {
		hint "Dialog Error!\nPlease Rejoin!";
	};
	_display = findDisplay 1350;
	a3ru_weapvar = [0, 0, 0, 0, 0, 0, 0];

	{ ctrlEnable [_x, false] } forEach [1600, 1601, 1602, 1605, 1603, 1606, 1604, 1607, 1400, 1401, 1402, 1403]; // Disable RscEdit
	
	//(_display displayCtrl 1005) ctrlSetTextColor [1,1,0,1];

	if (count a3ru_w_primary > 1) then {
		ctrlSetText [1200, getText (ConfigFile >> "CfgWeapons" >> a3ru_w_primary select 0 >> "picture")];
		_p_name = getText (ConfigFile >> "CfgWeapons" >> a3ru_w_primary select 0 >> "displayName");
		(_display displayCtrl 1200) ctrlSetTooltip _p_name;
		ctrlSetText [1400, _p_name];
		buttonSetAction [1600, "[0, 0] spawn fnc_a3ru_weap_iter;"];
		buttonSetAction [1601, "[1, 0] spawn fnc_a3ru_weap_iter;"];
		ctrlEnable [1600, true];
		ctrlEnable [1601, true];
		
		if (count a3ru_w_mod1 > 1) then {
			ctrlSetText [1201, getText (ConfigFile >> "CfgWeapons" >> a3ru_w_mod1 select 0 >> "picture")];
			_p_name = getText (ConfigFile >> "CfgWeapons" >> a3ru_w_mod1 select 0 >> "displayName");
			(_display displayCtrl 1201) ctrlSetTooltip _p_name;
			buttonSetAction [1602, "[0, 1] spawn fnc_a3ru_weap_iter;"];
			buttonSetAction [1605, "[1, 1] spawn fnc_a3ru_weap_iter;"];
			ctrlEnable [1602, true];
			ctrlEnable [1605, true];
		} else {
			ctrlSetText [1201, "a3ru_resources\a3ru_empty.paa"];
		};
		if (count a3ru_w_mod2 > 1) then {
			ctrlSetText [1202, getText (ConfigFile >> "CfgWeapons" >> a3ru_w_mod2 select 0 >> "picture")];
			_p_name = getText (ConfigFile >> "CfgWeapons" >> a3ru_w_mod2 select 0 >> "displayName");
			(_display displayCtrl 1202) ctrlSetTooltip _p_name;
			buttonSetAction [1603, "[0, 2] spawn fnc_a3ru_weap_iter;"];
			buttonSetAction [1606, "[1, 2] spawn fnc_a3ru_weap_iter;"];
			ctrlEnable [1603, true];
			ctrlEnable [1606, true];
		} else {
			ctrlSetText [1202, "a3ru_resources\a3ru_empty.paa"];
		};
		if (count a3ru_w_mod3 > 1) then {
			ctrlSetText [1203, getText (ConfigFile >> "CfgWeapons" >> a3ru_w_mod3 select 0 >> "picture")];
			_p_name = getText (ConfigFile >> "CfgWeapons" >> a3ru_w_mod3 select 0 >> "displayName");
			(_display displayCtrl 1203) ctrlSetTooltip _p_name;
			buttonSetAction [1604, "[0, 3] spawn fnc_a3ru_weap_iter;"];
			buttonSetAction [1607, "[1, 3] spawn fnc_a3ru_weap_iter;"];
			ctrlEnable [1604, true];
			ctrlEnable [1607, true];
		} else {
			ctrlSetText [1203, "a3ru_resources\a3ru_empty.paa"];
		};
	} else {
		ctrlSetText [1200, "a3ru_resources\a3ru_empty.paa"];
		ctrlSetText [1400, localize "STR_A3RU_weap_noweap"];
	};

	{ ctrlEnable [_x, false] } forEach [1608, 1609, 1401]; // Disable RscEdit

	if (count a3ru_w_secondary > 1) then {
		ctrlSetText [1204, getText (ConfigFile >> "CfgWeapons" >> a3ru_w_secondary select 0 >> "picture")];
		_p_name = getText (ConfigFile >> "CfgWeapons" >> a3ru_w_secondary select 0 >> "displayName");
		(_display displayCtrl 1204) ctrlSetTooltip _p_name;
		ctrlSetText [1401, _p_name];
		buttonSetAction [1608, "[0, 4] spawn fnc_a3ru_weap_iter;"];
		buttonSetAction [1609, "[1, 4] spawn fnc_a3ru_weap_iter;"];
		ctrlEnable [1608, true];
		ctrlEnable [1609, true];
	} else {
		ctrlSetText [1204, "a3ru_resources\a3ru_empty.paa"];
		ctrlSetText [1401, localize "STR_A3RU_weap_noweap"];
	};

	{ ctrlEnable [_x, false] } forEach [1610, 1611, 1402]; // Disable RscEdit

	if (count a3ru_w_side > 1) then {
		ctrlSetText [1205, getText (ConfigFile >> "CfgWeapons" >> a3ru_w_side select 0 >> "picture")];
		_p_name = getText (ConfigFile >> "CfgWeapons" >> a3ru_w_side select 0 >> "displayName");
		(_display displayCtrl 1205) ctrlSetTooltip _p_name;
		ctrlSetText [1402, _p_name];
		buttonSetAction [1610, "[0, 5] spawn fnc_a3ru_weap_iter;"];
		buttonSetAction [1611, "[1, 5] spawn fnc_a3ru_weap_iter;"];
		ctrlEnable [1610, true];
		ctrlEnable [1611, true];
	} else {
		ctrlSetText [1205, "a3ru_resources\a3ru_empty.paa"];
		ctrlSetText [1402, localize "STR_A3RU_weap_noweap"];
	};

	{ ctrlEnable [_x, false] } forEach [1613, 1612, 1402]; // Disable RscEdit

	if (count a3ru_w_back > 1) then {
		ctrlSetText [1206, getText (ConfigFile >> "CfgVehicles" >> a3ru_w_back select 0 >> "picture")];
		_b_name = getText (ConfigFile >> "CfgVehicles" >> a3ru_w_back select 0 >> "displayName");
		_b_load = getNumber (ConfigFile >> "CfgVehicles" >> a3ru_w_back select 0 >> "maximumload");
		(_display displayCtrl 1206) ctrlSetTooltip _b_name;
		ctrlSetText [1403, format["%1 \ %2", _b_name, _b_load]];
		buttonSetAction [1613, "[0, 6] spawn fnc_a3ru_weap_iter;"];
		buttonSetAction [1612, "[1, 6] spawn fnc_a3ru_weap_iter;"];
		ctrlEnable [1613, true];
		ctrlEnable [1612, true];
	} else {
		ctrlSetText [1206, "a3ru_resources\a3ru_empty.paa"];
		ctrlSetText [1403, localize "STR_A3RU_weap_noweap"];
	};
	
	buttonSetAction [1614, "closeDialog 0; [] call fnc_a3ru_weap_equip;"];
};

a3ru_weapon_closeCode = false;
while {!a3ru_weapon_closeCode} do {
	call _a3ru_weap_dialog;
	waitUntil { sleep 0.5; !dialog };
};

// Primary Weapons

/////////////// OPFOR ///////////////
// arifle_Khaybar_C_F - Katiba 6.5 mm Carbine
// 30Rnd_65x39_caseless_green, 30Rnd_65x39_caseless_green_mag_Tracer
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 
// arifle_Khaybar_F - Katiba 6.5 mm
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 30Rnd_65x39_caseless_green, 30Rnd_65x39_caseless_green_mag_Tracer
//
// arifle_Khaybar_GL_F - Katiba 6.5 mm GL
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 1Rnd_HE_Grenade_shell,
// 1Rnd_Smoke_Grenade_shell, 1Rnd_SmokeBlue_Grenade_shell, 1Rnd_SmokeGreen_Grenade_shell, 1Rnd_SmokeOrange_Grenade_shell, 1Rnd_SmokePurple_Grenade_shell, 1Rnd_SmokeRed_Grenade_shell, 1Rnd_SmokeYellow_Grenade_shell,
// UGL_FlareCIR_F, UGL_FlareGreen_F, UGL_FlareRed_F, UGL_FlareWhite_F, UGL_FlareYellow_F
//
// LMG_Mk200_F - Mk200 6.5Â mm
// [["muzzle_snds_H_MG"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 200Rnd_65x39_cased_Box, 200Rnd_65x39_cased_Box_Tracer
//
// srifle_EBR_F - Assault rifle <br/>Caliber: 7.62x51 mm NATO
// [["muzzle_snds_B"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 20Rnd_762x51_Mag

/////////////// BLUEFOR ///////////////
// arifle_MX_F - Assault Rifle Caliber: 6.5x39 mm
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 100Rnd_65x39_caseless_mag, 100Rnd_65x39_caseless_mag_Tracer, 30Rnd_65x39_caseless_mag, 30Rnd_65x39_caseless_mag_Tracer
//
// arifle_MX_GL_F - Assault Rifle Caliber: 6.5x39 mm GL
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 1Rnd_HE_Grenade_shell,
// 1Rnd_Smoke_Grenade_shell, 1Rnd_SmokeBlue_Grenade_shell, 1Rnd_SmokeGreen_Grenade_shell, 1Rnd_SmokeOrange_Grenade_shell, 1Rnd_SmokePurple_Grenade_shell, 1Rnd_SmokeRed_Grenade_shell, 1Rnd_SmokeYellow_Grenade_shell, 3Rnd_HE_Grenade_shell, 3Rnd_Smoke_Grenade_shell, 3Rnd_SmokeBlue_Grenade_shell, 3Rnd_SmokeGreen_Grenade_shell, 3Rnd_SmokeOrange_Grenade_shell, 3Rnd_SmokePurple_Grenade_shell, 3Rnd_SmokeRed_Grenade_shell, 3Rnd_SmokeYellow_Grenade_shell,
// 3Rnd_UGL_FlareCIR_F, 3Rnd_UGL_FlareGreen_F, 3Rnd_UGL_FlareRed_F, 3Rnd_UGL_FlareWhite_F, 3Rnd_UGL_FlareYellow_F, UGL_FlareCIR_F, UGL_FlareGreen_F, UGL_FlareRed_F, UGL_FlareWhite_F, UGL_FlareYellow_F 
//
// arifle_MX_SW_F - Light Machine Gun Caliber: 6.5x39 mm
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 100Rnd_65x39_caseless_mag, 100Rnd_65x39_caseless_mag_Tracer, 30Rnd_65x39_caseless_mag, 30Rnd_65x39_caseless_mag_Tracer
//
// arifle_MXC_F - Assault Rifle Caliber: 6.5x39 mm Compact
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 100Rnd_65x39_caseless_mag, 100Rnd_65x39_caseless_mag_Tracer, 30Rnd_65x39_caseless_mag, 30Rnd_65x39_caseless_mag_Tracer
//
// arifle_MXM_F - Marksman rifle Caliber: 6.5x39 mm
// [["muzzle_snds_B"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 30Rnd_65x39_caseless_mag, 30Rnd_65x39_caseless_mag_Tracer
//
// arifle_SDAR_F - SDAR 5.56Â mm
// 20Rnd_556x45_UW_mag, 30Rnd_556x45_Stanag
//
// arifle_TRG20_F - TRG-20 6.5Â mm Carbine
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 30Rnd_65x39_case_mag, 30Rnd_65x39_case_mag_Tracer
// 
// arifle_TRG21_F - TRG-21 6.5Â mm
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 30Rnd_65x39_case_mag, 30Rnd_65x39_case_mag_Tracer
//
// arifle_TRG21_GL_F - TRG-21 6.5Â mm GL
// [["muzzle_snds_H"],["acc_flashlight", "acc_pointer_IR"],["optic_ACO", "optic_ACO_grn", "optic_Hamr", "optic_Holosight", "optic_ARCO"]]
// 1Rnd_HE_Grenade_shell,
// 1Rnd_Smoke_Grenade_shell, 1Rnd_SmokeBlue_Grenade_shell, 1Rnd_SmokeGreen_Grenade_shell, 1Rnd_SmokeOrange_Grenade_shell, 1Rnd_SmokePurple_Grenade_shell, 1Rnd_SmokeRed_Grenade_shell, 1Rnd_SmokeYellow_Grenade_shell,
// UGL_FlareCIR_F, UGL_FlareGreen_F, UGL_FlareRed_F, UGL_FlareWhite_F, UGL_FlareYellow_F 

// Secondary Weapons
// launch_NLAW_F - N-LAW Rocket Launcher
// NLAW_F
//
// launch_RPG32_F - RPG-42 Alamut
// RPG32_AA_F, RPG32_F

// Sidearms
///////// BLUEFOR /////////
// hgun_P07_F - P07 9Â mm
// hgun_P07_snds_F - P07 9Â mm Silenced
// 16Rnd_9x21_Mag, 30Rnd_9x21_Mag 
///////// OPFOR ///////////
// hgun_Rook40_F - Rook-40 9 mm
// hgun_Rook40_snds_F - Rook-40 9 mm Silenced
// 16Rnd_9x21_Mag, 30Rnd_9x21_Mag 