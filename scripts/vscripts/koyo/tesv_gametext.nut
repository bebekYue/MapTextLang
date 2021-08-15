

gtc <- 0
gtc2 <- 0
gtc3 <- 0
gtc4 <- 0
gtc5 <- 0
gtc6 <- 0
gtc7 <- 0
gtc8 <- 0
gtc9 <- 0
gtc10 <- 0
gtc11 <- 0
gtc12 <- 0
gtc13 <- 0
gtc14 <- 0
gtc15 <- 0
gtc16 <- 0
pb <- Entities.FindByName(null, "archmage_phbox")
pb2 <- Entities.FindByName(null, "mg_phbox")
pb3 <- Entities.FindByName(null, "dr_phys")
pb4 <- Entities.FindByName(null, "doh_phbox")
pb5 <- Entities.FindByName(null, "night_phbox")
pb6 <- Entities.FindByName(null, "dr_phbox")
pb7 <- Entities.FindByName(null, "giant_phbox")
pb8 <- null
pb9 <- null



kgt <- Entities.FindByName(null, "kgt")
kgt2 <- Entities.FindByName(null, "kgt2")
kgt3 <- Entities.FindByName(null, "kgt3")
kgt4 <- Entities.FindByName(null, "kgt4")
kgt5 <- Entities.FindByName(null, "kgt5")
kgt6 <- Entities.FindByName(null, "kgt6")
kgt7 <- Entities.FindByName(null, "kgt7")

kgt8 <- null
kgt9 <- null


function rld()
{
	ScriptPrintMessageChatAll("koyo");
}

function gts7()
{
	EntFireByHandle(self, "runscriptcode", "gts7()", 1, null, null);
	if(gtc11 !=0 )
	{
		gtc11--; 							
	}
	if(gtc12 !=0)
	{
		gtc12--;			
	}
	kgt7.__KeyValueFromString("message","◇ : "+gtc11.tostring()+"                  ◆ : "+gtc12.tostring()+"\n\n         ✚  :  "+pb7.GetHealth());
}


function gts6()
{
	kgt6.__KeyValueFromString("message","                ☠ \n\n       ✚  :  "+pb6.GetHealth());
}



function gts()
{
	EntFireByHandle(self, "runscriptcode", "gts()", 1, null, null);
	if(gtc !=0 )
	{
		gtc--; 							
	}
	if(gtc2 !=0)
	{
		gtc2--;			
	}
	kgt.__KeyValueFromString("message","◇ : "+gtc.tostring()+"                  ◆ : "+gtc2.tostring()+"\n\n         ✚  :  "+pb.GetHealth());
}

function gts2()
{

	EntFireByHandle(self, "runscriptcode", "gts2()", 1, null, null);
	if(gtc3 !=0 )
	{
		gtc3--; 							
	}
	if(gtc4 !=0)
	{
		gtc4--;			
	}
	kgt2.__KeyValueFromString("message","◇ : "+gtc3.tostring()+"                  ◆ : "+gtc4.tostring()+"\n\n         ✚  :  "+pb2.GetHealth());
}

function gts3()
{

	EntFireByHandle(self, "runscriptcode", "gts3()", 1, null, null);
	if(gtc5 !=0 )
	{
		gtc5--; 							
	}
	if(gtc6 !=0)
	{
		gtc6--;			
	}
	kgt3.__KeyValueFromString("message","◇ : "+gtc5.tostring()+"                  ◆ : "+gtc6.tostring()+"\n\n         ✚  :  "+pb3.GetHealth());
}

function gts4()
{

	EntFireByHandle(self, "runscriptcode", "gts4()", 1, null, null);
	if(gtc7 !=0 )
	{
		gtc7--; 							
	}
	if(gtc8 !=0)
	{
		gtc8--;			
	}
	kgt4.__KeyValueFromString("message","◇ : "+gtc7.tostring()+"                  ◆ : "+gtc8.tostring()+"\n\n         ✚  :  "+pb4.GetHealth());
}



function gts5()
{

	EntFireByHandle(self, "runscriptcode", "gts5()", 1, null, null);
	if(gtc9 !=0 )
	{
		gtc9--; 							
	}
	if(gtc10 !=0)
	{
		gtc10--;			
	}
	kgt5.__KeyValueFromString("message","           ➴ : "+gtc10.tostring()+"\n\n         ✚  :  "+pb5.GetHealth());
}





function jinengjieshao(pifu)
{
	local jntext = Entities.CreateByClassname("game_text");
	jntext.__KeyValueFromString("color","105 255 105");
	jntext.__KeyValueFromFloat("y",0.43);
	jntext.__KeyValueFromFloat("x",0);
	jntext.__KeyValueFromFloat("fadein",1);
	jntext.__KeyValueFromFloat("fadeout",2);
	jntext.__KeyValueFromFloat("holdtime",15);
	jntext.__KeyValueFromFloat("fxtime",10);
	jntext.__KeyValueFromInt("spawnflags",0);
	jntext.__KeyValueFromInt("channel",3);
	if(pifu=="dawei"||pifu==1)
	{
	jntext.__KeyValueFromString("message","|左键:前方小范围挥砍\nlv2:500伤害并轻微击退\nlv3:500伤害并定身1秒\nlv4:1000伤害并稍强击退\n\n|右键:前方直线范围魔法\nlv2:燃烧3秒并中幅度减速(至多造成8000伤害)\nlv3:冰冻3.5秒且大幅度减速\nlv4:大幅度击退");
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="dp"||pifu==2)
	{
	jntext.__KeyValueFromString("message","|被动:*\n免疫人类枪械击退\n中幅度降低自身中等范围人类速度\n并且秒杀自身小范围内的人类\n\n|右键:[1次]\n定身特大范围人类并在延迟4秒后秒杀");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="yeing"||pifu==3)
	{
	jntext.__KeyValueFromString("message","|被动:\n移动速度增加0.17\n\n|右键:\n射出一支具有1500伤害的箭矢");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="juren"||pifu==4)
	{
	jntext.__KeyValueFromString("message","|左键:\n对前方小范围造成200伤害\n\n|右键:\n中幅度减速大范围内人类速度4秒");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="xiaofa"||pifu==5)
	{
	jntext.__KeyValueFromString("message","|左键:燃烧火球\n发射一枚火球对对前方直线范围造成375伤害(至多造成1500伤害)\n\n|右键:治愈魔法\n自身小范围每0.5秒恢复150HP持续4秒");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="dc"||pifu==6)
	{
	jntext.__KeyValueFromString("message","|左键:前方小范围挥砍\n造成500伤害并轻微击退\n\n|右键:[2次]\n定身自身5秒咏唱后释放以自身为中心大范围破坏魔法\n造成20000伤害");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="dafa"||pifu==7)
	{
	jntext.__KeyValueFromString("message","|左键:击退光束\n发射轻微击退前方直线范围内敌人的激光\n\n|右键:焚烧热浪\n固定自身6秒并向前方长直线释放火魔法\n造成中等幅度减速与450伤害持续6秒(至多造成约6000伤害)");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="bz"||pifu==8)
	{
	jntext.__KeyValueFromString("message","|E键:寒冰权杖\n释放持续4秒的前方小范围冰冻魔法 特大幅度减速敌人5秒");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="hb"||pifu==9)
	{
	jntext.__KeyValueFromString("message","|灵魂火炬：\n带着它点亮大门旁的两个火盆或许能加快大门的开启(提前20s)");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="lg"||pifu==11)
	{
	jntext.__KeyValueFromString("message","|机关拉杆：\n似乎是用来修复大门的机关");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",7,jntext,jntext);
	}
	if(pifu=="nz"||pifu==10)
	{
	jntext.__KeyValueFromString("message","|E键:治疗权杖\n释放跟随自身的治疗魔法\n每秒恢复300hp持续4秒");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="jz"||pifu==12)
	{
	jntext.__KeyValueFromString("message","|上古卷轴:\n使用后能对奥杜因造成巨额伤害(1600)\n需要在左下角使用提示出现后使用才有效");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="ww"||pifu==13)
	{
	jntext.__KeyValueFromString("message","皮肤血量:7500\n\n|左键:\n对前方小范围造成75伤害\n\n|右键:\n自身3秒内小范围内小幅度减速人类3秒\nCD:25秒");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}
	if(pifu=="troll"||pifu==14)
	{
	jntext.__KeyValueFromString("message","皮肤血量:10000\n\n|左键:\n对前方小范围造成150伤害\n\n|右键:\n恢复自身1500皮肤血量\n并使自身中等范围内僵尸血量恢复至10000持续两秒\nCD:35秒");      
	EntFireByHandle(jntext,"Display","",0.01,activator,jntext);
	EntFireByHandle(jntext,"Kill","",15,jntext,jntext);
	}

}


