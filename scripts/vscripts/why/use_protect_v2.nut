// 本脚本用于处理按E卡模型的问题,必须配合神器隐藏一起使用!!!!!!!
// 只是单纯需要神器保护请使用use_protect.nut
//modify:
//{
//	match:
//	{
//		"classname" "func_button"
//	}
//	insert:
//	{
//		"vscripts" "why/use_protect_v2.nut"
//	}
//}
if(self.GetRootMoveParent()==null)return;
if(self.GetRootMoveParent().GetClassname().find("weapon_")!=0)return;
local ent=Entities.FindByName(null, "load_script");
if(ent==null)return;
if(!("HIDE_SWITCH" in ent.GetScriptScope()))return;
ent.GetScriptScope().WEAPON.push(self.GetRootMoveParent());
ent.GetScriptScope().BUTTON_LIST.push(self);
ent.GetScriptScope().OLD_OWNER.push("");
ent.GetScriptScope().HIGH_LIGHT.push("");
function InputUse(){
    EntFire("load_script", "runscriptcode", "PlayerUseItem()", 0.0, activator);
    return false;
}
