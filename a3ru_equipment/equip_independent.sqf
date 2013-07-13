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
		_e_prim = ["arifle_Mk20_GL_F", "arifle_Mk20C_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 8],["30Rnd_556x45_Stanag_Tracer_Red", 2],["1Rnd_SmokeRed_Grenade_shell", 2], ["1Rnd_HE_Grenade_shell", 8], ["HandGrenade", 2], ["SmokeShell", 2]],
			[["30Rnd_556x45_Stanag", 8],["30Rnd_556x45_Stanag_Tracer_Red", 2],["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_mrco", "optic_ACO_grn", "optic_ACO"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemGPS", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["a3ru_radio_r168", "B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "TL": { // Team Leader
		_e_prim = ["arifle_Mk20_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 8],["30Rnd_556x45_Stanag_Tracer_Red", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_mrco", "optic_ACO_grn", "optic_ACO"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit", "Binocular"];
		_e_back = ["B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "GL": { // Grenadier
		_e_prim = ["arifle_Mk20_GL_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 12], ["1Rnd_HE_Grenade_shell", 8], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = ["muzzle_snds_M"];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_ACO_grn", "optic_ACO"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit", "Binocular"];
		_e_back = ["B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "AR": { // Automatic Rifleman
		_e_prim = ["LMG_Zafir_F"];
		_e_prim_mag = [
			[["150Rnd_762x51_Box", 4],["150Rnd_762x51_Box_Tracer", 1], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_ACO"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit", "Binocular"];
		_e_back = ["B_AssaultPack_dgtl"];
	};
	case "AT": { // Rifleman (AT)
		_e_prim = ["arifle_Mk20C_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 8],["30Rnd_556x45_Stanag_Tracer_Red", 2],["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = [];
		_e_sec = ["launch_RPG32_F"];
		_e_sec_mag = [[["RPG32_F", 1]]];
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit", "Binocular"];
		_e_back = ["B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "MARK_TL": { // Marksman TL
		_e_prim = ["srifle_EBR_F"];
		_e_prim_mag = [
			[["20Rnd_762x51_Mag", 10], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_mrco"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemGPS", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit", "Binocular"];
		_e_back = [];
	};
	case "MARK": { // Marksman
		_e_prim = ["arifle_Mk20_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 8], ["30Rnd_556x45_Stanag_Tracer_Red", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = ["optic_mrco"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemGPS", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit", "Binocular"];
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
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 1]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit", "Binocular"];
		_e_back = ["a3ru_radio_r168"];
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
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT",  "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit"];
		_e_back = ["B_FieldPack_blk"];
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
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit"];
		_e_back = ["B_FieldPack_blk"];
	};
	case "MOR": { // Mortar Team
		_e_prim = ["arifle_Mk20C_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 8], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight"];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit"];
		_e_back = ["a3ru_radio_r168"];
	};
	case "MED": { // Medic
		_e_prim = ["arifle_Mk20C_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 8], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = ["acc_flashlight", "acc_pointer_IR"];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_f"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemMap", "ItemWatch", "NVGoggles", "Medikit", ["FirstAidKit", 10]];
		_e_back = ["B_FieldPack_oucamo"];
	};
	case "SPN_SL": { // Spes Leader
		_e_prim = ["arifle_Mk20_GL_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 6], ["30Rnd_556x45_Stanag_Tracer_Red", 2], ["1Rnd_Smoke_Grenade_shell", 2], ["1Rnd_HE_Grenade_shell", 8], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = ["muzzle_snds_M"];
		_e_mod2 = ["acc_pointer_IR"];

		_e_mod3 = ["optic_mrco", "optic_ACO_grn"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_snds_F"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Rangefinder", "FirstAidKit"];
		_e_back = ["a3ru_radio_r168", "B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "SPN_AT": { // Spes AT
		_e_prim = ["arifle_Mk20C_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 6],["30Rnd_556x45_Stanag_Tracer_Red", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = ["muzzle_snds_M"];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = ["optic_ACO_grn"];
		_e_sec = ["launch_Titan_short_F"];
		_e_sec_mag = [[["Titan_AT", 1]]];
		_e_side = ["hgun_acpc2_snds_F"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["B_AssaultPack_dgtl"];
	};
	case "SPN_SC": { // Spes Scout
		_e_prim = ["arifle_Mk20C_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 6],["30Rnd_556x45_Stanag_Tracer_Red", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = ["muzzle_snds_M"];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = ["optic_ACO_grn"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_snds_F"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["B_TacticalPack_ocamo"];
	};
	case "SPN_AR": { // Spes Autorifleman
		_e_prim = ["LMG_Mk200_F"];
		_e_prim_mag = [
			[["200Rnd_65x39_cased_Box", 4], ["200Rnd_65x39_cased_Box_Tracer", 1], ["HandGrenade", 4], ["SmokeShell", 4]]
		];
		_e_mod1 = ["muzzle_snds_H_MG"];
		_e_mod2 = ["acc_pointer_IR", "acc_flashlight"];
		_e_mod3 = ["optic_mrco", "optic_Holosight", "optic_ACO_grn"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_snds_F"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 3]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["B_TacticalPack_ocamo"];
	};
	case "SPN_SN": { // Spes Sniper
		_e_prim = ["srifle_EBR_F"];
		_e_prim_mag = [
			[["20Rnd_762x51_Mag", 10], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = ["muzzle_snds_B"];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = ["optic_SOS", "optic_mrco"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_snds_F"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = [];
	};
	case "SPN_ES": { // Spes Explosive Specialist
		_e_prim = ["arifle_Mk20C_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 6],["30Rnd_556x45_Stanag_Tracer_Red", 2], ["HandGrenade", 2], ["SmokeShell", 2], ["SatchelCharge_Remote_Mag", 2]]
		];
		_e_mod1 = ["muzzle_snds_M"];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = ["optic_mrco", "optic_ACO_grn"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_snds_F"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "FirstAidKit"];
		_e_back = ["B_AssaultPack_dgtl", "B_AssaultPack_cbr", "B_AssaultPack_khk", "B_AssaultPack_ocamo", "B_AssaultPack_rgr"];
	};
	case "SPN_MED": { // Spes Medic
		_e_prim = ["arifle_Mk20C_F"];
		_e_prim_mag = [
			[["30Rnd_556x45_Stanag", 6],["30Rnd_556x45_Stanag_Tracer_Red", 2], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = ["muzzle_snds_M"];
		_e_mod2 = ["acc_pointer_IR"];
		_e_mod3 = ["optic_ACO_grn"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_snds_F"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Binocular", "Medikit", ["FirstAidKit", 10]];
		_e_back = ["B_FieldPack_oucamo"];
	};
	case "SNIPER": { // Sniper
		_e_prim = ["srifle_GM6_F"];
		_e_prim_mag = [
			[["5Rnd_127x108_Mag", 6], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = ["optic_SOS"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_snds_F"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Rangefinder"];
		_e_back = [];
	};
	case "SPOTTER": { // Spotter
		_e_prim = ["SMG_01_F"];
		_e_prim_mag = [
			[["30Rnd_45ACP_Mag_SMG_01", 8], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = ["optic_ACO_grn"];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = ["hgun_acpc2_snds_F"];
		_e_side_mag = [[["9Rnd_45ACP_Mag", 4]]];
		_e_items = ["ItemCompass", "ItemTCubeMT", "ItemMap", "ItemWatch", "NVGoggles", "Rangefinder", ["FirstAidKit", 2]];
		_e_back = ["a3ru_radio_r168"];
	};
	case "CREW": { // Crewman
		_e_prim = ["SMG_01_F"];
		_e_prim_mag = [
			[["30Rnd_45ACP_Mag_SMG_01", 4], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = [];
		_e_side_mag = [];
		_e_items = ["ItemCompass", "ItemGPS", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit"];
		_e_back = [];
	};
	case "PILOT": { // Crewman
		_e_prim = ["SMG_01_F"];
		_e_prim_mag = [
			[["30Rnd_45ACP_Mag_SMG_01", 4], ["HandGrenade", 2], ["SmokeShell", 2]]
		];
		_e_mod1 = [];
		_e_mod2 = [];
		_e_mod3 = [];
		_e_sec = [];
		_e_sec_mag = [];
		_e_side = [];
		_e_side_mag = [];
		_e_items = ["ItemCompass", "ItemGPS", "ItemMap", "ItemWatch", "NVGoggles", "FirstAidKit"];
		_e_back = ["a3ru_radio_r168"];
	};


};

if (_wrong) then {
	[_e_prim, _e_prim_mag, _e_mod1, _e_mod2, _e_mod3, _e_sec, _e_sec_mag, _e_side, _e_side_mag, _e_items, _e_back, _wrong]
} else {
	[_e_prim, _e_prim_mag, _e_mod1, _e_mod2, _e_mod3, _e_sec, _e_sec_mag, _e_side, _e_side_mag, _e_items, _e_back]
};