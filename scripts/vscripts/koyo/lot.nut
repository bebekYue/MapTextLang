
function chusi(){
	if(activator.GetMaxHealth() == 60000)
{
	
	EntFireByHandle(activator, "SetHealth", "-999999", 3.10, null, null);
	EntFireByHandle(activator, "SetHealth", "-999999", 6.10, null, null);
	EntFireByHandle(activator, "AddOutput", "max_health 100", 0.0, null, null);
	EntFireByHandle(activator, "AddOutput", "rendermode 0", 0.0, null, null);
	EntFireByHandle(activator, "SetDamageFilter", "", 0.0, null, null);
	EntFireByHandle(activator, "SetDamageFilter", "", 3.1, null, null);
	EntFire("speedmod", "modifyspeed", "0", 0.2, activator);
	EntFire("speedmod", "modifyspeed", "0", 3.1, activator);
	local g = null;
	g = Entities.FindByClassnameWithin(g,"func_water_analog", activator.GetOrigin(),10);
	local c = null;
	c = Entities.FindByClassnameWithin(c, "func_physbox_multiplayer", activator.GetOrigin(), 10);
	local k = null;
	k = Entities.FindByClassnameWithin(k, "prop_dynamic", activator.GetOrigin(), 10);
	EntFireByHandle(g,"kill","",0.00,null,null);
	EntFireByHandle(c,"break","",0.00,null,null);
	EntFireByHandle(k,"kill","",0.1,null,null);
	EntFire("mspeed", "disable", "0", 0.1, null);
	EntFire("mspeed", "enable", "0", 6.1, null);
	}
}


