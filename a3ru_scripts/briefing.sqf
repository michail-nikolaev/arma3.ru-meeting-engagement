_ver = getNumber(missionConfigFile >> "atrium_version");
player createDiaryRecord ["diary", [localize "STR_A3RU_Info",
	format ["<font face='EtelkaNarrowMediumPro_RU'>Название миссии: %1<br/>Описание: %2<br/>Автор: %3<br/>Версия платформы Atrium: %4<br/>Автор платформы: [SUB7]Blender</font>",
		localize "STR_A3RU_MissionName",
		localize "STR_A3RU_MissionDesc",
		localize "STR_A3RU_MissionAuthor",
		_ver
	]
]];

_BFSide = call compile (getText (MissionConfigFile >> "A3RU_MissionParams" >> "blueforSide"));
_OFSide = call compile (getText (MissionConfigFile >> "A3RU_MissionParams" >> "opforSide"));
switch (side player) do {
	case _BFSide: {
		player createDiaryRecord ["diary", [localize "STR_A3RU_Additional", format["<font face='EtelkaNarrowMediumPro_RU'>%1</font>", localize "STR_A3RU_BF_MissionAdditional"]]];
		player createDiaryRecord ["diary", [localize "STR_A3RU_Enemy", format["<font face='EtelkaNarrowMediumPro_RU'>%1</font>", localize "STR_A3RU_BF_MissionEnemy"]]];
		player createDiaryRecord ["diary", [localize "STR_A3RU_Tasks", format["<font face='EtelkaNarrowMediumPro_RU'>%1</font>", localize "STR_A3RU_BF_MissionTasks"]]];
	};
	case _OFSide: {
		player createDiaryRecord ["diary", [localize "STR_A3RU_Additional", format["<font face='EtelkaNarrowMediumPro_RU'>%1</font>", localize "STR_A3RU_OF_MissionAdditional"]]];
		player createDiaryRecord ["diary", [localize "STR_A3RU_Enemy", format["<font face='EtelkaNarrowMediumPro_RU'>%1</font>", localize "STR_A3RU_OF_MissionEnemy"]]];
		player createDiaryRecord ["diary", [localize "STR_A3RU_Tasks", format["<font face='EtelkaNarrowMediumPro_RU'>%1</font>", localize "STR_A3RU_OF_MissionTasks"]]];
	};
};

player createDiaryRecord ["diary", [localize "STR_A3RU_Intel", format["<font face='EtelkaNarrowMediumPro_RU'>%1</font>", localize "STR_A3RU_MissionIntel"]]];