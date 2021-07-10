
function falldmg()
{
	pl <- null;
	while(null != (pl = Entities.FindByClassname(pl, "player")))
{
	if(pl.GetMaxHealth() == 100)
	{
			EntFireByHandle(pl, "setdamagefilter", "No_Damage", 0.0, null, null);
	}
}
}

function rld()
{
	ScriptPrintMessageChatAll("koyo");
}
