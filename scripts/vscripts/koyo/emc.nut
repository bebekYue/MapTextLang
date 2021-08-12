gt <- Entities.FindByName(null, "bmcd")
cd <- 0
cd2 <- 5
cd3 <- 55
kg <- Entities.FindByName(null, "boss_phys_spider")
times <- 10
cannon1<-0
cannon2<-0


catext <- Entities.CreateByClassname("game_text");
catext.__KeyValueFromString("targetname","catext");
catext.__KeyValueFromString("color","205 250 50");
catext.__KeyValueFromFloat("y",0.5);
catext.__KeyValueFromFloat("x",0.1);
catext.__KeyValueFromFloat("fadein",0);
catext.__KeyValueFromFloat("fadeout",0.5);
catext.__KeyValueFromFloat("holdtime",10);
catext.__KeyValueFromFloat("fxtime",0);
catext.__KeyValueFromInt("spawnflags",1);
catext.__KeyValueFromInt("channel",5);
catext.__KeyValueFromInt("effect",2);
catext.__KeyValueFromString("message","┏━━━━━━━┓\n┃   "+cannon1+"     ┃     "+cannon2+"   ┃\n┗━━━━━━━┛\n       [船舱大炮]");

pl <- null;
function refresh()
{
	
	while(null != (pl = Entities.FindByClassname(pl, "player")))
	{
	if(pl.GetTeam() == 2)
	{

    EntFireByHandle(pl, "AddOutput", "rendermode 0", 0.0, pl, pl);

	}
  
	}

  EntFireByHandle(self,"runscriptcode","refresh()",1,null,null);
}


function cannoncd()
{
	
	if(cannon1!=0)
	{
	cannon1--; 						
	}
	if(cannon2!=0)
	{
	cannon2--; 							
	}
	catext.__KeyValueFromString("message","┏━━━━━━━┓\n┃   "+cannon1+"     ┃     "+cannon2+"   ┃\n┗━━━━━━━┛\n       [船舱大炮]");
	EntFireByHandle(catext,"Display","",0.01,activator,catext);
	EntFireByHandle(self, "runscriptcode", "cannoncd()", 1, null, null);
}

setext <- Entities.CreateByClassname("game_text");
setext.__KeyValueFromString("targetname","setext");
setext.__KeyValueFromString("color","105 250 100");
setext.__KeyValueFromFloat("y",0.48);
setext.__KeyValueFromFloat("x",0.1);
setext.__KeyValueFromFloat("fadein",0);
setext.__KeyValueFromFloat("fadeout",0.5);
setext.__KeyValueFromFloat("holdtime",10);
setext.__KeyValueFromFloat("fxtime",0);
setext.__KeyValueFromInt("spawnflags",1);
setext.__KeyValueFromInt("channel",3);
setext.__KeyValueFromInt("effect",2);
setext.__KeyValueFromString("message","*标记闪烁处为 触手打击船体方位");

function seam(num)
{
	setext.__KeyValueFromFloat("holdtime",0.1);
	if(num==2)
	{
	setext.__KeyValueFromString("message","▼");						
	}
	if(num==3)
	{
	setext.__KeyValueFromString("message","      		    ▼");					
	}
	if(num==4)
	{
	setext.__KeyValueFromString("message","	                         ▼");					
	}	
}

seahand<-true
function diseam()
{
if(seahand){
EntFireByHandle(setext,"Display","",0,activator,setext);
EntFireByHandle(self, "runscriptcode", "diseam()", 0.5, null, null);
}
}


function triggercannon()
{
	local ca1 = null;
	local ca2 = null;
	ca1 = Entities.FindByClassnameWithin(ca1,"func_rotating", para.GetOrigin(),100);
	ca2 = Entities.FindByClassnameWithin(ca2,"func_rotating", parb.GetOrigin(),100);
	EntFireByHandle(ca1, "addoutput", "onuser1 emcscript:runscriptcode:cannon1=10:0:-1", 0, ca1, ca1);
	EntFireByHandle(ca2, "addoutput", "onuser1 emcscript:runscriptcode:cannon2=10:0:-1", 0, ca2, ca2);
}

function speedalucard()
{
	EntFire("game_speed", "modifyspeed", 1.25, 0, activator);
	EntFire("game_speed", "modifyspeed", 1, 15, activator);
}








function falldmg()
{
	pl <- null;
	while(null != (pl = Entities.FindByClassname(pl, "player")))
{
	if(pl.GetMaxHealth() == 100)
	{
			EntFireByHandle(pl, "setdamagefilter", "fallfilter2", 0.0, null, null);
	}
}
}


function dmgft()
{
	pl <- null;
	while(null != (pl = Entities.FindByClassname(pl, "player")))
{
	if(pl.GetTeam() == 3)
	{
			EntFireByHandle(pl, "setdamagefilter", "fallfilter", 0.0, null, null);
	}
}
}



function killglock()
{
	local g = null;
	g = Entities.FindByClassnameWithin(g,"weapon_glock", kg.GetOrigin(),500);
	if(times!=0)
	{
	times--;
	EntFireByHandle(g,"kill","",0.00,null,null);
	EntFireByHandle(self, "runscriptcode", "killglock()", 0.2, null, null);
  }
}

function countdown()
{
	
	if(cd2!=0 )
	{
	cd2--; 							
	countmessage.__KeyValueFromString("message","还有"+cd2.tostring()+"秒准备逃亡");
	EntFire("countmessage", "showmessage", "", 0.01, null);
	EntFireByHandle(self, "runscriptcode", "countdown()", 1, null, null);
	}
 else
 {
  EntFireByHandle(self, "runscriptcode", "countdown2()", 0, null, null);
 }

}

function countdown2()
{

	if(cd3!=0)
	{
	cd3--; 	
	countmessage.__KeyValueFromString("message","逃离高塔,大门打开剩余 "+cd3.tostring()+" 秒,快跑![人类暂时获得免摔伤(除贝尔蒙特)]");
	EntFire("countmessage", "showmessage", "", 0.01, null);
	EntFireByHandle(self, "runscriptcode", "countdown2()", 1, null, null);
	}
	else
 {
  EntFire("countmessage", "kill", "", 0.0, null);
 }
}

function wb()
{
	ScriptPrintMessageChatAll(" \x02 --------- 弱点打击状态:神器与高爆此时能对BOSS造成大量伤害与硬直:持续10秒 (此状态随机出现)");

}

function show()
{
	printl("test");
}


para <- Entities.CreateByClassname("info_particle_system");
para.__KeyValueFromString("targetname","para");
para.__KeyValueFromString("origin","-14576 14016 14496");

parb <- Entities.CreateByClassname("info_particle_system");
parb.__KeyValueFromString("targetname","parb");
parb.__KeyValueFromString("origin","-14128 14016 14496");


sqmaker <- Entities.CreateByClassname("env_entity_maker");
sqmaker.__KeyValueFromString("targetname","sqmaker");
sqmaker.__KeyValueFromString("EntityTemplate","s_wr");


fallfilter <- Entities.CreateByClassname("filter_damage_type");
fallfilter.__KeyValueFromString("targetname","fallfilter");
fallfilter.__KeyValueFromFloat("damagetype",262144);
fallfilter.__KeyValueFromFloat("Negated",0);
fallfilter2 <- Entities.CreateByClassname("filter_damage_type");
fallfilter2.__KeyValueFromString("targetname","fallfilter2");
fallfilter2.__KeyValueFromFloat("damagetype",32);
fallfilter2.__KeyValueFromFloat("Negated",1);
countmessage <- Entities.CreateByClassname("env_message");
countmessage.__KeyValueFromString("targetname","countmessage");
countmessage.__KeyValueFromFloat("spawnflags",2);
countmessage.__KeyValueFromFloat("messagevolume",10);
countmessage.__KeyValueFromString("message","5");
