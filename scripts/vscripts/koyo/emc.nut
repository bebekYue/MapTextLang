gt <- Entities.FindByName(null, "bmcd")
cd <- 0
cd2 <- 5
cd3 <- 55
cd4 <- 10


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





function bmcd()
{
	EntFireByHandle(self, "runscriptcode", "bmcd()", 1, null, null);
	if(cd !=0 )
	{
		cd--;
		gt.__KeyValueFromString("message","           大招冷却时间 : "+cd.tostring());						
	}
	else
	{
	 gt.__KeyValueFromString("message","           大招准备完毕√");	
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
  if(cd4!=0)
  {
  cd4--;
	countmessage.__KeyValueFromString("message","弱点打击状态:神器与高爆此时能对BOSS造成大量伤害与硬直:持续"+cd4.tostring()+" 秒(此状态随机出现)");
	EntFire("countmessage", "showmessage", "", 0.0, null);
	EntFireByHandle(self, "runscriptcode", "wb()", 1, null, null);
  }
}



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
