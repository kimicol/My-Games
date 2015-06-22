
// *** RMS Generator File *** 17/8/2006 *** 23:25:26 ***

// *** RMS Generator V 3.0 > Age of Empires 3, V 3.1.1.6 ***

include "mercenaries.xs"; // ensure extras
void main(void)
{
rmSetMapSize(1000,1000);
rmSetMapElevationParameters(cElevTurbulence, 0.02, 2.0, 0.5, 5.0);
rmSetMapElevationHeightBlend(1.0);
rmTerrainInitialize("caribbean\ground6_crb",2);
rmSetMapType("newEngland");
rmSetMapType("grass");
rmSetMapType("default");
rmSetMapType("water");
rmSetMapType("land");
rmSetLightingSet("Amsterdam");
rmSetSeaLevel(2);
rmSetStatusText("",0.10);
int Distanz = 36;
int MengeRessourcen = 15;
int GesamtMengeRessourcen = (cNumberNonGaiaPlayers * MengeRessourcen);
If (GesamtMengeRessourcen > 20) Distanz = 32;
If (GesamtMengeRessourcen > 30) Distanz = 28;
If (GesamtMengeRessourcen > 40) Distanz = 25;
If (GesamtMengeRessourcen > 50) Distanz = 22;
If (GesamtMengeRessourcen > 60) Distanz = 18;
rmSetGlobalSnow(0.9);
rmSetWindMagnitude(2.0);
int CLIFFSIZE = rmGetMapXSize()* 1.3;
int SEASIZE = rmGetMapXSize() * 2.3;
int FORESTSIZE = rmGetMapXSize()*1.3;
int ForestCount = rmGetMapXSize() / 7;
int SeaCount = (rmGetMapXSize() / 15);
int CliffCount = (rmGetMapXSize() / 25);
chooseMercs();
int PlayerClass=rmDefineClass("Player");
int LakeClass=rmDefineClass("Lakes");
int CliffClass=rmDefineClass("Cliffs");
rmDefineClass("ExplorerUnit");
rmDefineClass("MainForest");
rmDefineClass("MainItems");
rmDefineClass("Nativ");
int Lakes=rmCreateClassDistanceConstraint("LAKETOLAKE",LakeClass, 6.0);
int LPLayer=rmCreateClassDistanceConstraint("COTOPL", PlayerClass,rmXFractionToMeters(0.15));
int SPLAYER=rmCreateClassDistanceConstraint("PLTOPL", PlayerClass, 8.0);
int TCvsTC=rmCreateTypeDistanceConstraint("TCTOTC", "TownCenter", 30.0);
int CWvsCW=rmCreateTypeDistanceConstraint("CWTOCW", "CoveredWagon", 30.0);
int FOvsTC=rmCreateTypeDistanceConstraint("FOTOTC", "TownCenter", 20.0);
int AVCoin=rmCreateTypeDistanceConstraint("COTOCO", "gold", Distanz);
int AVNugget=rmCreateTypeDistanceConstraint("NUTONU", "abstractNugget", Distanz);
int AVLAND1=rmCreateTerrainDistanceConstraint("NIMPLAND", "Land", false, 6.0);
int AVLAND3=rmCreateTerrainDistanceConstraint("LIMPLAND", "Land", false, 5.0);
int FOvsCW=rmCreateTypeDistanceConstraint("FOTOCW", "CoveredWagon", 20.0);
int AVTC=rmCreateTypeDistanceConstraint("LALLTOTC", "TownCenter", 30.0);
int AVCW=rmCreateTypeDistanceConstraint("MTOCW", "CoveredWagon", 30.0);
int FOvsFO=rmCreateClassDistanceConstraint("FOTOFO", rmClassID("MainForest"), 20.0);
int AVANIMAL=rmCreateTypeDistanceConstraint("ANTOAN", "deer", 30.0);
int AVLAND2=rmCreateTerrainDistanceConstraint("SIMPLAND", "Land", false, 2.0);
int AVFishFish=rmCreateTypeDistanceConstraint("FISHTOFISH", "abstractFish", 15.0);
int AVFishLand = rmCreateTerrainDistanceConstraint("FISHTOLAND", "land", true, 9.0);
int AVAll=rmCreateTypeDistanceConstraint("ALLTOALL", "all", 4.0);
int AVTradeRoute = rmCreateTradeRouteDistanceConstraint("trade route", 5.0);
int AVNativeTrade = rmCreateTypeDistanceConstraint("NATTOSOK", "socketTradeRoute", 5.0);
int AVSocket = rmCreateTypeDistanceConstraint("SOKTOSOK", "socketTradeRoute", 15.0);
int AVImpItem=rmCreateClassDistanceConstraint("SOKTOALL", rmClassID("MainItems"), 10.0);
int AVSilverSockets=rmCreateClassDistanceConstraint("SILTOSOCK", rmClassID("MainItems"), 12.0);
int AVRiver = rmCreateTerrainDistanceConstraint("SSWATER", "River", false, 3.0);
int AVWater8 = rmCreateTerrainDistanceConstraint("SWATER", "Land", false, 8.0);
int AVWater16 = rmCreateTerrainDistanceConstraint("MWATER", "Land", false, 16.0);
int AVWater20 = rmCreateTerrainDistanceConstraint("LWATER", "Land", false, 20.0);
int Cliff= rmCreateClassDistanceConstraint("CLIFFTOCLIFF",CliffClass, 8.0);
int ANativ=rmCreateClassDistanceConstraint("NATONA", rmClassID("Nativ"), 50.0);
int FLLAND = rmCreateTerrainDistanceConstraint("FlLand", "land", true, 3.0);
int FLVSFL = rmCreateTypeDistanceConstraint("FlToFl", "HomeCityWaterSpawnFlag",2);
rmSetStatusText("",0.20);
If (rmAllocateSubCivs(0) == true)
{
}
rmSetStatusText("",0.30);
rmPlacePlayersCircular(0.39, 0.39, rmDegreesToRadians(6.0));
float AreaSizePlayer = rmAreaTilesToFraction(700);
for(i=1; <cNumberPlayers)
{
int id=rmCreateArea("Player"+i);
rmSetPlayerArea(i, id);
rmSetAreaWarnFailure(id, false);
rmSetAreaSize(id, AreaSizePlayer, AreaSizePlayer);
rmAddAreaToClass(id, PlayerClass);
rmSetAreaLocPlayer(id, i);
rmSetAreaCoherence(id, 0.05);
rmSetAreaMinBlobs(id, 1);
rmSetAreaMaxBlobs(id, 1);
rmAddAreaConstraint(id, SPLAYER);
rmAddAreaConstraint(id, AVWater8);
rmBuildArea(id);
}
rmSetStatusText("",0.35);
for (I=1;<15)
{
int AREAL1=rmCreateArea("Spezial1"+I);
float A = rmRandFloat(0.05,0.98);
float B = rmRandFloat(0.05,0.98);
rmSetAreaWarnFailure(AREAL1, false);
rmSetAreaSize(AREAL1,rmAreaTilesToFraction(300),rmAreaTilesToFraction(300));
rmSetAreaCoherence(AREAL1, 0.05);
rmSetAreaMinBlobs(AREAL1, 1);
rmSetAreaMaxBlobs(AREAL1, 1);
rmSetAreaTerrainType(AREAL1,"caribbean\ground7_crb");
rmAddAreaTerrainLayer(AREAL1, "caribbean\ground1_crb", 10, 15);
rmSetAreaLocation(AREAL1,A,B);
rmAddAreaConstraint(AREAL1, SPLAYER);
rmBuildArea(AREAL1);
}
for (I=1;<15)
{
int AREAL2=rmCreateArea("Spezial2"+I);
A = rmRandFloat(0.05,0.98);
B = rmRandFloat(0.05,0.98);
rmSetAreaWarnFailure(AREAL2, false);
rmSetAreaSize(AREAL2,rmAreaTilesToFraction(300),rmAreaTilesToFraction(300));
rmSetAreaCoherence(AREAL2, 0.05);
rmSetAreaMinBlobs(AREAL2, 1);
rmSetAreaMaxBlobs(AREAL2, 1);
rmSetAreaTerrainType(AREAL2,"caribbean\ground1_crb");
rmAddAreaTerrainLayer(AREAL1, "caribbean\ground1_crb", 8, 15);
rmSetAreaLocation(AREAL2,A,B);
rmAddAreaConstraint(AREAL2, SPLAYER);
rmBuildArea(AREAL2);
}
for (I=1;<15)
{
int AREAL3=rmCreateArea("Spezial3"+I);
A = rmRandFloat(0.05,0.98);
B = rmRandFloat(0.05,0.98);
rmSetAreaWarnFailure(AREAL3, false);
rmSetAreaSize(AREAL3,rmAreaTilesToFraction(300),rmAreaTilesToFraction(300));
rmSetAreaCoherence(AREAL3, 0.05);
rmSetAreaMinBlobs(AREAL3, 1);
rmSetAreaMaxBlobs(AREAL3, 1);
rmSetAreaTerrainType(AREAL3,"caribbean\ground1_crb");
rmAddAreaTerrainLayer(AREAL1, "caribbean\ground6_crb", 5, 15);
rmSetAreaLocation(AREAL3,A,B);
rmAddAreaConstraint(AREAL3, SPLAYER);
rmBuildArea(AREAL3);
}
vector TRP1 = cOriginVector;
vector TRP2 = cOriginVector;
int tradeRoute1 = rmCreateTradeRoute();
int tradeRoute2 = rmCreateTradeRoute();
int SocketID=rmCreateObjectDef("TradeSockets");
rmAddObjectDefItem(SocketID, "SocketTradeRoute", 1, 0.0);
rmAddObjectDefConstraint(SocketID, AVSocket);
rmAddObjectDefConstraint(SocketID, AVWater8);
rmAddObjectDefToClass(SocketID, rmClassID("MainItems"));

rmSetObjectDefMinDistance(SocketID, 0.0);
rmSetObjectDefMaxDistance(SocketID, 8.0);
rmAddClosestPointConstraint(AVWater8);
float Breite = 10;
If (cNumberNonGaiaPlayers > 1) Breite = 8;
If (cNumberNonGaiaPlayers > 3) Breite = 9;
If (cNumberNonGaiaPlayers > 6) Breite = 10;
If (cNumberNonGaiaPlayers > 7) Breite = 11;
int amazonRiver1 = rmRiverCreate(-1, "Amazon River", 9, 6, Breite, Breite);
int amazonRiver2 = rmRiverCreate(-1, "Amazon River", 10, 8, Breite-1.5, Breite -1.5);
int amazonRiver3 = rmRiverCreate(-1, "Amazon River", 10, 8, Breite-2.0, Breite-2.0);
int amazonRiver4 = rmRiverCreate(-1, "Amazon River", 10, 8,  Breite-3.0, Breite-3.0);
rmRiverAddWaypoint(amazonRiver1, 0.52, 1.00 );
rmRiverAddWaypoint(amazonRiver1, 0.45, 0.85 );
rmRiverAddWaypoint(amazonRiver1, 0.39, 0.70 );
rmRiverAddWaypoint(amazonRiver1, 0.35, 0.50 );
rmRiverAddWaypoint(amazonRiver1, 0.37, 0.33 );
rmRiverAddWaypoint(amazonRiver1, 0.32, 0.18 );
rmRiverAddWaypoint(amazonRiver1, 0.25, 0.05 );
rmRiverAddWaypoint(amazonRiver2, 0.98, 0.38 );
rmRiverAddWaypoint(amazonRiver2, 0.90, 0.45 );
rmRiverAddWaypoint(amazonRiver2, 0.72, 0.50 );
rmRiverAddWaypoint(amazonRiver2, 0.37, 0.33 );
rmRiverAddWaypoint(amazonRiver3, 0.88, 0.83 );
rmRiverAddWaypoint(amazonRiver3, 0.70, 0.65 );
rmRiverAddWaypoint(amazonRiver3, 0.72, 0.50 );
rmRiverAddWaypoint(amazonRiver4, 0.12, 0.83 );
rmRiverAddWaypoint(amazonRiver4, 0.28, 0.62 );
rmRiverAddWaypoint(amazonRiver4, 0.37, 0.50 );
rmRiverSetBankNoiseParams(amazonRiver1,  0.07, 2, 1.5, 15.0, 1.0, 0.0);
rmRiverSetBankNoiseParams(amazonRiver2,  0.07, 2, 1.5, 15.0, 1.0, 0.0);
rmRiverSetBankNoiseParams(amazonRiver3,  0.07, 2, 1.5, 15.0, 1.0, 0.0);
rmRiverSetBankNoiseParams(amazonRiver4,  0.07, 2, 1.5, 15.0, 1.0, 0.0);
int BreiteShallow = 6;
If (cNumberNonGaiaPlayers == 2) BreiteShallow = (cNumberNonGaiaPlayers * 2.0);
If (cNumberNonGaiaPlayers == 3) BreiteShallow = (cNumberNonGaiaPlayers * 1.7);
If (cNumberNonGaiaPlayers == 4) BreiteShallow = (cNumberNonGaiaPlayers * 1.3);
If (cNumberNonGaiaPlayers >= 5) BreiteShallow = (cNumberNonGaiaPlayers * 1.0);
int IsOrNot = rmRandInt(100,1000);
float Point1 = 0.1;
If (IsOrNot < 500) 
{
Point1 = rmRandFloat(0.1,0.6);
}
else
{
Point1 = rmRandFloat(0.8,0.95);
}
float Point3 = rmRandFloat(0.1,0.8);
float Point4 = rmRandFloat(0.1,0.8);
rmRiverSetShallowRadius(amazonRiver1, BreiteShallow);
rmRiverAddShallow(amazonRiver1, Point1);
rmRiverSetShallowRadius(amazonRiver3, BreiteShallow);
rmRiverAddShallow(amazonRiver3, Point3);
rmRiverSetShallowRadius(amazonRiver4, BreiteShallow);
rmRiverAddShallow(amazonRiver4, Point4);
rmRiverBuild(amazonRiver2);
rmRiverBuild(amazonRiver3);
rmRiverBuild(amazonRiver4);
rmRiverBuild(amazonRiver1);
rmRiverReveal(amazonRiver1, .1); 
rmRiverReveal(amazonRiver2, .1); 
rmRiverReveal(amazonRiver3, .1); 
rmRiverReveal(amazonRiver4, .1); 
TRP1 = rmFindClosestPoint(0.70, 0.95, 1);
rmAddTradeRouteWaypoint(tradeRoute1,rmXMetersToFraction(xsVectorGetX(TRP1)),rmZMetersToFraction(xsVectorGetZ(TRP1)));
rmAddRandomTradeRouteWaypoints(tradeRoute1, 0.53,0.73,7,7);
rmAddRandomTradeRouteWaypoints(tradeRoute1, 0.55,0.65,7,7);
rmAddRandomTradeRouteWaypoints(tradeRoute1, 0.53,0.58,1,1);
rmAddRandomTradeRouteWaypoints(tradeRoute1, 0.52,0.25,1,1);
TRP1 = rmFindClosestPoint(0.60, 0.00, 1);
rmAddRandomTradeRouteWaypoints(tradeRoute1, rmXMetersToFraction(xsVectorGetX(TRP1)),rmZMetersToFraction(xsVectorGetZ(TRP1)),7,7);
rmBuildTradeRoute(tradeRoute1, "dirt");
int SID=rmCreateArea("shipwreck island");
rmSetAreaSize(SID, rmAreaTilesToFraction(800), rmAreaTilesToFraction(800));
rmSetAreaTerrainType(SID,"caribbean\ground6_crb");
rmSetAreaLocation(SID,0.48,0.42);
rmBuildArea(SID);
TRP2 = rmFindClosestPoint(0.03, 0.70, 1);
rmAddTradeRouteWaypoint(tradeRoute2, rmXMetersToFraction(xsVectorGetX(TRP2)), rmZMetersToFraction(xsVectorGetZ(TRP2)));
rmAddRandomTradeRouteWaypoints(tradeRoute2, 0.15, 0.60,7,9);
rmAddRandomTradeRouteWaypoints(tradeRoute2, 0.25, 0.45,6,7);
TRP2 = rmFindClosestPoint(0.11, 0.11, 1);
rmAddRandomTradeRouteWaypoints(tradeRoute2, rmXMetersToFraction(xsVectorGetX(TRP2)), rmZMetersToFraction(xsVectorGetZ(TRP2)),7,7);
rmBuildTradeRoute(tradeRoute2, "dirt");
rmClearClosestPointConstraints();
vector SocketPosition = cOriginVector;
rmSetObjectDefTradeRouteID(SocketID, tradeRoute1);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.10);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.30);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.50);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.80);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.95);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
rmSetObjectDefTradeRouteID(SocketID, tradeRoute2);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.12);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.35);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.60);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.85);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
int Fisch1=rmCreateObjectDef("Fisch1");
rmAddObjectDefItem(Fisch1, "FishSalmon", 1, 0.0);
rmSetObjectDefMinDistance(Fisch1, 0.3);
rmSetObjectDefMaxDistance(Fisch1, rmXFractionToMeters(0.5));
rmAddObjectDefConstraint(Fisch1, AVFishFish);
rmAddObjectDefConstraint(Fisch1, AVFishLand);
rmPlaceObjectDefAtLoc(Fisch1, 0, 0.5, 0.5, 4*cNumberNonGaiaPlayers);
int Fisch2=rmCreateObjectDef("Fisch2");
rmAddObjectDefItem(Fisch2, "FishSalmon", 1, 0.0);
rmSetObjectDefMinDistance(Fisch2, 0.3);
rmSetObjectDefMaxDistance(Fisch2, rmXFractionToMeters(0.5));
rmAddObjectDefConstraint(Fisch2, AVFishFish);
rmAddObjectDefConstraint(Fisch2, AVFishLand);
rmPlaceObjectDefAtLoc(Fisch2, 0, 0.5, 0.5, 4*cNumberNonGaiaPlayers);
for(I=1;< CliffCount)
{
int CliffID=rmCreateArea("Cliff"+I);
rmSetAreaSize(CliffID, rmAreaTilesToFraction(CLIFFSIZE), rmAreaTilesToFraction(CLIFFSIZE));
rmSetAreaCliffType(CliffID, "Carolina Inland");
rmSetAreaCliffEdge(CliffID,2, 0.4, 0.5, 1.0, 0);
rmSetAreaCliffPainting(CliffID, false, true, true, 1.5, true);
rmSetAreaCliffHeight(CliffID, 5.5, 0.5, 0.5);
rmSetAreaHeightBlend(CliffID, 2);
rmSetAreaCoherence(CliffID,0.15);
rmAddAreaConstraint(CliffID, SPLAYER);
rmAddAreaConstraint(CliffID, AVTradeRoute);
rmAddAreaConstraint(CliffID, AVImpItem);
rmAddAreaConstraint(CliffID, AVWater8);
float XX = rmRandFloat(0.05,0.98);
float ZZ = rmRandFloat(0.05,0.98);
rmSetAreaLocation(CliffID, XX, ZZ);
rmSetAreaWarnFailure(CliffID, false);
rmBuildArea(CliffID);
}
int TCID = rmCreateObjectDef("player TC");
rmAddObjectDefItem(TCID, "townCenter", 1, 0);
rmSetObjectDefMinDistance(TCID, 0.0);
rmSetObjectDefMaxDistance(TCID, 20.0);
rmAddObjectDefConstraint(TCID, AVTradeRoute);
rmAddObjectDefConstraint(TCID, TCvsTC);
rmAddObjectDefConstraint(TCID, CWvsCW);
rmAddObjectDefConstraint(TCID, AVLAND1);
for(i=1; <cNumberPlayers)
{
rmPlaceObjectDefAtLoc(TCID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
}
int ExplorerUnits = rmCreateStartingUnitsObjectDef(5.0);
rmSetObjectDefMinDistance(ExplorerUnits, 6.0);
rmSetObjectDefMaxDistance(ExplorerUnits, 10.0);
rmAddObjectDefConstraint(ExplorerUnits, AVAll);
rmAddObjectDefConstraint(ExplorerUnits, AVLAND2);
int playerBerryID=rmCreateObjectDef("player berries");
rmAddObjectDefItem(playerBerryID, "berryBush", 5, 5.0);
rmSetObjectDefMinDistance(playerBerryID, 8);
rmSetObjectDefMaxDistance(playerBerryID, 10);
rmAddObjectDefConstraint(playerBerryID, AVAll);
rmAddObjectDefConstraint(playerBerryID, AVLAND2);
int playerTreeID=rmCreateObjectDef("player trees");
rmAddObjectDefItem(playerTreeID, "TreeGreatLakes", 5, 0.0);
rmSetObjectDefMinDistance(playerTreeID, 6);
rmSetObjectDefMaxDistance(playerTreeID, 12);
rmAddObjectDefConstraint(playerTreeID, AVAll);
rmAddObjectDefConstraint(playerTreeID, AVLAND2);
int wild1ID=rmCreateObjectDef("sheeps");
rmAddObjectDefItem(wild1ID, "sheep", 8, 8.0);
rmSetObjectDefMinDistance(wild1ID, 20);
rmSetObjectDefMaxDistance(wild1ID, 30);
rmAddObjectDefConstraint(wild1ID, AVANIMAL);
rmAddObjectDefConstraint(wild1ID, AVAll);
rmAddObjectDefConstraint(wild1ID, AVLAND1);
rmSetObjectDefCreateHerd(wild1ID, true);
int playerSilverID = rmCreateObjectDef("player silver");
rmAddObjectDefItem(playerSilverID, "mine",1, 4.0);
rmAddObjectDefConstraint(playerSilverID, AVTradeRoute);
rmSetObjectDefMinDistance(playerSilverID, 25.0);
rmSetObjectDefMaxDistance(playerSilverID, 30.0);
rmAddObjectDefConstraint(playerSilverID, AVAll);
rmAddObjectDefConstraint(playerSilverID, AVLAND2);
rmSetStatusText("",0.70);
for(i=1; <cNumberPlayers)
{
vector TCLocation = rmGetUnitPosition(rmGetUnitPlacedOfPlayer(TCID, i));
vector closestPoint = rmFindClosestPointVector(TCLocation, rmXFractionToMeters(1.0));
rmPlaceObjectDefAtLoc(ExplorerUnits, i, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
for(x=1; <6)
{
rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
}
rmPlaceObjectDefAtLoc(playerBerryID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
rmPlaceObjectDefAtLoc(playerSilverID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
rmPlaceObjectDefAtLoc(wild1ID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
}
for(i=1; <cNumberPlayers)
{
TCLocation = rmGetUnitPosition(rmGetUnitPlacedOfPlayer(TCID, i));
closestPoint = rmFindClosestPointVector(TCLocation, rmXFractionToMeters(1.0));
}
rmClearClosestPointConstraints();
rmSetStatusText("",0.80);
int Flagge = 1;
for(i=0; <cNumberPlayers)
{
TCLocation = rmGetUnitPosition(rmGetUnitPlacedOfPlayer(TCID, i));
closestPoint = rmFindClosestPointVector(TCLocation, rmXFractionToMeters(1.0));
Flagge=rmCreateObjectDef("Hafenflagge"+i);
rmAddObjectDefItem(Flagge, "HomeCityWaterSpawnFlag", 1, 1.0);
rmAddClosestPointConstraint(FLVSFL);
rmAddClosestPointConstraint(FLLAND);
rmPlaceObjectDefAtLoc(Flagge, i, rmXMetersToFraction(xsVectorGetX(closestPoint)), rmZMetersToFraction(xsVectorGetZ(closestPoint)));
}
rmClearClosestPointConstraints();
rmSetStatusText("",0.90);
int silverID = -1;
int silverCount = (cNumberNonGaiaPlayers * 5);
for(i=0; < silverCount)
{
silverID = rmCreateObjectDef("silver "+i);
rmAddObjectDefItem(silverID, "mine", 1, 0.0);
rmSetObjectDefMinDistance(silverID, 0.0);
rmSetObjectDefMaxDistance(silverID, rmXFractionToMeters(1));
rmAddObjectDefConstraint(silverID, AVCoin);
rmAddObjectDefConstraint(silverID, AVAll);
rmAddObjectDefConstraint(silverID, AVTC);
rmAddObjectDefConstraint(silverID, AVCW);
rmAddObjectDefConstraint(silverID, AVSilverSockets);
rmAddObjectDefConstraint(silverID, AVLAND3);
rmAddObjectDefConstraint(silverID, AVTradeRoute);
rmPlaceObjectDefAtLoc(silverID, 0, 0.5, 0.5);
}
int GoldID = -1;
int GoldCount = (cNumberNonGaiaPlayers * 5);
for(i=0; < GoldCount)
{
GoldID = rmCreateObjectDef("Gold "+i);
rmAddObjectDefItem(GoldID, "mineGold", 1, 0.0);
rmSetObjectDefMinDistance(GoldID, 0.0);
rmSetObjectDefMaxDistance(GoldID, rmXFractionToMeters(1));
rmAddObjectDefConstraint(GoldID, AVCoin);
rmAddObjectDefConstraint(GoldID, AVAll);
rmAddObjectDefConstraint(GoldID, AVTC);
rmAddObjectDefConstraint(GoldID, AVCW);
rmAddObjectDefConstraint(GoldID, AVSilverSockets);
rmAddObjectDefConstraint(GoldID, AVLAND3);
rmAddObjectDefConstraint(GoldID, AVTradeRoute);
rmPlaceObjectDefAtLoc(GoldID, 0, 0.5, 0.5);
}
int SchatzID = -1;
int SchatzCount = (cNumberNonGaiaPlayers * 5);
for(i=0; < SchatzCount)
{
SchatzID = rmCreateObjectDef("Schatz "+i);
rmAddObjectDefItem(SchatzID, "nugget", 1, 0.0);
rmSetObjectDefMinDistance(SchatzID, 0.0);
rmSetObjectDefMaxDistance(SchatzID, rmXFractionToMeters(1));
rmAddObjectDefConstraint(SchatzID, AVCoin);
rmAddObjectDefConstraint(SchatzID, AVAll);
rmAddObjectDefConstraint(SchatzID, AVTC);
rmAddObjectDefConstraint(SchatzID, AVCW);
rmAddObjectDefConstraint(SchatzID, AVNugget);
rmAddObjectDefConstraint(SchatzID, AVLAND3);
rmAddObjectDefConstraint(SchatzID, AVTradeRoute);
rmPlaceObjectDefAtLoc(SchatzID, 0, 0.5, 0.5);
}
int WildAID=rmCreateObjectDef("bison-1");
rmAddObjectDefItem(WildAID, "bison", 25, 20);
rmSetObjectDefMinDistance(WildAID, 30);
rmSetObjectDefMaxDistance(WildAID, 40);
rmAddObjectDefConstraint(WildAID, AVANIMAL);
rmAddObjectDefConstraint(WildAID, AVAll);
rmAddObjectDefConstraint(WildAID, AVTC);
rmAddObjectDefConstraint(WildAID, AVCW);
rmAddObjectDefConstraint(WildAID, AVLAND1);
rmSetObjectDefCreateHerd(WildAID, true);
rmPlaceObjectDefAtLoc(WildAID, 0, 0.85,0.5,1);
int WildBID=rmCreateObjectDef("tapir-2");
rmAddObjectDefItem(WildBID, "tapir", 25, 20);
rmSetObjectDefMinDistance(WildBID, 30);
rmSetObjectDefMaxDistance(WildBID, 40);
rmAddObjectDefConstraint(WildBID, AVANIMAL);
rmAddObjectDefConstraint(WildBID, AVAll);
rmAddObjectDefConstraint(WildBID, AVTC);
rmAddObjectDefConstraint(WildBID, AVCW);
rmAddObjectDefConstraint(WildBID, AVLAND1);
rmSetObjectDefCreateHerd(WildBID, true);
rmPlaceObjectDefAtLoc(WildBID, 0, 0.50,0.85,1);
int WildCID=rmCreateObjectDef("Pronghorn-3");
rmAddObjectDefItem(WildCID, "Pronghorn", 0, 20);
rmSetObjectDefMinDistance(WildCID, 30);
rmSetObjectDefMaxDistance(WildCID, 40);
rmAddObjectDefConstraint(WildCID, AVANIMAL);
rmAddObjectDefConstraint(WildCID, AVAll);
rmAddObjectDefConstraint(WildCID, AVTC);
rmAddObjectDefConstraint(WildCID, AVCW);
rmAddObjectDefConstraint(WildCID, AVLAND1);
rmSetObjectDefCreateHerd(WildCID, true);
rmPlaceObjectDefAtLoc(WildCID, 0, 0.5,0.15,1);
int WildDID=rmCreateObjectDef("llama-4");
rmAddObjectDefItem(WildDID, "llama", 0, 20);
rmSetObjectDefMinDistance(WildDID, 30);
rmSetObjectDefMaxDistance(WildDID, 40);
rmAddObjectDefConstraint(WildDID, AVANIMAL);
rmAddObjectDefConstraint(WildDID, AVAll);
rmAddObjectDefConstraint(WildDID, AVTC);
rmAddObjectDefConstraint(WildDID, AVCW);
rmAddObjectDefConstraint(WildDID, AVLAND1);
rmSetObjectDefCreateHerd(WildDID, true);
rmPlaceObjectDefAtLoc(WildDID, 0, 0.15,0.5,1);
int forestTreeID = 0;
int numTries = ForestCount;
int failCount=0;
for (i=0; <numTries)
{
int forest=rmCreateArea("forest "+i);
rmSetAreaWarnFailure(forest, false);
rmSetAreaSize(forest, rmAreaTilesToFraction(FORESTSIZE), rmAreaTilesToFraction(FORESTSIZE));
rmSetAreaForestType(forest, "Great Lakes Forest");
rmSetAreaForestDensity(forest, 0.1);
rmSetAreaForestClumpiness(forest, 1);
rmSetAreaForestUnderbrush(forest, 1);
rmSetAreaMinBlobs(forest, 1);
rmSetAreaMaxBlobs(forest, 5);
rmSetAreaMinBlobDistance(forest, 12.0);
rmSetAreaMaxBlobDistance(forest, 16.0);
rmSetAreaCoherence(forest, 0.4);
rmSetAreaSmoothDistance(forest, 5);
rmAddAreaToClass(forest, rmClassID("MainForest"));
rmAddAreaConstraint(forest, FOvsFO);
rmAddAreaConstraint(forest, AVAll);
rmAddAreaConstraint(forest, FOvsTC);
rmAddAreaConstraint(forest, FOvsCW);
rmAddAreaConstraint(forest, AVLAND3);
rmAddAreaConstraint(forest, AVTradeRoute);
if(rmBuildArea(forest)==false)
{
failCount++;
if(failCount==5)
break;
}
else
failCount=0;
}

}
