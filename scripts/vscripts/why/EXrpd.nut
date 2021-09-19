// sm_entfire exmode runscriptcode "ToggleEx()"
exmode<-false;
zm_buff_num<-3;
hm_buff_num<-1;
zm_buff<-[
    ["僵尸BUFF：毒降价6500→4500","sm_rcon sm_xsys_config change xsys.items.poison.price 4500"],
    ["僵尸BUFF：毒范围半径192→225","sm_rcon sm_xsys_config change xsys.zmpoison.radius 225"],
    ["僵尸BUFF：毒时间5→10","sm_rcon sm_xsys_config change xsys.zmpoison.duration 10"],
    ["僵尸BUFF：尸变比6：1→4：1","sm_cvar zr_infect_mzombie_ratio 5"],
    ["僵尸BUFF：毒伤害10→15","sm_rcon sm_xsys_config change xsys.zmpoison.damage 15"],
    ["僵尸BUFF：毒次数3→10","sm_rcon sm_xsys_config change xsys.items.poison.limit 10"],
    ["僵尸BUFF：加速cd25→20","sm_cvar zr_speed_delay 20"],
    ["僵尸BUFF：母体毒1→3","sm_rcon sm_xsys_config change xsys.zmpoison.mzmpoison 3"]
];
hm_buff<-[
    ["人类BUFF：加血雷+2","sm_cvar sm_flash_limit 3"],
    ["人类BUFF：手雷+1，血量+50","sm_cvar sm_he_limit 4","sm_rcon sm_sethealth @ct 188"],
    ["人类BUFF：加血雷+1，价格下调至4500","sm_cvar sm_flash_limit 2","sm_rcon sm_xsys_config change xsys.items.flash.price 4500"],
    ["人类BUFF：加血雷价格下调至2500","sm_rcon sm_xsys_config change xsys.items.flash.price 2500"]
];
reset_buff<-[
    "sm_rcon sm_xsys_config change xsys.items.poison.price 4500","sm_rcon sm_xsys_config change xsys.zmpoison.radius 192",
    "sm_rcon sm_xsys_config change xsys.zmpoison.duration 5","sm_cvar zr_infect_mzombie_ratio 7","sm_rcon sm_xsys_config change xsys.zmpoison.damage 10",
    "sm_rcon sm_xsys_config change xsys.items.poison.limit 3","sm_cvar zr_speed_delay 25","sm_rcon sm_xsys_config change xsys.zmpoison.mzmpoison 1",
    "sm_cvar sm_flash_limit 1","sm_cvar sm_he_limit 3","sm_rcon sm_xsys_config change xsys.items.flash.price 6500"
]

textEnt<-null;
message<-null;

function ToggleEx(){
    exmode=!exmode;
    if(exmode){
        SendToConsoleServer("sm_rcon sm_xsys_config change xsys.storecat.powerups.disabled false");
        SendToConsoleServer("sm_rcon sm_xsys_config change xsys.storecat.zombies.disabled false");
        Init();
        ScriptPrintMessageChatAll(" \x03 exmode 已启动\x01");
    }else{
        SendToConsoleServer("sm_rcon sm_xsys_config change xsys.storecat.powerups.disabled true");
        SendToConsoleServer("sm_rcon sm_xsys_config change xsys.storecat.zombies.disabled true");
        foreach(k in reset_buff){
            SendToConsoleServer(k);
        }
        ScriptPrintMessageChatAll(" \x03 exmode 已关闭\x01");
    }
}

function Init(){
    if(!exmode){
        return;
    }
    foreach(k in reset_buff){
        SendToConsoleServer(k);
    }
    textEnt=Entities.CreateByClassname("game_text");
    textEnt.__KeyValueFromInt("spawnflags", 1);
    textEnt.__KeyValueFromString("message", "警察局EX难度\n插件技能将会开放购买，僵尸将会获得随机3个buff\n技能cd减短、商店降价、僵尸毒增强等\n人类随机获得一个buff：\n物品降价、初始血量增加、雷数量增加等");
    textEnt.__KeyValueFromInt("channel", 1);
    textEnt.__KeyValueFromFloat("holdtime", 1.0);
    textEnt.__KeyValueFromFloat("x", 0.02);
    textEnt.__KeyValueFromFloat("y", 0.4);
    textEnt.__KeyValueFromString("color", "255 255 255");
    EntFireByHandle(textEnt, "Display", "", 0.0, null, null);
    message="";
    SetBuff(zm_buff,zm_buff_num);
    SetBuff(hm_buff,hm_buff_num);
    EntFireByHandle(self, runscriptcode, "SetText()", 10.0, null, null);
}

function SetBuff(list,times){
    local buff_list=[];
    buff_list.extend(list);
    for(local t=0;t<times;t++){
        local idx=RandomInt(0, buff_list.len()-1);
        for(local j=1;j<buff_list[idx].len();j++){
            SendToConsoleServer(buff_list[idx][j]);
        }
        message=message+"\n"+buff_list[idx][0];
        buff_list.remove(idx);
    }
    
}

function SetText(){
    textEnt.__KeyValueFromString("message",message);
}

think_delay<-10;
function Think(){
    if(!exmode){
        return;
    }
    if(think_delay!=0){
        think_delay--;
        return;
    }
    think_delay=10;
    if(textEnt!=null&&textEnt.IsValid()){
        EntFireByHandle(textEnt, "Display", "", 0.0, null, null);
    }
}
