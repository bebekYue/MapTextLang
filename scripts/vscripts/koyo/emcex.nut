stage <- 1
ex <- false
weat <- null
yunshi <- true
slogra<-true
countbf<-0

function think()
{
	local extext = Entities.CreateByClassname("game_text");
	extext.__KeyValueFromString("targetname","extext");
	extext.__KeyValueFromString("color","105 250 100");
	extext.__KeyValueFromFloat("y",0.43);
	extext.__KeyValueFromFloat("x",0.15);
	extext.__KeyValueFromFloat("fadein",0.025);
	extext.__KeyValueFromFloat("fadeout",0.5);
	extext.__KeyValueFromFloat("holdtime",10);
	extext.__KeyValueFromFloat("fxtime",0.01);
	extext.__KeyValueFromInt("spawnflags",1);
	extext.__KeyValueFromInt("channel",3);
	extext.__KeyValueFromInt("effect",2);
	stagecount();
	EntFire("skybox_s1_monster", "addoutput", "rendercolor 255 80 80", 11, null);
	EntFire("boss_ogre_model", "addoutput", "rendercolor 255 80 80", 1, null);
	EntFire("boss_slogra_model", "addoutput", "rendercolor 255 80 80", 1, null);
	EntFire("boss_gaibon_model", "addoutput", "rendercolor 255 80 80", 1, null);
	EntFire("boss_swampmonster_model", "addoutput", "rendercolor 255 80 80", 1, null);
	EntFire("boss_spiderqueen_model", "addoutput", "rendercolor 255 80 80", 1, null);
	EntFire("boss_snowtitan_model", "addoutput", "rendercolor 255 80 80", 1, null);
	ScriptPrintMessageChatAll(" \x10 --------- EX stripper 日期 2021.8.12 编写: koyo 回合计数:"+countbf+"---------");
	if(ex)
	{
	EntFire("weather_math", "kill", null, 1, null);EntFire("g_npc_buff_health", "enable", null, 0, null);
	EntFire("weather_case_clear", "kill", null, 1, null);
	EntFire("s_zw", "addoutput", "origin 343.282288 -709.780945 -7900", 10, null);
	EntFire("s_zw", "forcespawn", null, 11, null);
	EntFire("s_znpcspawn", "addoutput", "origin 672.491150 -357.962341 -7900;", 10, null);
	EntFire("s_znpcspawn", "forcespawn", null, 11, null);
	if(stage!=6&&stage!=1&&stage!=5){
	switch(RandomInt(0, 3))
	{
	case 0:EntFire("weather_case", "invalue", 6, 1, null);EntFire("weather_relay_fog", "trigger", null, 1, null);EntFire("weather_relay_rain", "kill", null, 1, null);EntFire("g_rain", "kill", null, 1, null);
	printl("红雾");break;
	case 1:EntFire("weather_case", "invalue", 12, 1, null);EntFire("weather_relay_fog", "trigger", null, 1, null);EntFire("weather_relay_rain", "kill", null, 1, null);EntFire("g_rain", "kill", null, 1, null);
	printl("黑雾");break;
	case 2:EntFire("weather_case", "invalue", 12, 1, null);EntFire("weather_relay_rain", "trigger", null, 1, null);EntFire("thunder_strike_relay", "enable", null, 1, null);EntFire("thunder_timer", "enable", null, 1, null);
	printl("黑雨");break;
	case 3:EntFire("weather_case", "invalue", 6, 1, null);EntFire("weather_relay_rain", "trigger", null, 1, null);EntFire("thunder_strike_relay", "enable", null, 1, null);EntFire("thunder_timer", "enable", null, 1, null);
	printl("红雨");break;
	}
	}
	switch(stage)
	{
	case 1:
	extext.__KeyValueFromString("message","[EX1]\n◆僵尸船间歇发射陨石与幽灵出现\n◆BOSS血量翻倍\n◆NPC获得血量buff\n◆人类神器增加固定刷新点2个\n◆僵尸初始神器4个\n◆特殊天气");
	EntFireByHandle(extext,"Display","",0.01,activator,extext);
	EntFireByHandle(extext,"Kill","",10,extext,extext);
	EntFire("weather_relay_rain", "trigger", null, 2, null);
	switch(RandomInt(0, 1))
	{case 0:EntFire("weather_case", "invalue", 6, 1, null);break;
	case 1:EntFire("weather_case", "invalue", 12, 1, null);break;}
	EntFire("g_hitdetect_math", "SetValue", 600, 32.5, null);
	EntFire("boss_addhp_counter", "SetValue", 10, 1.5, null);
	EntFire("s_stonelaunch", "addoutput", "origin -14456 14480 14500", 2, null);
	EntFireByHandle(self,"runscriptcode","spawnys()",35,activator,activator);
	EntFire("stage_1","runscriptcode","yunshi=true",0, null);

	EntFire("event_case_s1", "addoutput", "oncase04 skybox_s1_monster:addoutput:rendercolor 255 80 80:45.1:-1", 1, null);
	EntFire("s_seamtent", "addoutput", "OnEntitySpawned i_seamtent_model*:addoutput:rendercolor 255 120 120:0.01:-1", 1, null);
	

	EntFire("s_ghost", "addoutput", "origin -14484 14919 14655", 32.5, null);
	EntFire("s_ghost", "forcespawn", "", 33, null);

	EntFire("event_case_s1", "addoutput", "oncase02 g_hitdetect_math:SetValue:600:17.5:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase03 g_hitdetect_math:SetValue:600:17.5:-1", 1, null);

 	EntFire("event_case_s1", "addoutput", "oncase02 stage_1:runscriptcode:yunshi=false:0:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase02 stage_1:runscriptcode:yunshi=true:20:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase02 stage_1:runscriptcode:spawnys():20.5:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase03 stage_1:runscriptcode:yunshi=false:0:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase03 stage_1:runscriptcode:yunshi=true:19:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase03 stage_1:runscriptcode:spawnys():19.5:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase04 stage_1:runscriptcode:yunshi=false:0:-1", 1, null);

 	EntFire("event_case_s1", "addoutput", "oncase02 s_ghost:forcespawn::21:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase02 s_ghost:addoutput:origin -13865 14919 14655:21.5:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase02 s_ghost:forcespawn::22:-1", 1, null);

 	EntFire("event_case_s1", "addoutput", "oncase03 s_ghost:forcespawn::19:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase03 s_ghost:addoutput:origin -14484 14919 14655:19.5:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase03 s_ghost:forcespawn::20:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase03 s_ghost:addoutput:origin -14773 14846 14870:20.5:-1", 1, null);
 	EntFire("event_case_s1", "addoutput", "oncase03 s_ghost:forcespawn::21:-1", 1, null);

 	EntFire("g_wr_medkit", "enable", "", 0, null);
 	EntFire("g_wr_medkit", "disable", "", 0.5, null);
 	EntFire("sqmaker", "addoutput", "origin -14942 13901 14650", 0, null);
 	EntFire("sqmaker", "forcespawn", "", 0.1, null);
 	EntFire("sqmaker", "addoutput", "origin -14894.818359 13832.284180 14510", 5, null);
 	EntFire("sqmaker", "forcespawn", "", 5.1, null);


	break;
	case 2:
	extext.__KeyValueFromString("message","[EX2]\n◆路线固定为山洞\n◆阿尔卡特皮肤出现\n◆BOSS血量翻倍\n◆NPC获得血量buff\n◆NPC数量增加2个\n◆人类神器增加固定刷新点3个\n◆僵尸初始神器4个\n◆特殊天气");
	EntFireByHandle(extext,"Display","",0.01,activator,extext);
	EntFireByHandle(extext,"Kill","",10,extext,extext);
	
	EntFire("boss_addhp_counter", "SetValue", 30, 1.5, null);
	EntFire("eee", "addoutput", "solid 2", 1.5, null);

	EntFire("s_director", "addoutput", "origin -5295.789551 8795.815430 12664", 5, null);
 	EntFire("s_director", "forcespawn", "", 5.1, null);
 	EntFire("g_director", "fireuser2", "", 6, null);

	EntFire("s_gate_metal", "addoutput", "origin 1700 10224 13780", 10, null);
	EntFire("s_gate_metal", "addoutput", "angles 0 0 0", 10, null);
	EntFire("s_gate_metal", "forcespawn", "", 11, null);
	EntFire("s_gate_metal", "addoutput", "origin 1190 10083 13350", 12, null);
	EntFire("s_gate_metal", "addoutput", "angles 0 45 0", 12, null);
	EntFire("s_gate_metal", "forcespawn", "", 13, null);
	EntFire("sqmaker", "addoutput", "origin 1125 10476 13580", 13, null);
 	EntFire("sqmaker", "forcespawn", "", 13.1, null);
 	EntFire("sqmaker", "addoutput", "origin 990 10012 12560", 11, null);
 	EntFire("sqmaker", "forcespawn", "", 11.1, null);
 	EntFire("sqmaker", "addoutput", "origin -649 10072 12888", 12, null);
 	EntFire("sqmaker", "forcespawn", "", 12.1, null);
 	EntFire("s_alucard_button", "addoutput", "origin -1306 9970 12880", 12, null);
 	EntFire("s_alucard_button", "addoutput", "angles 0 180 0", 12.1, null);
 	EntFire("s_metalbreak", "forcespawn", "", 12.1, null);
 	EntFire("s_metalbreak", "addoutput", "origin -3314 10812 12870", 12, null);

 	EntFire("s_batstorm_maker", "addoutput", "origin -4808 8775 12542", 25, null);
 	EntFire("s_batstorm_maker", "addoutput", "angles 0 180 0", 25, null);
 	EntFire("s_batstorm_maker", "forcespawn", "", 25.1, null);

 	EntFire("s_tr_tripwire", "addoutput", "origin -4531 9090 12450", 12, null);
 	EntFire("s_tr_tripwire", "forcespawn", "", 12.1, null);

 	EntFire("s_npc", "addoutput", "origin -2212 8296 12496", 50, null);
 	EntFire("s_npc", "forcespawn", "", 50.1, null);

 	EntFire("s_npc", "addoutput", "origin 1271.626587 10434.072266 13152.093750", 70, null);
 	EntFire("s_npc", "forcespawn", "", 70.1, null);


	break;
	case 3:
	extext.__KeyValueFromString("message","[EX3]\n◆阿尔卡特皮肤出现\n◆BOSS1拥有刀波攻击\n◆BOSS血量翻倍\n◆NPC获得血量buff\n◆NPC数量增加4个\n◆人类神器增加固定刷新点3个\n◆僵尸初始神器4个\n◆特殊天气");
	EntFireByHandle(extext,"Display","",0.01,activator,extext);
	EntFireByHandle(extext,"Kill","",10,extext,extext);
	EntFire("event_case_s3", "addoutput", "oncase11 boss_addhp_counter:SetValue:14:5:1", 1, null);
	EntFire("event_case_s3", "addoutput", "oncase13 boss_addhp_counter:SetValue:12:1:1", 1, null);

	EntFire("s_npc", "addoutput", "origin -6954.149414 -1783.093384 5588.373047", 12, null);
 	EntFire("s_npc", "forcespawn", "", 12.1, null);

 	EntFire("s_npc", "addoutput", "origin -5885.263672 592.404053 5543.152344", 13, null);
 	EntFire("s_npc", "forcespawn", "", 13.1, null);

 	EntFire("s_npc", "addoutput", "origin -6737.631348 2570.563965 5520.291504", 15, null);
 	EntFire("s_npc", "forcespawn", "", 15.1, null);

 	EntFire("s_npc", "addoutput", "origin -366.115051 2768.077148 5514.725098", 100, null);
 	EntFire("s_npc", "forcespawn", "", 85.1, null);

 	EntFire("sqmaker", "addoutput", "origin 1086.778564 2369.181396 5620", 13, null);
 	EntFire("sqmaker", "forcespawn", "", 13.1, null);
 	EntFire("sqmaker", "addoutput", "origin 5659.418457 8718.369141 6440", 14, null);
 	EntFire("sqmaker", "forcespawn", "", 14.1, null);
 	EntFire("sqmaker", "addoutput", "origin 6979.917969 9655.583984 10251", 15, null);
 	EntFire("sqmaker", "forcespawn", "", 15.1, null);

 	EntFire("s_alucard_button", "addoutput", "origin 8031.968262 9287.855469 7570", 12, null);
 	EntFire("s_alucard_button", "addoutput", "angles 0 180 0", 12.1, null);

 	EntFire("event_case_s3", "addoutput", "oncase11 s_slash_maker:setparent:boss_slogra_model:0:-1", 0, null);
 	EntFire("event_case_s3", "addoutput", "oncase11 s_slash_maker:setparentattachment:speartip:0.1:-1", 0, null);
 	EntFire("event_case_s3", "addoutput", "oncase11 stage_1:runscriptcode:slash():11:-1", 0, null);
 	EntFire("event_case_s3", "addoutput", "oncase13 stage_1:runscriptcode:slogra=false:0:-1", 0, null);
 	EntFire("event_case_s3", "addoutput", "oncase11 stage_1:runscriptcode:slogra=true:0:-1", 0, null);
	break;
	case 4:
	extext.__KeyValueFromString("message","[EX4]\n◆阿尔卡特皮肤出现\n◆BOSS血量翻倍\n◆NPC获得血量buff\n◆僵尸初始神器4个\n◆特殊天气");
	EntFireByHandle(extext,"Display","",0.01,activator,extext);
	EntFireByHandle(extext,"Kill","",10,extext,extext);
	EntFire("event_case_s4", "addoutput", "oncase09 boss_addhp_counter:SetValue:60:1:1", 1, null);

	EntFire("s_alucard_button", "addoutput", "origin -6648.830078 5222.132813 13280", 12, null);
 	
	break;
	case 5:
	extext.__KeyValueFromString("message","[EX5]\n◆阿尔卡特皮肤出现\n◆BOSS血量翻倍\n◆BOSS房间小蜘蛛获得加速BUFF\n◆NPC获得血量buff\n◆僵尸初始神器2个\n◆雾气环境");
	EntFireByHandle(extext,"Display","",0.01,activator,extext);
	EntFireByHandle(extext,"Kill","",10,extext,extext);
	EntFire("event_case_s5", "addoutput", "oncase08 boss_addhp_counter:SetValue:50:1:1", 1, null);

	EntFire("weather_relay_fog", "enable", null, 0.5, null);
	EntFire("weather_relay_fog", "trigger", null, 1, null);
	EntFire("s_alucard_button", "addoutput", "origin 6122.056152 4395.730957 12240", 10, null);

	EntFire("event_case_s5", "addoutput", "oncase08 g_npc_buff_health:disable::0:-1", 1, null);
 	EntFire("event_case_s5", "addoutput", "oncase08 g_npc_buff_speed:enable::0.1:-1", 1, null)
	break;
	case 6:
	extext.__KeyValueFromString("message","[EX6]\n◆阿尔卡特皮肤出现\n◆BOSS天台为止锁定血量\n◆BOSS血量翻倍\n◆NPC获得血量buff\n◆NPC数量增加3个\n◆人类神器增加固定刷新点2个\n◆僵尸初始神器4个\n◆特殊天气");
	EntFireByHandle(extext,"Display","",0.01,activator,extext);
	EntFireByHandle(extext,"Kill","",10,extext,extext);
	EntFire("boss_addhp_counter", "SetValue", 70, 15, null);

	EntFire("weather_case", "invalue", 7, 2, null);
	EntFire("s_alucard_button", "addoutput", "origin -7782.581543 2161.135986 11310", 10, null);
	EntFire("sqmaker", "addoutput", "origin -13736.728516 7237.248047 11424", 15, null);
 	EntFire("sqmaker", "forcespawn", "", 15.1, null);
 	EntFire("sqmaker", "addoutput", "origin -12723.723633 10810.005859 12864", 17, null);
 	EntFire("sqmaker", "forcespawn", "", 17.1, null);
 	EntFire("event_case_s6", "addoutput", "oncase16 stage_1:runscriptcode:tongguan():0:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase02 s_npc:addoutput:origin -13000 680 13760:0:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase02 s_npc:forcespawn::0.5:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase03 s_npc:addoutput:origin -14851.303711 8774.786133 11635:10:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase03 s_npc:forcespawn::10.5:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase04 s_npc:addoutput:origin -11645.498047 10810.131836 12864:10:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase04 s_npc:forcespawn::10.5:-1", 1, null);

 	EntFire("event_case_s6", "addoutput", "oncase03 s_tr_spikefloor:addoutput:origin -14690 9937.192383 11465:10:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase03 s_tr_spikefloor:forcespawn::10.5:-1", 1, null);


 	EntFire("event_case_s6", "addoutput", "oncase06 boss_sprite_hp:hidesprite::15.1:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase06 boss_counter:disable::0:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase06 boss_sprite_hp:showsprite::160:-1", 1, null);
 	EntFire("event_case_s6", "addoutput", "oncase06 boss_counter:enable::160:-1", 1, null);
	break;
	}
    }
	else
	{
	extext.__KeyValueFromString("message","◆通关第六关开启ex二周目\n◆ex模式有以下特点\n◆强化boss与npc血量\n◆增加NPC小怪与陷阱数量\n◆增加人类与僵尸神器数量\n◆增加新陷阱与僵尸神器\n◆特殊天气\n◆第二关及以后开始增加阿尔卡特皮肤\n注意:总回合合计为18时强制结束ex换图");
	extext.__KeyValueFromFloat("y",0.5);
	extext.__KeyValueFromString("color","255 255 255");
	extext.__KeyValueFromFloat("holdtime",5);
	EntFireByHandle(extext,"Display","",0.01,activator,extext);
	EntFireByHandle(extext,"Kill","",5,extext,extext);
	}
}

function stagecount()
{
	countbf++;
	if(countbf>=18)
	{
	local extext = Entities.CreateByClassname("game_text");
	extext.__KeyValueFromString("targetname","zftext");
	extext.__KeyValueFromString("color","205 150 00");
	extext.__KeyValueFromFloat("y",0.43);
	extext.__KeyValueFromFloat("x",0.15);
	extext.__KeyValueFromFloat("fadein",0.025);
	extext.__KeyValueFromFloat("fadeout",0.5);
	extext.__KeyValueFromFloat("holdtime",10);
	extext.__KeyValueFromFloat("fxtime",0.01);
	extext.__KeyValueFromInt("spawnflags",1);
	extext.__KeyValueFromInt("channel",5);
	extext.__KeyValueFromInt("effect",2);
	extext.__KeyValueFromString("message","[回合数已过载，为防止炸服请rtv更换地图(ex取消，且本回合无法通关)]\n[回合数已过载，为防止炸服请rtv更换地图(ex取消，且本回合无法通关)]\n[回合数已过载，为防止炸服请rtv更换地图(ex取消，且本回合无法通关)]");
	EntFireByHandle(extext,"Display","",0.01,activator,extext);
	EntFireByHandle(extext,"Kill","",10,extext,extext);
	ex=false;
	EntFire("game_winning_trigger_ctcheck", "kill", null,0, null);
	EntFire("game_server","command","sm_rcon mce_forcertv", 1, null);
	}
}

function test()
{
	EntFire("game_server","command","say koyo test", 0, null);
}

function tongguan()
{
	local extext = Entities.CreateByClassname("game_text");
	extext.__KeyValueFromString("targetname","extext");
	extext.__KeyValueFromString("color","105 250 100");
	extext.__KeyValueFromFloat("y",0.40);
	extext.__KeyValueFromFloat("x",0.25);
	extext.__KeyValueFromFloat("fadein",0.005);
	extext.__KeyValueFromFloat("fadeout",0.5);
	extext.__KeyValueFromFloat("holdtime",10);
	extext.__KeyValueFromFloat("fxtime",0.005);
	extext.__KeyValueFromInt("spawnflags",1);
	extext.__KeyValueFromInt("channel",3);
	extext.__KeyValueFromInt("effect",2);
	extext.__KeyValueFromString("message","恭喜通关ex模式");
	EntFireByHandle(extext,"Display","",0.01,activator,extext);
	EntFireByHandle(extext,"Kill","",10,extext,extext);
}

function spawnys()
{
	if(yunshi)
	{
 	EntFire("s_stonelaunch", "forcespawn", null,1, null);
 	EntFireByHandle(self,"runscriptcode","spawnys()",10,activator,activator);
   } 
}
function slash()
{
	if(slogra)
	{
 	EntFire("s_slash_maker", "forcespawn", null,0, null);
 	EntFireByHandle(self,"runscriptcode","slash()",0.3,activator,activator);
   } 
}

pl <- null;
function refresh()
{
	
	while(null != (pl = Entities.FindByClassname(pl, "player")))
{
	if(pl.GetTeam() == 2)
{

    EntFireByHandle(pl, "AddOutput", "rendermode 0", 0.0, pl, pl);

}
    EntFireByHandle(self,"runscriptcode","refresh()",1,null,null);
}


}

