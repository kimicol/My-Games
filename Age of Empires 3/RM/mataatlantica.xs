
// *** RMS Generator File *** 30/7/2006 *** 15:11:13 ***

// *** RMS Generator V 3.0 > Age of Empires 3, V 3.1.1.6 ***

include "mercenaries.xs"; // ensure extras
void main(void)
{
rmSetMapSize((2*sqrt(cNumberNonGaiaPlayers*12000)), (2*sqrt(cNumberNonGaiaPlayers*12000)));
rmSetMapElevationParameters(cElevTurbulence, .02, 6.0, 0.3, 15.0);
rmSetMapElevationHeightBlend(1.0);
rmTerrainInitialize("new_england\ground1_ne",6);
rmSetMapType("greatPlains");
rmSetMapType("grass");
rmSetMapType("default");
rmSetMapType("water");
rmSetMapType("land");
rmSetLightingSet("307a_Beach");
rmSetSeaLevel(6);
rmSetStatusText("",0.10);
int Distanz = 36;
int MengeRessourcen = 4;
int GesamtMengeRessourcen = (cNumberNonGaiaPlayers * MengeRessourcen);
If (GesamtMengeRessourcen > 20) Distanz = 32;
If (GesamtMengeRessourcen > 30) Distanz = 28;
If (GesamtMengeRessourcen > 40) Distanz = 25;
If (GesamtMengeRessourcen > 50) Distanz = 22;
If (GesamtMengeRessourcen > 60) Distanz = 18;
int CLIFFSIZE = rmGetMapXSize()* 1.3;
int SEASIZE = rmGetMapXSize() * 2.3;
int FORESTSIZE = rmGetMapXSize()*1.3;
int ForestCount = rmGetMapXSize() / 7;
int SeaCount = (rmGetMapXSize() / 15);
int CliffCount = (rmGetMapXSize() / 5);
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
If (rmAllocateSubCivs(5) == true)
{
int subCiv00=rmGetCivID("Tupi");
rmSetSubCiv(0, "Tupi");
int subCiv01=rmGetCivID("Tupi");
rmSetSubCiv(1, "Tupi");
int subCiv02=rmGetCivID("Tupi");
rmSetSubCiv(2, "Tupi");
int subCiv03=rmGetCivID("Tupi");
rmSetSubCiv(3,"Tupi");
int subCiv04=rmGetCivID("Tupi");
rmSetSubCiv(4, "Tupi");
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
rmSetAreaTerrainType(AREAL1,"new_england\ground2_ne");
rmAddAreaTerrainLayer(AREAL1, "new_england\ground3_ne", 10, 15);
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
rmSetAreaTerrainType(AREAL2,"new_england\ground3_ne");
rmAddAreaTerrainLayer(AREAL1, "new_england\ground4_ne", 8, 15);
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
rmSetAreaTerrainType(AREAL3,"new_england\ground4_ne");
rmAddAreaTerrainLayer(AREAL1, "new_england\ground1_ne", 5, 15);
rmSetAreaLocation(AREAL3,A,B);
rmAddAreaConstraint(AREAL3, SPLAYER);
rmBuildArea(AREAL3);
}
vector TradeRoutePoint1 = cOriginVector;
vector TradeRoutePoint2 = cOriginVector;
int SocketID=rmCreateObjectDef("TradeSockets");
rmAddObjectDefItem(SocketID, "SocketTradeRoute", 1, 0.0);
rmAddObjectDefConstraint(SocketID, AVSocket);
rmAddObjectDefConstraint(SocketID, AVWater16);
rmAddObjectDefToClass(SocketID, rmClassID("MainItems"));

rmSetObjectDefMinDistance(SocketID, 0.0);
rmSetObjectDefMaxDistance(SocketID, 8.0);
rmAddClosestPointConstraint(AVWater16);
int tradeRoute1 = rmCreateTradeRoute();
TradeRoutePoint1 = rmFindClosestPoint(0.14, 0.95, 1);
rmAddTradeRouteWaypoint(tradeRoute1, rmXMetersToFraction(xsVectorGetX(TradeRoutePoint1)), rmZMetersToFraction(xsVectorGetZ(TradeRoutePoint1)));
rmAddRandomTradeRouteWaypoints(tradeRoute1, 0.08, 0.50,10,10);
rmAddRandomTradeRouteWaypoints(tradeRoute1, 0.18, 0.18,4,4);
rmAddRandomTradeRouteWaypoints(tradeRoute1, 0.50, 0.08,4,4);
TradeRoutePoint1 = rmFindClosestPoint(0.95, 0.12, 1);
rmAddRandomTradeRouteWaypoints(tradeRoute1, rmXMetersToFraction(xsVectorGetX(TradeRoutePoint1)), rmZMetersToFraction(xsVectorGetZ(TradeRoutePoint1)),4,4);
rmBuildTradeRoute(tradeRoute1, "dirt");
int tradeRoute2 = rmCreateTradeRoute();
TradeRoutePoint2 = rmFindClosestPoint(0.10, 0.85, 1);
rmAddTradeRouteWaypoint(tradeRoute2, rmXMetersToFraction(xsVectorGetX(TradeRoutePoint2)), rmZMetersToFraction(xsVectorGetZ(TradeRoutePoint2)));
rmAddRandomTradeRouteWaypoints(tradeRoute2, 0.55, 0.95,4,4);
rmAddRandomTradeRouteWaypoints(tradeRoute2, 0.82, 0.82,4,4);
rmAddRandomTradeRouteWaypoints(tradeRoute2, 0.95, 0.55,4,4);
TradeRoutePoint2 = rmFindClosestPoint(0.85, 0.10, 1);
rmAddRandomTradeRouteWaypoints(tradeRoute2, rmXMetersToFraction(xsVectorGetX(TradeRoutePoint2)), rmZMetersToFraction(xsVectorGetZ(TradeRoutePoint2)),4,4);
rmBuildTradeRoute(tradeRoute2, "dirt");
rmClearClosestPointConstraints();
vector SocketPosition = cOriginVector;
rmSetObjectDefTradeRouteID(SocketID, tradeRoute1);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.15);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.30);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.45);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.60);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.75);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.90);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
rmSetObjectDefTradeRouteID(SocketID, tradeRoute2);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.15);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.30);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.45);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.60);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.75);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute2, 0.90);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
rmSetStatusText("",0.45);
tradeRoute1 = rmCreateTradeRoute();
TradeRoutePoint1 = rmFindClosestPoint(0.14, 0.95, 1);
rmAddTradeRouteWaypoint(tradeRoute1, rmXMetersToFraction(xsVectorGetX(TradeRoutePoint1)), rmZMetersToFraction(xsVectorGetZ(TradeRoutePoint1)));
rmAddRandomTradeRouteWaypoints(tradeRoute1, 0.5, 0.5,10,10);
TradeRoutePoint1 = rmFindClosestPoint(0.95, 0.12, 1);
rmAddRandomTradeRouteWaypoints(tradeRoute1, rmXMetersToFraction(xsVectorGetX(TradeRoutePoint1)), rmZMetersToFraction(xsVectorGetZ(TradeRoutePoint1)),4,4);
rmBuildTradeRoute(tradeRoute1, "dirt");
SocketPosition = cOriginVector;
rmSetObjectDefTradeRouteID(SocketID, tradeRoute1);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.15);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.30);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.45);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.60);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.75);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
SocketPosition = rmGetTradeRouteWayPoint(tradeRoute1, 0.90);
rmPlaceObjectDefAtPoint(SocketID, 0, SocketPosition);
rmSetStatusText("",0.55);
for(I=1;< SeaCount)
{
int smalllakeID=rmCreateArea("SmallLakes"+I);
rmSetAreaSize(smalllakeID, rmAreaTilesToFraction(SEASIZE),rmAreaTilesToFraction(SEASIZE));
rmSetAreaWaterType(smalllakeID, "Saguenay Lake");
rmSetAreaBaseHeight(smalllakeID, 3);
rmSetAreaMinBlobs(smalllakeID, 2);
rmSetAreaMaxBlobs(smalllakeID, 3);
rmSetAreaMinBlobDistance(smalllakeID, 8.0);
rmSetAreaMaxBlobDistance(smalllakeID, 12.0);
rmSetAreaCoherence(smalllakeID,0.15);
rmAddAreaToClass(smalllakeID, LakeClass);
rmAddAreaConstraint(smalllakeID, SPLAYER);
rmAddAreaConstraint(smalllakeID, AVTradeRoute);
rmAddAreaConstraint(smalllakeID, AVImpItem);
rmAddAreaConstraint(smalllakeID, Lakes);
rmAddAreaConstraint(smalllakeID, Cliff);
rmAddAreaConstraint(smalllakeID, AVWater16);
float X = rmRandFloat(0.05,0.98);
float Z = rmRandFloat(0.05,0.98);
rmSetAreaLocation(smalllakeID, X, Z);
rmSetAreaWarnFailure(smalllakeID, false);
rmBuildArea(smalllakeID);
}
rmSetStatusText("",0.65);
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
rmSetAreaCliffType(CliffID, "Carolina Coast");
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
}
for(i=1; <cNumberPlayers)
{
TCLocation = rmGetUnitPosition(rmGetUnitPlacedOfPlayer(TCID, i));
closestPoint = rmFindClosestPointVector(TCLocation, rmXFractionToMeters(1.0));
}
rmClearClosestPointConstraints();
rmSetStatusText("",0.80);
int VillageID1 = rmCreateGrouping("Tupis village1", "native Tupi village 4");
rmSetGroupingMinDistance(VillageID1, 60.0);
rmSetGroupingMaxDistance(VillageID1,rmXFractionToMeters(0.9));
rmAddGroupingConstraint(VillageID1, Cliff);
rmAddGroupingConstraint(VillageID1, rmClassID("MainItems"));
rmAddGroupingConstraint(VillageID1,AVTradeRoute);
rmAddGroupingConstraint(VillageID1,AVImpItem);
rmAddGroupingConstraint(VillageID1,AVNativeTrade);
rmAddGroupingConstraint(VillageID1,AVTC);
rmAddGroupingConstraint(VillageID1, rmClassID("Nativ"));
rmPlaceGroupingAtLoc(VillageID1, 0,0.5,0.5);
int VillageID2 = rmCreateGrouping("Tupis village2", "native Tupi village 1");
rmSetGroupingMinDistance(VillageID2, 60.0);
rmSetGroupingMaxDistance(VillageID2,rmXFractionToMeters(0.9));
rmAddGroupingConstraint(VillageID2, Cliff);
rmAddGroupingConstraint(VillageID2, rmClassID("MainItems"));
rmAddGroupingConstraint(VillageID2,AVTradeRoute);
rmAddGroupingConstraint(VillageID2,AVImpItem);
rmAddGroupingConstraint(VillageID2,AVNativeTrade);
rmAddGroupingConstraint(VillageID2,AVTC);
rmAddGroupingConstraint(VillageID2, rmClassID("Nativ"));
rmPlaceGroupingAtLoc(VillageID2, 0,0.5,0.5);
int VillageID3 = rmCreateGrouping("Tupis village3", "native Tupi village 2");
rmSetGroupingMinDistance(VillageID3, 60.0);
rmSetGroupingMaxDistance(VillageID3,rmXFractionToMeters(0.9));
rmAddGroupingConstraint(VillageID3, Cliff);
rmAddGroupingConstraint(VillageID3, rmClassID("MainItems"));
rmAddGroupingConstraint(VillageID3,AVTradeRoute);
rmAddGroupingConstraint(VillageID3,AVImpItem);
rmAddGroupingConstraint(VillageID3,AVNativeTrade);
rmAddGroupingConstraint(VillageID3,AVTC);
rmAddGroupingConstraint(VillageID3, rmClassID("Nativ"));
rmPlaceGroupingAtLoc(VillageID3, 0,0.5,0.5);
int VillageID4 = rmCreateGrouping("Tupis village4", "native Tupi village 3");
rmSetGroupingMinDistance(VillageID4, 60.0);
rmSetGroupingMaxDistance(VillageID4,rmXFractionToMeters(0.9));
rmAddGroupingConstraint(VillageID4, Cliff);
rmAddGroupingConstraint(VillageID4, rmClassID("MainItems"));
rmAddGroupingConstraint(VillageID4,AVTradeRoute);
rmAddGroupingConstraint(VillageID4,AVImpItem);
rmAddGroupingConstraint(VillageID4,AVNativeTrade);
rmAddGroupingConstraint(VillageID4,AVTC);
rmAddGroupingConstraint(VillageID4, rmClassID("Nativ"));
rmPlaceGroupingAtLoc(VillageID4, 0,0.5,0.5);
int VillageID5 = rmCreateGrouping("Tupis village5", "native Tupi village 5");
rmSetGroupingMinDistance(VillageID5, 60.0);
rmSetGroupingMaxDistance(VillageID5,rmXFractionToMeters(0.9));
rmAddGroupingConstraint(VillageID5, Cliff);
rmAddGroupingConstraint(VillageID5, rmClassID("MainItems"));
rmAddGroupingConstraint(VillageID5,AVTradeRoute);
rmAddGroupingConstraint(VillageID5,AVImpItem);
rmAddGroupingConstraint(VillageID5,AVNativeTrade);
rmAddGroupingConstraint(VillageID5,AVTC);
rmAddGroupingConstraint(VillageID5, rmClassID("Nativ"));
rmPlaceGroupingAtLoc(VillageID5, 0,0.5,0.5);
rmSetStatusText("",0.90);
int GoldID = -1;
int GoldCount = (cNumberNonGaiaPlayers * 2);
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
int SchatzCount = (cNumberNonGaiaPlayers * 2);
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
int WildAID=rmCreateObjectDef("deer-1");
rmAddObjectDefItem(WildAID, "deer", 25, 20);
rmSetObjectDefMinDistance(WildAID, 30);
rmSetObjectDefMaxDistance(WildAID, 40);
rmAddObjectDefConstraint(WildAID, AVANIMAL);
rmAddObjectDefConstraint(WildAID, AVAll);
rmAddObjectDefConstraint(WildAID, AVTC);
rmAddObjectDefConstraint(WildAID, AVCW);
rmAddObjectDefConstraint(WildAID, AVLAND1);
rmSetObjectDefCreateHerd(WildAID, true);
rmPlaceObjectDefAtLoc(WildAID, 0, 0.85,0.5,1);
int WildBID=rmCreateObjectDef("deer-2");
rmAddObjectDefItem(WildBID, "deer", 25, 20);
rmSetObjectDefMinDistance(WildBID, 30);
rmSetObjectDefMaxDistance(WildBID, 40);
rmAddObjectDefConstraint(WildBID, AVANIMAL);
rmAddObjectDefConstraint(WildBID, AVAll);
rmAddObjectDefConstraint(WildBID, AVTC);
rmAddObjectDefConstraint(WildBID, AVCW);
rmAddObjectDefConstraint(WildBID, AVLAND1);
rmSetObjectDefCreateHerd(WildBID, true);
rmPlaceObjectDefAtLoc(WildBID, 0, 0.50,0.85,1);
int WildCID=rmCreateObjectDef("deer-3");
rmAddObjectDefItem(WildCID, "deer", 25, 20);
rmSetObjectDefMinDistance(WildCID, 30);
rmSetObjectDefMaxDistance(WildCID, 40);
rmAddObjectDefConstraint(WildCID, AVANIMAL);
rmAddObjectDefConstraint(WildCID, AVAll);
rmAddObjectDefConstraint(WildCID, AVTC);
rmAddObjectDefConstraint(WildCID, AVCW);
rmAddObjectDefConstraint(WildCID, AVLAND1);
rmSetObjectDefCreateHerd(WildCID, true);
rmPlaceObjectDefAtLoc(WildCID, 0, 0.5,0.15,1);
int WildDID=rmCreateObjectDef("deer-4");
rmAddObjectDefItem(WildDID, "deer", 25, 20);
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
rmSetAreaForestDensity(forest, 0.6);
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
