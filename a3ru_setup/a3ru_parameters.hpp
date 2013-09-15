class Params {
	class a3ru_startTime {
		title = "$STR_A3RU_startTime";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13};
		texts[] = {$STR_A3RU_default, 0400, 0600, 0800, 1000, 1100, 1300, 1500, 1700, 1900, 2100, 2300, 0100, 0200};
		default = 0;
	};

	class a3ru_startFog {
		title = "$STR_A3RU_startFog";
		values[] = {0,1,2,3,4};
		texts[] = {$STR_A3RU_Default, $STR_A3RU_fog_1, $STR_A3RU_fog_2, $STR_A3RU_fog_3, $STR_A3RU_fog_4};
		default = 0;
	};

	class a3ru_playerTags {
		title = "$STR_A3RU_tags";
		values[] = {0,1};
		texts[] = {$STR_A3RU_on,$STR_A3RU_off};
		default = 0;
	};
	class a3ru_preTime {
		title = "$STR_A3RU_preTime";
		values[] = {300,420,600,900};
		texts[] = {"5m", "7m", "10m", "15m"};
		default = 300;
	};
	class a3ru_slotReservation {
		title = "$STR_A3RU_slotReservation";
		values[] = {0,1};
		texts[] = {$STR_A3RU_on,$STR_A3RU_off};
		default = 0;
	};
};