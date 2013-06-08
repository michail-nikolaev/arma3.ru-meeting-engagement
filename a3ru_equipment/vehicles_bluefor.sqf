_veh = _this select 0;
_template = _this select 1;

clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;

_veh disableTIEquipment true; // Отключаем тепловизор

switch toLower(_template) do {
	default {
		if (!isDedicated) then { hint format["WRONG TEMPLATE\nVehicle> %1\nTemplate> %2", _veh, _template] };
	};
	case "empty": {}; // Empty cargo
	case "mini": { // Minimum ammo
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 10];
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 5];
		_veh addMagazineCargoGlobal ["HandGrenade", 5];
		_veh addMagazineCargoGlobal ["SmokeShell", 2];
	};
	case "ba": { // Basic Ammo
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 10];
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 5];
		_veh addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 5];
		_veh addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow", 2];
		_veh addMagazineCargoGlobal ["20Rnd_556x45_UW_mag", 5];
		_veh addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 10];
		_veh addMagazineCargoGlobal ["HandGrenade", 5];
		_veh addMagazineCargoGlobal ["SmokeShell", 2];
		_veh addMagazineCargoGlobal ["SmokeShellBlue", 2];
		_veh addMagazineCargoGlobal ["SmokeShellGreen", 2];
		_veh addMagazineCargoGlobal ["SmokeShellOrange", 2];
		_veh addMagazineCargoGlobal ["SmokeShellRed", 2];
		_veh addBackPackCargoGlobal ["a3ru_radio_prc119", 1];
	};
	case "at": { // AT Ammo
		_veh addMagazineCargoGlobal ["NLAW_F", 2];
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 10];
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 2];
		_veh addMagazineCargoGlobal ["HandGrenade", 5];
		_veh addMagazineCargoGlobal ["SmokeShell", 2];
		_veh addBackPackCargoGlobal ["a3ru_radio_prc119", 1];

	};
	case "sup": { // Support Ammo
		_veh addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 5];
		_veh addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_Tracer", 2];
		_veh addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
		_veh addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 2];
		_veh addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", 2];
		_veh addMagazineCargoGlobal ["1Rnd_SmokeOrange_Grenade_shell", 2];
		_veh addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", 2];
		_veh addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 2];
		_veh addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 2];
		_veh addMagazineCargoGlobal ["1Rnd_SmokeYellow_Grenade_shell", 2];
		_veh addMagazineCargoGlobal ["3Rnd_UGL_FlareGreen_F", 2];
		_veh addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 2];
		_veh addMagazineCargoGlobal ["3Rnd_UGL_FlareRed_F", 2];
		_veh addMagazineCargoGlobal ["3Rnd_UGL_FlareWhite_F", 2];
		_veh addMagazineCargoGlobal ["3Rnd_UGL_FlareYellow_F", 2];
		_veh addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 2];
		_veh addBackPackCargoGlobal ["a3ru_radio_prc119", 1];
	};
	case "sap": { // Sapper
		_veh addWeaponCargoGlobal ["MineDetector", 3];
		_veh addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 2];
		_veh addMagazineCargoGlobal ["APERSMine_Range_Mag", 2];
		_veh addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", 2];
		_veh addMagazineCargoGlobal ["ATMine_Range_Mag", 2];
		_veh addBackPackCargoGlobal ["a3ru_radio_prc119", 1];
	};
	case "med": { // Medical equipment
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 10];
		_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 2];
		_veh addWeaponCargoGlobal ["FirstAidKit", 10];
		_veh addWeaponCargoGlobal ["Medikit", 2];
		_veh addBackPackCargoGlobal ["a3ru_radio_prc119", 1];
	};
};