// OPFOR EQUIPMENT
private ["_e_prim", "_e_prim_mag", "_e_mod1", "_e_mod2", "_e_mod3", "_e_sec", "_e_sec_mag", "_e_side", "_e_side_mag", "_e_items", "_e_back", "_wrong"];
_wrong = false;

switch toUpper(_this) do {
	default {
		hintC "WARNING! Wrong slot name in unit initialization! More in diag log";
		_e_prim = [];
		_e_prim_mag = [];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = [];
		_e_side_mag = [];
		_e_items = [];
		_e_back = [];
		_wrong = true;
	};
	case "UNARMED": {
		_e_prim = [];
		_e_prim_mag = [];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = [];
		_e_side_mag = [];
		_e_items = [];
		_e_back = [];
	};
	case "SL": { // Squad Leader
		_e_prim = ["arifle_MX_GL_F", "arifle_MX_F"];
		_e_prim_mag = [
			[["30Rnd_65x39_caseless_mag", 8],["30Rnd_65x39_caseless_mag_Tracer", 2],["1Rnd_Smoke_Grenade_shell", 2], ["1Rnd_HE_Grenade_shell", 8], ["HandGrenade", 2], ["SmokeShell", 2]],
			[["30Rnd_65x39_caseless_mag", 8],["30Rnd_65x39_caseless_mag_Tracer", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_Hamr", "optic_Holosight"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemGPS", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["a3ru_radio_prc119", "B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "TL": { // Team Leader
		_e_prim = ["arifle_MX_F"];
		_e_prim_mag = [
			[["30Rnd_65x39_caseless_mag", 8],["30Rnd_65x39_caseless_mag_Tracer", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_Hamr", "optic_Holosight"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "GL": { // Grenadier
		_e_prim = ["arifle_MX_GL_F"];
		_e_prim_mag = [
			[["30Rnd_65x39_caseless_mag", 10],["30Rnd_65x39_caseless_mag_Tracer", 2], ["1Rnd_HE_Grenade_shell", 8], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit"];
		_e_back = ["B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "AR": { // Automatic Rifleman
		_e_prim = ["arifle_MX_SW_F"];
		_e_prim_mag = [
			[["100Rnd_65x39_caseless_mag", 6],["100Rnd_65x39_caseless_mag_Tracer", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_Holosight"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = [];
	};
	case "AT": { // Rifleman (AT)
		_e_prim = ["arifle_TRG20_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 8],["30Rnd_556x45_Stanag_Tracer_Yellow", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = [];
		_e_sec = ["launch_NLAW_F"];
		_e_sec_mag = [[["NLAW_F", 1]]];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "MARK_TL": { // Marksman TL
		_e_prim = ["arifle_MXM_F"];
		_e_prim_mag = [
			[["30Rnd_65x39_caseless_mag", 8], ["30Rnd_65x39_caseless_mag_Tracer", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_Hamr"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemGPS", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = [];
	};
	case "MARK": { // Marksman
		_e_prim = ["arifle_MXM_F"];
		_e_prim_mag = [
			[["30Rnd_65x39_caseless_mag", 8], ["30Rnd_65x39_caseless_mag_Tracer", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_Hamr"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemGPS", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = [];
	};
	case "D_TL": { // Diver Team Leader
		_e_prim = ["arifle_SDAR_F"];
		_e_prim_mag = [
			[["20Rnd_556x45_UW_mag", 2], ["30Rnd_556x45_Stanag", 5]]
		];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 1]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["a3ru_radio_prc119"];
	};
	case "D": { // Diver
		_e_prim = ["arifle_SDAR_F"];
		_e_prim_mag = [
			[["20Rnd_556x45_UW_mag", 4], ["30Rnd_556x45_Stanag", 6], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass",  "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit"];
		_e_back = ["B_AssaultPack_blk"];
	};
	case "D_ES": { // Diver Explosive Specialist
		_e_prim = ["arifle_SDAR_F"];
		_e_prim_mag = [
			[["20Rnd_556x45_UW_mag", 4], ["30Rnd_556x45_Stanag", 6], ["DemoCharge_Remote_Mag", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit"];
		_e_back = ["B_AssaultPack_blk"];
	};
	case "MOR": { // Mortar Team
		_e_prim = ["arifle_TRG20_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 6], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight"];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit"];
		_e_back = ["a3ru_radio_prc119"];
	};
	case "MED": { // Medic
		_e_prim = ["arifle_TRG20_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 6],["30Rnd_556x45_Stanag_Tracer_Yellow", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "Medikit", ["FirstAidKit", 10]];
		_e_back = ["B_FieldPack_oucamo"];
	};
	case "SPN_SL": { // Spes Leader
		_e_prim = ["arifle_MX_GL_F"];
		_e_prim_mag = [
			[["30Rnd_65x39_caseless_mag", 6], ["30Rnd_65x39_caseless_mag_Tracer", 2], ["1Rnd_Smoke_Grenade_shell", 2], ["1Rnd_HE_Grenade_shell", 8], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = ["muzzle_snds_H"];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = [ "optic_Hamr", "optic_Holosight"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_snds_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Rangefinder", "FirstAidKit"];
		_e_back = ["a3ru_radio_prc119", "B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "SPN_AT": { // Spes AT
		_e_prim = ["SMG_01_F"];
		_e_prim_mag = [
			[["30Rnd_45ACP_Mag_SMG_01", 8], ["HandGrenade", 4], ["SmokeShell", 4]]
		];
		_e_mod1 = ["muzzle_snds_L"];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = ["optic_Hamr", "optic_Holosight"];
		_e_sec = ["launch_Titan_short_F"];
		_e_sec_mag = [[["Titan_AT", 1]]];
		_e_side = ["hgun_P07_snds_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["B_AssaultPack_dgtl"];
	};
	case "SPN_SN": { // Spes Sniper
		_e_prim = ["arifle_MXM_F"];
		_e_prim_mag = [
			[["30Rnd_65x39_caseless_mag", 8], ["30Rnd_65x39_caseless_mag_Tracer", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = ["muzzle_snds_H"];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = ["optic_Hamr"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_snds_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = [];
	};
	case "SPN_ES": { // Spes Explosive Specialist
		_e_prim = ["SMG_01_F"];
		_e_prim_mag = [
			[["30Rnd_45ACP_Mag_SMG_01", 8], ["HandGrenade", 4], ["SmokeShell", 4], ["SatchelCharge_Remote_Mag", 2]]
		];
		_e_mod1 = ["muzzle_snds_L"];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = ["optic_Hamr", "optic_Holosight"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_snds_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "SPN_MED": { // Spes Medic
		_e_prim = ["arifle_TRG21_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 6],["30Rnd_556x45_Stanag_Tracer_Yellow", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = ["optic_Hamr", "optic_Holosight"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_snds_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "Medikit", ["FirstAidKit", 10]];
		_e_back = ["B_FieldPack_oucamo"];
	};
	case "SNIPER": { // Sniper
		_e_prim = ["srifle_LRR_F"];
		_e_prim_mag = [
			[["7Rnd_408_Mag", 6], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = ["optic_SOS"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_snds_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "Rangefinder"];
		_e_back = [];
	};
	case "SPOTTER": { // Spotter
		_e_prim = ["SMG_01_F"];
		_e_prim_mag = [
			[["30Rnd_45ACP_Mag_SMG_01", 8], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = ["optic_Holosight"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_P07_snds_F"];
		_e_side_mag = [[["16Rnd_9x21_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Rangefinder", ["FirstAidKit", 2]];
		_e_back = ["a3ru_radio_prc119"];
	};
};

if (_wrong) then {
	[_e_prim, _e_prim_mag, _e_mod1, _e_mod2, _e_mod3, _e_sec, _e_sec_mag, _e_side, _e_side_mag, _e_items, _e_back, _wrong]
} else {
	[_e_prim, _e_prim_mag, _e_mod1, _e_mod2, _e_mod3, _e_sec, _e_sec_mag, _e_side, _e_side_mag, _e_items, _e_back]
};