class A3RU_HUD
{
	idd = 1000;
	movingEnable = 0;
	duration = 1e+011;
	name = "A3RUHUD_name";
	onLoad = "uiNamespace setVariable ['A3RU_HUD', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['A3RU_HUD', nil]";
	controlsBackground[] = {};
	objects[] = {};
	class controls
	{
		class A3RU_CountDown
		{
			type = 0;
			style = 0x02;
			idc = 1001;
			text = "";
			x = 0.455 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.04 * safezoneH;
			font = "PuristaMedium";
			colorBackground[] = {0.05,0.05,0.05,0.3};
			colorText[] = {1,1,1,1};
			sizeEx = 0.035;
		};
		class A3RU_PlayerTag
		{
			access = 0;
			type = 13;
			idc = 1002;
			style = 0x02;
			colorText[] = 
			{
				1,
				1,
				1,
				1
			};
			text = "";
			x = 0.412502 * safezoneW + safezoneX;
			y = 0.726014 * safezoneH + safezoneY;
			w = 0.183745 * safezoneW;
			h = 0.0280032 * safezoneH;
			ShowImage = true;
			class Attributes
			{
					font = "PuristaMedium";
					color = "#ffffff";
					align = "center";
					shadow = 1;
			};
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			shadow = 1;
		};
	};
};

class A3RU_PROGRESS_UI
{
	class A3RU_RscPicture2: A3RU_RscPicture {
		text = "a3ru_resources\prog_block.jpg";
	};
	idd = 1352;
	movingEnable = 0;
	duration = 5;
	name = "A3RUPROGRESS_name";
	onLoad = "uiNamespace setVariable ['A3RU_PROGRESS_UI', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['A3RU_PROGRESS_UI', nil]";
	controlsBackground[] = {a3ru_pb_back};
	objects[] = {};
	controls[] = {
		a3ru_pb_1,
		a3ru_pb_2,
		a3ru_pb_3,
		a3ru_pb_4,
		a3ru_pb_5,
		a3ru_pb_6,
		a3ru_pb_7,
		a3ru_pb_8,
		a3ru_pb_9,
		a3ru_pb_10,
		a3ru_pb_text
	};
	class a3ru_pb_back: A3RU_RscPicture
	{
		idc = 1800;
		text = "a3ru_resources\prog_back.jpg";
		x = 0.393875 * safezoneW + safezoneX;
		y = 0.055044 * safezoneH + safezoneY;
		w = 0.21225 * safezoneW;
		h = 0.0219965 * safezoneH;
	};
	class a3ru_pb_1: A3RU_RscPicture2
	{
		idc = 1801;
		x = 0.396875 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_2: A3RU_RscPicture2
	{
		idc = 1802;
		x = 0.4175 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_3: A3RU_RscPicture2
	{
		idc = 1803;
		x = 0.438125 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_4: A3RU_RscPicture2
	{
		idc = 1804;
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_5: A3RU_RscPicture2
	{
		idc = 1805;
		x = 0.479375 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_6: A3RU_RscPicture2
	{
		idc = 1806;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_7: A3RU_RscPicture2
	{
		idc = 1807;
		x = 0.520625 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_8: A3RU_RscPicture2
	{
		idc = 1808;
		x = 0.54125 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_9: A3RU_RscPicture2
	{
		idc = 1809;
		x = 0.561875 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_10: A3RU_RscPicture2
	{
		idc = 1810;
		x = 0.5825 * safezoneW + safezoneX;
		y = 0.059044 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.0139965 * safezoneH;
	};
	class a3ru_pb_text: A3RU_RscText
	{
		idc = 1811;
		text = ""; //--- ToDo: Localize;
		x = 0.393875 * safezoneW + safezoneX;
		//x = 0.451875 * safezoneW + safezoneX;
		//y = 0.242 * safezoneH + safezoneY;
		y = 0.055044 * safezoneH + safezoneY;
		//w = 0.09625 * safezoneW;
		w = 0.21225 * safezoneW;
		h = 0.022 * safezoneH;
	};
};

class a3ru_sg_logo
{	
	idd = 1353;	
	onLoad = "uiNamespace setVariable ['a3ru_sg_logo', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['a3ru_sg_logo', nil]";
	movingEnable = 0;
	duration = 10;
	fadein = 4;
	sizeEx = 256;
	name = "a3ru_sg_logo"; 
	controls[] = {"a3ru_sg_logo_image", "a3ru_sg_logo_mission", "a3ru_sg_logo_author", "a3ru_sg_logo_atrium"};

	class a3ru_sg_logo_image: A3RU_RscPicture
	{
		idc = 1200;
		text = "a3ru_resources\a3ru_sg_logo.paa";
		x = 0.300625 * safezoneW + safezoneX;
		y = 0.236042 * safezoneH + safezoneY;
		w = 0.385 * safezoneW;
		h = 0.120981 * safezoneH;
	};
	class a3ru_sg_logo_mission: A3RU_RscStructuredText
	{
		idc = 1100;
		style = 0x02;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.357023 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.0219965 * safezoneH;
	};
	class a3ru_sg_logo_author: A3RU_RscStructuredText
	{
		idc = 1101;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.390018 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.0219965 * safezoneH;
	};

	class a3ru_sg_logo_atrium: A3RU_RscStructuredText
	{
		idc = 1102;
		x = 0.8575 * safezoneW + safezoneX;
		y = 0.840946 * safezoneH + safezoneY;
		w = 0.130625 * safezoneW;
		h = 0.0219965 * safezoneH;
	};
};