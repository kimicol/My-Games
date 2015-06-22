/*Cats and Mice Version 1.2 By mephilip

If you wish to contact me email me @ phi_l_ip@hotmail.com

///CHANGES\\\

Since 1.1
-Simplified code
-Changed look of map
-Mice now get settler wagons instead of explorers
-There are no longer at least to cree native villages
-Increased outpost limit to 75 for mice
-Houses now give emergency super speed

Since 1.0
-Cassadores can no longer be built
-Cats get George Crushington
-Map looks a lot different
-Germans can not upgrade dopps

///DESCRIPTION\\\

In this map there are 2 teams. Team 1 is the mice and team2 is the cats. In order for team 2 to win the must kill all of team 1's units. In order for team 1 to win they must stay alive for half an hour. There is native village per player. Each player on team 1 starts with just a settler wagon while each player on team 2 starts with an explorer and a barracks. The barracks can only produce dopplesoldners but they are much stronger than normal ones. Team 1 can only build 4 buildings houses, outposts, walls and trade posts. Houses are important because when they are built they give the mice a 10 second speed boost that can help a lot.

*/

int num=0;

void placetrees(float fx =.5,float fy =.5){

int Forest=rmCreateArea("Forest"+num);
rmSetAreaSize(Forest, .01, .01);
rmSetAreaForestType(Forest, "Great Plains Forest");
rmSetAreaLocation(Forest, fx, fy);
rmSetAreaMinBlobs(Forest, 1);
rmSetAreaMaxBlobs(Forest, 1);
rmSetAreaCoherence(Forest, 1);
rmSetAreaSmoothDistance(Forest, 1);
rmBuildArea(Forest);
int tree = rmCreateObjectDef("Tree"+num);
rmAddObjectDefItem(tree,"TreeGreatPlains",1,10);
rmPlaceObjectDefInArea(tree,0,Forest,2000);
num=num+1;
}

void placepond(float fx =.5,float fy =.5){

int pond=rmCreateArea("pond"+num);
rmSetAreaSize(pond, .008, .008);
rmSetAreaWaterType(pond, "texas pond");
rmSetAreaBaseHeight(pond, -10);
rmSetAreaMinBlobs(pond, 1);
rmSetAreaMaxBlobs(pond, 1);
rmSetAreaCoherence(pond, 1);
rmSetAreaSmoothDistance(pond, 5);
rmSetAreaLocation(pond, fx, fy);
rmBuildArea(pond);

num=num+1;
}

void main(void) { 
rmSetStatusText("",0.01);

int playerTiles=12000;
int size=2.0*sqrt(cNumberNonGaiaPlayers*playerTiles);
rmSetMapSize(size, size);
rmSetSeaLevel(-11);

rmTerrainInitialize("carolina_grass", 0);	
rmSetLightingSet("carolina");
rmSetMapType("grass");
rmSetMapType("land");
rmSetWorldCircleConstraint(true);

rmSetStatusText("",0.10);

if ( cNumberTeams > 2 ){
}else{
rmSetPlacementTeam(0);
rmSetPlacementSection(0.25, 0.26);
rmPlacePlayersCircular(0.32, 0.32, 0);
	
rmSetPlacementTeam(1);
rmSetPlacementSection(0.75, 0.76);
rmPlacePlayersCircular(0.32, 0.32, 0);
}

float playerFraction=rmAreaTilesToFraction(500);
for(i=1; <cNumberPlayers)
{
int id=rmCreateArea("Player"+i);
rmSetPlayerArea(i, id);
rmSetAreaSize(id, playerFraction, playerFraction);
rmSetAreaMinBlobs(id, 1);
rmSetAreaMaxBlobs(id, 1);
rmSetAreaLocPlayer(id, i);
}

rmSetStatusText("",0.15);

int cliffs=rmCreateArea("surrounding cliffs");
rmSetAreaSize(cliffs, 0.9, 0.9);
rmSetAreaWarnFailure(cliffs, false);
rmSetAreaMix(cliffs, "texas_dirt");
rmSetAreaCoherence(cliffs, 0.9);
rmSetAreaLocation(cliffs, 0.5, 0.5);
rmSetAreaCliffType(cliffs, "Texas");
rmSetAreaCliffEdge(cliffs, 1, 1.0, 0.0, 0.0, 0);
rmSetAreaCliffHeight(cliffs, -10, 1.0, 0.3);
rmSetAreaCliffPainting(cliffs, false, false, true);
rmBuildArea(cliffs);

rmSetStatusText("",0.20);


placetrees(.5,.8);
placetrees(.5,.7);
placetrees(.5,.6);
placetrees(.5,.5);
placetrees(.5,.4);
placetrees(.5,.3);
placetrees(.5,.2);
placetrees(.95,.5);
placetrees(.7,.5);
placetrees(.6,.5);
placetrees(.4,.5);
placetrees(.3,.5);
placetrees(.05,.5);
placetrees(.2,.2);
placetrees(.2,.8);
placetrees(.8,.2);
placetrees(.8,.8);

rmSetStatusText("",0.30);

if(cNumberNonGaiaPlayers>=4){

placepond(.66,.66);
placepond(.33,.66);
placepond(.66,.33);
placepond(.33,.33);

}

rmSetStatusText("",0.40);

rmBuildAllAreas();

int middle = rmCreateObjectDef("Revealer");
rmAddObjectDefItem(middle,"CinematicRevealer",1,1000);
rmPlaceObjectDefAtLoc(middle,0,.5,.5,1);

rmSetStatusText("",0.50);
rmAllocateSubCivs(12);

rmSetSubCiv(0, "Comanche");
rmSetSubCiv(1, "Iroquois"); 
rmSetSubCiv(2, "Aztecs");
rmSetSubCiv(3, "Maya");
rmSetSubCiv(4, "Lakota");
rmSetSubCiv(5, "Nootka");
rmSetSubCiv(6, "Cherokee");
rmSetSubCiv(7, "Cree");
rmSetSubCiv(8, "Tupi");
rmSetSubCiv(9, "Caribs");
rmSetSubCiv(10, "Seminoles");
rmSetSubCiv(11, "Incas");

float natdist = .9;
int nativenum = rmRandInt(1,12);

for(i = 1; <= cNumberNonGaiaPlayers) {

nativenum = rmRandInt(1,11);

if (nativenum == 1)
{
int comancheVillageID = -1;
comancheVillageID = rmCreateGrouping("comanche village", "native comanche village 1");
rmSetGroupingMinDistance(comancheVillageID, 0.0);
rmSetGroupingMaxDistance(comancheVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(comancheVillageID, 0, 0.5, 0.5);
}

if (nativenum == 2)
{  
int iroquoisVillageID = -1;
iroquoisVillageID = rmCreateGrouping("iroquois village", "native iroquois village 1");
rmSetGroupingMinDistance(iroquoisVillageID, 0.0);
rmSetGroupingMaxDistance(iroquoisVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(iroquoisVillageID, 0, 0.5, 0.5);
} 

if (nativenum == 3)
{  
int aztecsVillageID = -1;
aztecsVillageID = rmCreateGrouping("aztecs village", "native aztec village 1");
rmSetGroupingMinDistance(aztecsVillageID, 0.0);
rmSetGroupingMaxDistance(aztecsVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(aztecsVillageID, 0, 0.5, 0.5);
}

if (nativenum == 4)
{  
int mayaVillageID = -1;
mayaVillageID = rmCreateGrouping("maya village", "native maya village 1");
rmSetGroupingMinDistance(mayaVillageID, 0.0);
rmSetGroupingMaxDistance(mayaVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(mayaVillageID, 0, 0.5, 0.5);
} 
	
if (nativenum == 5)
{  
int lakotaVillageID = -1;
lakotaVillageID = rmCreateGrouping("lakota village", "native lakota village 1");
rmSetGroupingMinDistance(lakotaVillageID, 0.0);
rmSetGroupingMaxDistance(lakotaVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(lakotaVillageID, 0, 0.5, 0.5);
} 

if (nativenum == 6)
{  
int nootkaVillageID = -1;
nootkaVillageID = rmCreateGrouping("nootka village", "native nootka village 1");
rmSetGroupingMinDistance(nootkaVillageID, 0.0);
rmSetGroupingMaxDistance(nootkaVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(nootkaVillageID, 0, 0.5, 0.5);
} 

if (nativenum == 7)
{  
int cherokeeVillageID = -1;
cherokeeVillageID = rmCreateGrouping("cherokee village", "native cherokee village 1");
rmSetGroupingMinDistance(cherokeeVillageID, 0.0);
rmSetGroupingMaxDistance(cherokeeVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(cherokeeVillageID, 0, 0.5, 0.5);
}

if (nativenum == 8)
{  
int tupiVillageID = -1;
tupiVillageID = rmCreateGrouping("tupi village", "native tupi village 1");
rmSetGroupingMinDistance(tupiVillageID, 0.0);
rmSetGroupingMaxDistance(tupiVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(tupiVillageID, 0, 0.5, 0.5);
}

if (nativenum == 9)
{  
int caribsVillageID = -1;
caribsVillageID = rmCreateGrouping("caribs village", "native carib village 1");
rmSetGroupingMinDistance(caribsVillageID, 0.0);
rmSetGroupingMaxDistance(caribsVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(caribsVillageID, 0, 0.5, 0.5);
} 
		
if (nativenum == 10)
{  
int seminolesVillageID = -1;
seminolesVillageID = rmCreateGrouping("seminoles village", "native seminole village 1");
rmSetGroupingMinDistance(seminolesVillageID, 0.0);
rmSetGroupingMaxDistance(seminolesVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(seminolesVillageID, 0, 0.5, 0.5);
} 

if (nativenum == 11)
{  
int incasVillageID = -1;
incasVillageID = rmCreateGrouping("incas village", "native inca village 1");
rmSetGroupingMinDistance(incasVillageID, 0.0);
rmSetGroupingMaxDistance(incasVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(incasVillageID, 0, 0.5, 0.5);
}

if (nativenum == 12)
{
int creeVillageID = -1;
creeVillageID = rmCreateGrouping("cree village", "native cree village 1");
rmSetGroupingMinDistance(creeVillageID, 0.0);
rmSetGroupingMaxDistance(creeVillageID, rmXFractionToMeters(natdist));
rmPlaceGroupingAtLoc(creeVillageID, 0, 0.5, 0.5);
}
}

rmSetStatusText("",0.60);

int spawn = 0;

for(i = 1; <= cNumberNonGaiaPlayers) {
if(rmGetPlayerTeam(i)==1){
int bar = rmCreateObjectDef("Barracks"+i);
rmAddObjectDefItem(bar,"Barracks",1,8);
rmPlaceObjectDefAtLoc(bar,i,rmPlayerLocXFraction(i),rmPlayerLocZFraction(i),1);

int unit = rmCreateObjectDef("Explorer"+i);
rmAddObjectDefItem(unit,"Explorer",1,10);
rmPlaceObjectDefAtLoc(unit,i,rmPlayerLocXFraction(i),rmPlayerLocZFraction(i),1);
} else {
int unit2 = rmCreateObjectDef("Settler"+i);
rmAddObjectDefItem(unit2,"SettlerWagon",1,10);
rmPlaceObjectDefAtLoc(unit2,i,rmPlayerLocXFraction(i),rmPlayerLocZFraction(i),1);
}
}

rmSetStatusText("",0.70);


rmCreateTrigger("Starting Stuff");
rmSwitchToTrigger(rmTriggerID("Starting Stuff"));
rmSetTriggerActive(true);
rmSetTriggerRunImmediately(true);
rmSetTriggerPriority(4);

rmAddTriggerCondition("Always");

rmAddTriggerEffect("Rate Training");
rmSetTriggerEffectParamInt("Rate", 10);

rmAddTriggerEffect("Rate Construction");
rmSetTriggerEffectParamInt("Rate", 10);

for(i = 1; <= cNumberNonGaiaPlayers) {

rmAddTriggerEffect("Player Set HC Access");
rmSetTriggerEffectParamInt("Player", i);
rmSetTriggerEffectParam("HCAccess", "false");

rmAddTriggerEffect("Player : SetAge");
rmSetTriggerEffectParamInt("Player", i);
rmSetTriggerEffectParamInt("Age", 1);
rmSetTriggerEffectParam("DisplayEffect", "true");

rmAddTriggerEffect("Player : SetAge");
rmSetTriggerEffectParamInt("Player", i);
rmSetTriggerEffectParamInt("Age", 2);
rmSetTriggerEffectParam("DisplayEffect", "true");

rmAddTriggerEffect("Player : SetAge");
rmSetTriggerEffectParamInt("Player", i);
rmSetTriggerEffectParamInt("Age", 3);
rmSetTriggerEffectParam("DisplayEffect", "true");

rmAddTriggerEffect("Player : SetAge");
rmSetTriggerEffectParamInt("Player", i);
rmSetTriggerEffectParamInt("Age", 4);
rmSetTriggerEffectParam("DisplayEffect", "true");

rmAddTriggerEffect("Grant Resources");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("ResName", "Gold");
rmSetTriggerEffectParamInt("Amount", 100000);

rmAddTriggerEffect("Grant Resources");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("ResName", "Food");
rmSetTriggerEffectParamInt("Amount", 100000);

rmAddTriggerEffect("Grant Resources");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("ResName", "Wood");
rmSetTriggerEffectParamInt("Amount", 100000);

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "TownCenter");

rmAddTriggerEffect("Set Tech Status");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("TechID", 358);
rmSetTriggerEffectParamInt("Status", 2);

if(rmGetPlayerTeam(i)==0){
rmAddTriggerEffect("Set Tech Status");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("TechID", 428);
rmSetTriggerEffectParamInt("Status", 2);

rmAddTriggerEffect("Set Tech Status");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("TechID", 428);
rmSetTriggerEffectParamInt("Status", 2);

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Arsenal");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "ArtilleryDepot");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Bank");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Barracks");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Blockhouse");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Capitol");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Church");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Dock");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "LivestockPen");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Manor");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Market");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Mill");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Plantation");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Stable");

rmAddTriggerEffect("Modify Protounit");
rmSetTriggerEffectParam("Protounit", "Outpost");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("Field", 10);
rmSetTriggerEffectParamInt("Delta", 68);

rmAddTriggerEffect("Modify Protounit");
rmSetTriggerEffectParam("Protounit", "House");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("Field", 10);
rmSetTriggerEffectParamInt("Delta", -17);

rmAddTriggerEffect("Modify Protounit");
rmSetTriggerEffectParam("Protounit", "SettlerWagon");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("Field", 1);
rmSetTriggerEffectParamFloat("Delta", .5);

rmAddTriggerEffect("Set Tech Status");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("TechID", 282);
rmSetTriggerEffectParamInt("Status", 0);

rmAddTriggerEffect("Set Tech Status");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("TechID", 281);
rmSetTriggerEffectParamInt("Status", 2);

rmAddTriggerEffect("Set Tech Status");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("TechID", 463);
rmSetTriggerEffectParamInt("Status", 2);

}
if(rmGetPlayerTeam(i)==1){
rmAddTriggerEffect("Modify Protounit");
rmSetTriggerEffectParam("Protounit", "barracks");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("Field", 0);
rmSetTriggerEffectParamInt("Delta", 20000);

for(num = 1; <= 20) {
rmAddTriggerEffect("Set Tech Status");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("TechID", 620);
rmSetTriggerEffectParamInt("Status", 2);
}

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "TradingPost");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Crossbowman");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Halberdier");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Janissary");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Longbowman");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Musketeer");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Pikeman");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Rodelero");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Skirmisher");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Strelet");

rmAddTriggerEffect("Forbid and Disable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Cacadore");

rmAddTriggerEffect("Unforbid and Enable Unit");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParam("Protounit", "Dopplesoldner");

rmAddTriggerEffect("Set Tech Status");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("TechID", 246);
rmSetTriggerEffectParamInt("Status", 0);
}
}
rmCreateTrigger("Victory"+i);
rmSwitchToTrigger(rmTriggerID("Victory"+i));
rmSetTriggerActive(true);
rmSetTriggerRunImmediately(true);
rmSetTriggerPriority(3);

rmAddTriggerCondition("Timer");
rmSetTriggerConditionParamInt("Param1",1800);

for(i = 1; <= cNumberNonGaiaPlayers) {
if(rmGetPlayerTeam(i)==1){

rmAddTriggerEffect("Set Player Defeated");
rmSetTriggerEffectParamInt("Player", i);

}
}

rmSetStatusText("",0.80);

rmCreateTrigger("Timer");
rmSwitchToTrigger(rmTriggerID("Timer"));
rmSetTriggerActive(true);
rmSetTriggerRunImmediately(true);
rmSetTriggerPriority(3);

rmAddTriggerEffect("Counter:Add Timer");
rmSetTriggerEffectParam("Name", "timer");
rmSetTriggerEffectParamInt("Start", 1801);
rmSetTriggerEffectParamInt("Stop", 0);
rmSetTriggerEffectParam("Msg", "Time till mice win");
rmSetTriggerEffectParam("Event", "");

rmSetStatusText("",0.90);

for(i = 1; <= cNumberNonGaiaPlayers) {
if(rmGetPlayerTeam(i)==0){
rmCreateTrigger("Housebuilt"+i);
rmCreateTrigger("Speedtimer"+i);

rmSwitchToTrigger(rmTriggerID("Housebuilt"+i));
rmSetTriggerActive(true);
rmSetTriggerRunImmediately(true);
rmSetTriggerPriority(3);

rmAddTriggerCondition("Player Unit Count");
rmSetTriggerConditionParamInt("PlayerID", i);
rmSetTriggerConditionParam("ProtoUnit", "House");
rmSetTriggerConditionParam("Op", "==");
rmSetTriggerConditionParamFloat("Count", 1);

rmAddTriggerEffect("Modify Protounit");
rmSetTriggerEffectParam("Protounit", "SettlerWagon");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("Field", 1);
rmSetTriggerEffectParamFloat("Delta", 25.5);

rmAddTriggerEffect("Modify Protounit");
rmSetTriggerEffectParam("Protounit", "House");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("Field", 10);
rmSetTriggerEffectParamInt("Delta", -1);

rmAddTriggerEffect("Damage Units in Area");
rmSetTriggerEffectParamInt("SrcObject", middle);
rmSetTriggerEffectParamInt("Player", i);
rmSetTriggerEffectParam("UnitType", "House");
rmSetTriggerEffectParamInt("Dist", 10000);
rmSetTriggerEffectParamInt("Damage", 10000);

rmAddTriggerEffect("Fire Event");
rmSetTriggerEffectParamInt("EventID", rmTriggerID("Speedtimer"+i));

rmSwitchToTrigger(rmTriggerID("Speedtimer"+i));
rmSetTriggerActive(false);
rmSetTriggerRunImmediately(true);
rmSetTriggerPriority(3);

rmAddTriggerCondition("Timer");
rmSetTriggerConditionParamInt("Param1", 10);

rmAddTriggerEffect("Modify Protounit");
rmSetTriggerEffectParam("Protounit", "SettlerWagon");
rmSetTriggerEffectParamInt("PlayerID", i);
rmSetTriggerEffectParamInt("Field", 1);
rmSetTriggerEffectParamFloat("Delta", -25.5);

rmAddTriggerEffect("Fire Event");
rmSetTriggerEffectParamInt("EventID", rmTriggerID("Housebuilt"+i));

}
}


rmSetStatusText("",1);
}