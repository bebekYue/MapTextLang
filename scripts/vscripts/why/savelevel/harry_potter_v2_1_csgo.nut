function RestoreItemLevel(pl){
    try{
        if(pl.handle.GetName() != "player_s" && pl.handle.GetName() != "harrypotter")
        {
            EntFire("!activator", "RunScriptFile", "kinlkm/ze_harry_potter_v2_1_csgo/harry_player_fix.nut", 0.00, pl.handle);
            EntFire("!activator", "AddOutput", "targetname player_s", 0.01, pl.handle);
        }
    }catch(e){
        logText(e);
    }
}
