currentHp<-0;
maxHp<-0;
hpEnable<-false;
subMode<-true;
textEnt<-null;
tickTime<-1.0;
textChannel<-5;
function SetMaxHp(max,sub=true){
    currentHp=max;
    maxHp=max;
    subMode=sub;
    hpEnable=true;
    hpTick();
}

function SetChannel(channel){
    if(channel<0||channel>5)return;
    textChannel=channel;
    if(textEnt!=null){
            textEnt.__KeyValueFromInt("channel", channel);
    }
}

function hpTick(){
    if(hpEnable){
        if(textEnt==null){
            textEnt=Entities.CreateByClassname("game_text");
            textEnt.__KeyValueFromInt("spawnflags", 1);
            textEnt.__KeyValueFromString("message", "血量："+currentHp+"/"+maxHp);
            textEnt.__KeyValueFromInt("channel", textChannel);
            textEnt.__KeyValueFromFloat("holdtime", 1.0);
            textEnt.__KeyValueFromFloat("x", 0.6);
            textEnt.__KeyValueFromFloat("y", -1);
            textEnt.__KeyValueFromString("color", "255 255 255");
        }
        textEnt.__KeyValueFromString("message", "血量："+currentHp+"/"+maxHp);
        EntFireByHandle(textEnt, "Display", "", 0.0, null, null);
        EntFireByHandle(self, "runscriptcode", "hpTick()", tickTime, null, null);
    }else{
        textEnt.Destroy();
        textEnt=null;
    }
}

function Inputsubtract(){
    try{
        if(subMode&&hpEnable){
            currentHp--;
            if(currentHp<1)hpEnable=false;
        }
    }catch(e){

    }
    return true;
}

function Inputadd(){
    try{
        if(!subMode&&hpEnable){
            currentHp--;
            if(currentHp<1)hpEnable=false;
        }
    }catch(e){

    }
    return true;
}
