// Icefield
// a map for AOE3
// created by RF_Gandalf

include "mercenaries.xs";

// Main entry point for random map script
void main(void)
{
// Text
   rmSetStatusText("",0.01);

// Chooses which natives appear on the map
   int subCiv0=-1;
   subCiv0=rmGetCivID("Nootka");
   rmEchoInfo("subCiv0 is Nootka "+subCiv0);
   if (subCiv0 >= 0)
   	rmSetSubCiv(0, "Nootka");

// Picks the map size
   int playerTiles = 15500;
   if (cNumberNonGaiaPlayers == 8)
	playerTiles = 9000;
   else if (cNumberNonGaiaPlayers == 7)
	playerTiles = 10000;
   else if (cNumberNonGaiaPlayers == 6)
	playerTiles = 11000;
   else if (cNumberNonGaiaPlayers == 5)
	playerTiles = 12000;
   else if (cNumberNonGaiaPlayers == 4)
	playerTiles = 13000;
   else if (cNumberNonGaiaPlayers == 3)
	playerTiles = 14000;

   int size=2*sqrt(cNumberNonGaiaPlayers*playerTiles);
   int longSide=1.5*size; 
   rmSetMapSize(longSide, size);

// Picks a default height
   rmSetSeaLevel(0.0);

// Picks default terrain and water
   rmSetMapElevationParameters(cElevTurbulence, 0.02, 3, 0.5, 8.0);
   rmSetBaseTerrainMix("greatlakes_snow");
   rmTerrainInitialize("great_lakes\ground_snow1_gl", 12);

   int lightChance = rmRandInt(1,5);
   if (lightChance == 1)	
      rmSetLightingSet("308b_caribbeanlight");
   else if (lightChance == 2)
      rmSetLightingSet("319a_snow");
   else if (lightChance == 3)
      rmSetLightingSet("Great Lakes Winter");
   else if (lightChance == 4)
	rmSetLightingSet("yukon");
   else
	rmSetLightingSet("st_petersburg");

   rmSetMapType("rockies");
   rmSetMapType("land");
   rmSetWorldCircleConstraint(true);
   rmSetMapType("snow");
   rmSetGlobalSnow( 0.7 );
   chooseMercs();

// Define some classes. These are used later for constraints.
   int classPlayer=rmDefineClass("player");
   rmDefineClass("center");
   rmDefineClass("startingUnit");
   rmDefineClass("classForest");
   rmDefineClass("importantItem");
   rmDefineClass("nuggets");
   rmDefineClass("classIce");
   rmDefineClass("classMountain");
   rmDefineClass("socketClass");
   rmDefineClass("classCliff");
   rmDefineClass("classHuntable");

// Text
   rmSetStatusText("",0.05);

// -------------Define constraints
   // Map edge constraints
   int centerConstraint=rmCreateClassDistanceConstraint("stay away from center", rmClassID("center"), rmZFractionToMeters(0.40));
   int playerEdgeConstraint=rmCreateBoxConstraint("player edge of map", rmXTilesToFraction(7), rmZTilesToFraction(7), 1.0-rmXTilesToFraction(7), 1.0-rmZTilesToFraction(7), 0.01);
   int silverEdgeConstraint=rmCreateBoxConstraint("silver edge of map", rmXTilesToFraction(20), rmZTilesToFraction(20), 1.0-rmXTilesToFraction(20), 1.0-rmZTilesToFraction(20), 0.01);
   int cliffEdgeConstraint=rmCreateBoxConstraint("cliff edge of map", rmXTilesToFraction(26), rmZTilesToFraction(26), 1.0-rmXTilesToFraction(26), 1.0-rmZTilesToFraction(26), 0.01);
   int circleConstraint=rmCreatePieConstraint("circle Constraint", 0.5, 0.5, 0, rmZFractionToMeters(0.485), rmDegreesToRadians(0), rmDegreesToRadians(360));
   int circleConstraint2=rmCreatePieConstraint("circle Constraint for ice", 0.5, 0.5, 0, rmXFractionToMeters(0.43), rmDegreesToRadians(0), rmDegreesToRadians(360));
   int iceEdgeConstraint = rmCreateBoxConstraint("stay away from edges", rmXTilesToFraction(22), rmZTilesToFraction(28), 1.0-rmXTilesToFraction(22), 1.0-rmZTilesToFraction(28), 0.01);
   int iceEdgeConstraint2 = rmCreateBoxConstraint("stay away from edges more", rmXTilesToFraction(26), rmZTilesToFraction(34), 1.0-rmXTilesToFraction(26), 1.0-rmZTilesToFraction(34), 0.01);

   if (cNumberNonGaiaPlayers > 6)
   {
	iceEdgeConstraint2 = rmCreateBoxConstraint("stay away from edges more 2", rmXTilesToFraction(34), rmZTilesToFraction(40), 1.0-rmXTilesToFraction(34), 1.0-rmZTilesToFraction(40), 0.01);
   }
   else if (cNumberNonGaiaPlayers > 3)
   {
	iceEdgeConstraint2 = rmCreateBoxConstraint("stay away from edges more 3", rmXTilesToFraction(30), rmZTilesToFraction(30), 1.0-rmXTilesToFraction(29), 1.0-rmZTilesToFraction(37), 0.01);
   }

   // Player constraints
   int playerConstraint=rmCreateClassDistanceConstraint("player vs. player", classPlayer, 10.0);
   int nuggetPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players a lot", classPlayer, 60.0);
   int farPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players more", classPlayer, 85.0);
   int fartherPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players the most", classPlayer, 95.0);

   // Resource avoidance
   int forestConstraint=rmCreateClassDistanceConstraint("forest vs. things", rmClassID("classForest"), 8.0);
   int forestVsForestConstraint=rmCreateClassDistanceConstraint("forest vs. other forests", rmClassID("classForest"), 16.0);
   if (cNumberNonGaiaPlayers < 3)
   {
	forestVsForestConstraint=rmCreateClassDistanceConstraint("forest vs. other forests smaller", rmClassID("classForest"), 12.0);
   }
   int playerConstraintForest=rmCreateClassDistanceConstraint("forests kinda stay away from players", classPlayer, 18.0);
   int avoidBighorn=rmCreateClassDistanceConstraint("avoid huntables", rmClassID("classHuntable"), 35.0);
   int avoidCoin=rmCreateTypeDistanceConstraint("stuff avoids coin", "gold", 15.0);
   int coinAvoidCoin=rmCreateTypeDistanceConstraint("coin avoids coin", "gold", 60.0);
   int avoidNuggets=rmCreateClassDistanceConstraint("stuff avoids nuggets", rmClassID("nuggets"), 35.0);
   int avoidAll=rmCreateTypeDistanceConstraint("avoid all", "all", 6.0);

   // Avoid impassable land
   int avoidImpassableLand=rmCreateTerrainDistanceConstraint("avoid impassable land", "Land", false, 8.0);
   int shortAvoidImpassableLand=rmCreateTerrainDistanceConstraint("short avoid impassable land", "Land", false, 2.0);
   int avoidIce = rmCreateClassDistanceConstraint("avoid ice", rmClassID("classIce"), 5.0);
   int avoidIceLarge = rmCreateClassDistanceConstraint("avoid ice by a lot", rmClassID("classIce"), 20.0);
   int avoidMts = rmCreateClassDistanceConstraint("avoid mountains", rmClassID("classMountain"), 22.0);
   int avoidCliffs=rmCreateClassDistanceConstraint("stuff vs. cliff", rmClassID("classCliff"), 12.0);
   int avoidCliff20=rmCreateClassDistanceConstraint("avoid cliffs 20", rmClassID("classCliff"), 20.0);

   // Unit avoidance
   int avoidStartingUnits=rmCreateClassDistanceConstraint("objects avoid starting units", rmClassID("startingUnit"), 15.0);
   int avoidStartingUnitsSmall=rmCreateClassDistanceConstraint("objects avoid starting units small", rmClassID("startingUnit"), 5.0);

   // VP avoidance
   int avoidTradeRoute = rmCreateTradeRouteDistanceConstraint("trade route", 4.0);
   int avoidTradeRouteLong = rmCreateTradeRouteDistanceConstraint("trade route long", 12.0);
   int avoidImportantItem=rmCreateClassDistanceConstraint("important stuff avoids each other", rmClassID("importantItem"), 15.0);
   int avoidImportantItemSmall=rmCreateClassDistanceConstraint("important item small avoidance", rmClassID("importantItem"), 7.0);
   int avoidImportantItemForest=rmCreateClassDistanceConstraint("important stuff avoids each forest", rmClassID("importantItem"), 10.0);
   int avoidSocket=rmCreateClassDistanceConstraint("socket avoidance", rmClassID("socketClass"), 8.0);
   int avoidSocketLong=rmCreateClassDistanceConstraint("socket avoidance long", rmClassID("socketClass"), 12.0);

   // Cardinal Directions - "halves" of the map.
   int NWConstraint = rmCreateBoxConstraint("stay in NW portion", 0, 0.5, 1, 1);
   int SEConstraint = rmCreateBoxConstraint("stay in SE portion", 0, 0, 1, 0.5);
   int NEConstraint = rmCreateBoxConstraint("stay in NE portion", 0.5, 0, 1, 1);
   int SWConstraint = rmCreateBoxConstraint("stay in SW portion", 0, 0, 0.5, 1);
   int NEConstraint2 = rmCreateBoxConstraint("stay in NE portion 2", 0.49, 0, 0.8, 1);
   int SWConstraint2 = rmCreateBoxConstraint("stay in SW portion 2", 0.2, 0, 0.51, 1);
// end constraints ---------------------------------------------------------------------------------------------------

// Text
   rmSetStatusText("",0.10);

   int failCount = 0;
   int numTries = -1;
   int locationChance = rmRandInt(1,4);
   int threeChoice = rmRandInt(1,3);
   int nuggetChance = rmRandInt(1,2);

// DEFINE AREAS
   // Center area
   int centerArea=rmCreateArea("TheCenter");
   rmSetAreaSize(centerArea, 0.01, 0.01);
   rmSetAreaLocation(centerArea, 0.5, 0.5);
   rmAddAreaToClass(centerArea, rmClassID("center")); 

   // Build up edge cliffs
   int bigContinentID=rmCreateArea("big continent");
   rmSetAreaSize(bigContinentID, 0.93, 0.93); 
   rmSetAreaWarnFailure(bigContinentID, false);
   rmSetAreaMix(bigContinentID, "greatlakes_snow");
   rmSetAreaCoherence(bigContinentID, 0.9);
   rmSetAreaLocation(bigContinentID, 0.5, 0.5);
   rmSetAreaCliffType(bigContinentID, "rocky mountain edge");
   rmSetAreaCliffEdge(bigContinentID, 1, 1.0, 0.0, 0.0, 0);
   rmSetAreaCliffHeight(bigContinentID, -4, 1.0, 0.3);
   rmSetAreaCliffPainting(bigContinentID, false, false, true);
   rmBuildArea(bigContinentID);

   int bigContinent2ID=rmCreateArea("big continent 2");
   rmSetAreaSize(bigContinent2ID, 0.88, 0.88); 
   rmSetAreaWarnFailure(bigContinent2ID, false);
   rmSetAreaSmoothDistance(bigContinent2ID, 1);
   rmSetAreaMix(bigContinent2ID, "greatlakes_snow");
   rmSetAreaCoherence(bigContinent2ID, 0.9);
   rmSetAreaLocation(bigContinent2ID, 0.5, 0.5);
   rmSetAreaCliffType(bigContinent2ID, "rocky mountain edge");
   rmSetAreaCliffEdge(bigContinent2ID, 1, 1.0, 0.0, 0.0, 0);
   rmSetAreaCliffHeight(bigContinent2ID, -4, 1.0, 0.3);
   rmSetAreaCliffPainting(bigContinent2ID, false, false, true);
   rmBuildArea(bigContinent2ID);

// Trade Routes - one per side
   int tradeRouteID6 = rmCreateTradeRoute();
   rmAddTradeRouteWaypoint(tradeRouteID6, 1.0, 0.8);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.92, 0.85);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.89, 0.88);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.83, 0.92);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.81, 0.93);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.79, 0.94);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.73, 0.94);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.5, 0.95);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.27, 0.94);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.21, 0.94);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.19, 0.93);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.17, 0.92);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.1, 0.87);
   rmAddTradeRouteWaypoint(tradeRouteID6, 0.08, 0.8);
   rmBuildTradeRoute(tradeRouteID6, "carolinas\trade_route");	

   int tradeRouteID6A = rmCreateTradeRoute();
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.0, 0.2);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.08, 0.15);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.11, 0.12);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.17, 0.08);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.19, 0.07);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.21, 0.06);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.27, 0.06);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.5, 0.05);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.73, 0.06);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.79, 0.06);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.81, 0.07);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.83, 0.08);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.9, 0.13);
   rmAddTradeRouteWaypoint(tradeRouteID6A, 0.92, 0.2);
   rmBuildTradeRoute(tradeRouteID6A, "dirt");

// Text
   rmSetStatusText("",0.15);

// Sockets for the trade routes
   int socketID=rmCreateObjectDef("sockets to dock Trade Posts");
   rmAddObjectDefItem(socketID, "SocketTradeRoute", 1, 0.0);
   rmSetObjectDefAllowOverlap(socketID, true);
   rmAddObjectDefToClass(socketID, rmClassID("importantItem"));
   rmSetObjectDefMinDistance(socketID, 0.0);
   rmSetObjectDefMaxDistance(socketID, 7.0);
   int socketPattern = rmRandInt(1,2);

   // first route
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID6);
   vector socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.19);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   if (socketPattern == 1)
   {
	if (cNumberNonGaiaPlayers < 4)
	{ 
         socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.5);
         rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	}
	else
	{ 
         socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.38);
         rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

         socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.62);
         rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	}
   }
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.82);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   // second route
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID6A);
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6A, 0.19);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   if (socketPattern == 1)
   {
	if (cNumberNonGaiaPlayers < 4)
	{ 
         socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6A, 0.5);
         rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	}
	else
	{ 
         socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6A, 0.38);
         rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

         socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6A, 0.62);
         rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	}
   }
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6A, 0.82);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

// Icefield
   int icePatchID=rmCreateArea("icefield", rmAreaID("big continent 2"));   
   rmSetAreaMix(icePatchID, "great_lakes_ice");
   rmSetAreaTerrainType(icePatchID, "great_lakes\ground_ice1_gl");
   rmSetAreaLocation(icePatchID, 0.5, 0.5); 
   rmSetAreaSize(icePatchID, 0.76, 0.76);
   rmAddAreaConstraint(icePatchID, circleConstraint2);
   rmAddAreaConstraint(icePatchID, iceEdgeConstraint);
   rmAddAreaConstraint(icePatchID, avoidTradeRouteLong);
   rmAddAreaConstraint(icePatchID, avoidSocket);
   rmSetAreaCliffType(icePatchID, "rocky mountain2");
   if (rmRandInt(1,2) == 1)
      rmSetAreaCliffEdge(icePatchID, 9, 0.09, 0.09, 0.4, 0);
   else
      rmSetAreaCliffEdge(icePatchID, 10, 0.08, 0.08, 0.3, 0);
   rmSetAreaCliffHeight(icePatchID, -10, 1.0, 0.3);
   rmSetAreaCoherence(icePatchID, 0.8);
   rmSetAreaHeightBlend(icePatchID, 0.8);
   rmSetAreaCliffPainting(icePatchID, true, true, true, 1.5, true);
   rmSetAreaWarnFailure(icePatchID, false);
   rmAddAreaToClass(icePatchID, rmClassID("classIce"));
   rmBuildArea(icePatchID);

// Text
   rmSetStatusText("",0.20);

// Set up player starting locations.
   if ( cNumberTeams > 2 )
   {
	rmSetTeamSpacingModifier(0.75);
	rmSetPlacementSection(0.15, 0.85);
	rmPlacePlayersCircular(0.3, 0.3, 0);
   }
   else
   {
	rmSetPlacementTeam(0);
	if (cNumberNonGaiaPlayers == 2)
	{
	   rmSetPlacementSection(0.22, 0.27);
	   rmPlacePlayersCircular(0.29, 0.29, 0);
	}
	else if (cNumberNonGaiaPlayers < 5)
	{
	   rmSetPlacementSection(0.16, 0.34);
	   rmPlacePlayersCircular(0.3, 0.3, 0);
	}
	else if (cNumberNonGaiaPlayers < 7)
	{
	   rmSetPlacementSection(0.13, 0.37);
	   rmPlacePlayersCircular(0.3, 0.3, 0);
	}
	else
	{
	   rmSetPlacementSection(0.1, 0.4);	
	   rmPlacePlayersCircular(0.31, 0.31, 0);
	}
		
	rmSetPlacementTeam(1);
	if (cNumberNonGaiaPlayers == 2)
	{
	   rmSetPlacementSection(0.72, 0.77);
	   rmPlacePlayersCircular(0.29, 0.29, 0);
	}
	else if (cNumberNonGaiaPlayers < 5)
	{
	   rmSetPlacementSection(0.66, 0.84);
	   rmPlacePlayersCircular(0.3, 0.3, 0);
	}
	else if (cNumberNonGaiaPlayers < 7)
	{
	   rmSetPlacementSection(0.63, 0.87);
	   rmPlacePlayersCircular(0.3, 0.3, 0);
	}
	else
	{
	   rmSetPlacementSection(0.6, 0.9);
	   rmPlacePlayersCircular(0.31, 0.31, 0);
	}
   }

// Text
   rmSetStatusText("",0.25);

// Set up player areas.
   float playerFraction=rmAreaTilesToFraction(1800);
   for(i=1; <cNumberPlayers)
   {
      int id=rmCreateArea("Player"+i);
      rmSetPlayerArea(i, id);
      rmSetAreaSize(id, 0.9*playerFraction, 1.1*playerFraction);
      rmAddAreaToClass(id, classPlayer);
      rmAddAreaToClass(id, rmClassID("classCliff"));
      rmAddAreaToClass(id, rmClassID("classMountain"));
      rmAddAreaConstraint(id, avoidMts);
      rmSetAreaMinBlobs(id, 1);
      rmSetAreaMaxBlobs(id, 1);
      rmSetAreaCoherence(id, 0.8);
      rmSetAreaSmoothDistance(id, 7);
      rmSetAreaCliffType(id, "rocky mountain2");
      rmSetAreaCliffEdge(id, 2, 0.43, 0.1, 1.0, 1);
      rmSetAreaCliffPainting(id, true, true, true, 1.5, true);
      rmSetAreaCliffHeight(id, 9, 1.0, 0.5);
      rmSetAreaMix(id, "greatlakes_snow");
      rmSetAreaTerrainType(id, "great_lakes\groundforestsnow_gl");
      rmSetAreaLocPlayer(id, i);
 //     rmSetAreaWarnFailure(id, false);
   }
   rmBuildAllAreas();

// Text
   rmSetStatusText("",0.30);

// Some objects defined for placement on land areas
   // Hard Nuggets
   int nugget4= rmCreateObjectDef("nugget nuts"); 
   rmAddObjectDefItem(nugget4, "Nugget", 1, 0.0);
   rmSetNuggetDifficulty(4, 4);
   rmAddObjectDefToClass(nugget4, rmClassID("nuggets"));
   rmSetObjectDefMinDistance(nugget4, 0.0);
   rmSetObjectDefMaxDistance(nugget4, 12.0);
   rmAddObjectDefConstraint(nugget4, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(nugget4, avoidNuggets);
   rmAddObjectDefConstraint(nugget4, avoidAll);

   // Gold mines
   int silverType = rmRandInt(1,10);
   int GoldFarID=rmCreateObjectDef("player silver far");
   rmAddObjectDefItem(GoldFarID, "minegold", 1, 0);
   rmAddObjectDefConstraint(GoldFarID, avoidAll);
   rmAddObjectDefConstraint(GoldFarID, avoidCoin);
   rmSetObjectDefMinDistance(GoldFarID, 0.0);
   rmSetObjectDefMaxDistance(GoldFarID, 10.0);

   // Trees
   int StragglerTreeID=rmCreateObjectDef("straggler trees");
   rmAddObjectDefItem(StragglerTreeID, "TreeRockiesSnow", 1, 0.0);
   rmAddObjectDefConstraint(StragglerTreeID, avoidAll);
   rmAddObjectDefConstraint(StragglerTreeID, avoidStartingUnitsSmall);
   rmSetObjectDefMinDistance(StragglerTreeID, 0);
   rmSetObjectDefMaxDistance(StragglerTreeID, 30);

   // Mountain elk
   int mtElkID=rmCreateObjectDef("mountain elk");
   if (threeChoice == 3)
      rmAddObjectDefItem(mtElkID, "elk", rmRandInt(2,3), 3.0);
   else if (threeChoice == 2)
      rmAddObjectDefItem(mtElkID, "caribou", rmRandInt(2,3), 3.0);
   else
	rmAddObjectDefItem(mtElkID, "BighornSheep", rmRandInt(2,3), 3.0);
   rmAddObjectDefToClass(mtElkID, rmClassID("classHuntable"));
   rmSetObjectDefMinDistance(mtElkID, 0);
   rmSetObjectDefMaxDistance(mtElkID, 16);
   rmAddObjectDefConstraint(mtElkID, farPlayerConstraint);
   rmAddObjectDefConstraint(mtElkID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(mtElkID, avoidBighorn);
   rmAddObjectDefConstraint(mtElkID, avoidAll);
   rmSetObjectDefCreateHerd(mtElkID, true);

// Text
   rmSetStatusText("",0.35);

// Mountain tops for resources
   playerFraction = rmAreaTilesToFraction(900);
   int mountAID=rmCreateArea("mount A");
   rmSetAreaSize(mountAID, 0.8*playerFraction, 1.1*playerFraction);
   if (locationChance == 1)
      rmSetAreaLocation(mountAID, 0.5, 0.275);
   else if (locationChance == 2)
      rmSetAreaLocation(mountAID, 0.5, 0.31);
   else if (locationChance == 3)
      rmSetAreaLocation(mountAID, 0.45, 0.31);
   else if (locationChance == 4)
      rmSetAreaLocation(mountAID, 0.56, 0.29);
   rmAddAreaToClass(mountAID, rmClassID("classMountain"));
   rmSetAreaMinBlobs(mountAID, 2);
   rmSetAreaMaxBlobs(mountAID, 3);
   rmSetAreaMinBlobDistance(mountAID, 15.0);
   rmSetAreaMaxBlobDistance(mountAID, 25.0);
   rmSetAreaCoherence(mountAID, 0.8);
   rmSetAreaCliffType(mountAID, "rocky mountain2");
   rmSetAreaCliffEdge(mountAID, 3, 0.29, 0.2, 1.0, 1);
   rmSetAreaCliffPainting(mountAID, true, true, true, 1.5, true);
   rmSetAreaTerrainType(mountAID, "great_lakes\groundforestsnow_gl");
   rmSetAreaCliffHeight(mountAID, rmRandInt(10,12), 1.0, 0.5);
   rmSetAreaHeightBlend(mountAID, 1);
   rmSetAreaSmoothDistance(mountAID, 20);
   rmBuildArea(mountAID);

   rmPlaceObjectDefInArea(GoldFarID, 0, mountAID, 2);
   rmPlaceObjectDefInArea(nugget4, 0, mountAID, 1);
   rmPlaceObjectDefInArea(StragglerTreeID, 0, mountAID, 6);

   int mountBID=rmCreateArea("mount B");
   rmSetAreaSize(mountBID, 0.9*playerFraction, 1.1*playerFraction);
   if (locationChance == 1)
      rmSetAreaLocation(mountBID, 0.5, 0.725);
   else if (locationChance == 2)
      rmSetAreaLocation(mountBID, 0.5, 0.69);
   else if (locationChance == 3)
      rmSetAreaLocation(mountBID, 0.55, 0.69);
   else if (locationChance == 4)
      rmSetAreaLocation(mountBID, 0.44, 0.71);
   rmAddAreaToClass(mountBID, rmClassID("classMountain"));
   rmSetAreaMinBlobs(mountBID, 2);
   rmSetAreaMaxBlobs(mountBID, 3);
   rmSetAreaMinBlobDistance(mountBID, 15.0);
   rmSetAreaMaxBlobDistance(mountBID, 25.0);
   rmSetAreaCoherence(mountBID, 0.8);
   rmSetAreaCliffType(mountBID, "rocky mountain2");
   rmSetAreaCliffEdge(mountBID, 3, 0.27, 0.15, 1.0, 1);
   rmSetAreaCliffPainting(mountBID, true, true, true, 1.5, true);
   rmSetAreaTerrainType(mountBID, "great_lakes\groundforestsnow_gl");
   rmSetAreaCliffHeight(mountBID, rmRandInt(10,12), 1.0, 0.5);
   rmSetAreaHeightBlend(mountBID, 1);
   rmSetAreaSmoothDistance(mountBID, 20);
   rmBuildArea(mountBID);

   rmPlaceObjectDefInArea(GoldFarID, 0, mountBID, 2);
   rmPlaceObjectDefInArea(nugget4, 0, mountBID, 1);
   rmPlaceObjectDefInArea(StragglerTreeID, 0, mountBID, 6);

   if (rmRandInt(1,2) == 1)
   {
      rmPlaceObjectDefInArea(mtElkID, 0, mountAID, 1);
      rmPlaceObjectDefInArea(mtElkID, 0, mountBID, 1);
   }

// Text
   rmSetStatusText("",0.40);

// Mountain tops for natives
if (cNumberNonGaiaPlayers > 3)
{
   int mountEID=rmCreateArea("mount E");
   rmSetAreaSize(mountEID, playerFraction, 1.15*playerFraction);
   rmSetAreaLocation(mountEID, 0.5, 0.5);
   rmAddAreaToClass(mountEID, rmClassID("classMountain"));
   rmSetAreaMinBlobs(mountEID, 1);
   rmSetAreaMaxBlobs(mountEID, 2);
   rmSetAreaMinBlobDistance(mountEID, 8.0);
   rmSetAreaMaxBlobDistance(mountEID, 12.0);
   rmSetAreaCoherence(mountEID, 0.9);
   rmSetAreaCliffType(mountEID, "rocky mountain2");
   rmSetAreaCliffEdge(mountEID, 3, 0.27, 0.15, 1.0, 1);
   rmSetAreaCliffPainting(mountEID, true, true, true, 1.5, true);
   rmSetAreaTerrainType(mountEID, "great_lakes\groundforestsnow_gl");
   rmSetAreaCliffHeight(mountEID, 5, 0.0, 0.5);
   rmSetAreaHeightBlend(mountEID, 1);
   rmSetAreaSmoothDistance(mountEID, 20);
   rmAddAreaConstraint(mountEID, avoidMts);
   rmAddAreaConstraint(mountEID, avoidImpassableLand);
   rmBuildArea(mountEID);
}

   int mountCID=rmCreateArea("mount C");
   rmSetAreaSize(mountCID, 0.85*playerFraction, playerFraction);
   rmAddAreaToClass(mountCID, rmClassID("classMountain"));
   rmSetAreaCoherence(mountCID, 0.9);
   rmSetAreaCliffType(mountCID, "rocky mountain2");
   rmSetAreaCliffEdge(mountCID, 3, 0.27, 0.15, 1.0, 1);
   rmSetAreaCliffPainting(mountCID, true, true, true, 1.5, true);
   rmSetAreaTerrainType(mountCID, "great_lakes\groundforestsnow_gl");
   rmSetAreaCliffHeight(mountCID, 6, 0.0, 0.5);
   rmSetAreaHeightBlend(mountCID, 1);
   rmSetAreaSmoothDistance(mountCID, 20);
   rmAddAreaConstraint(mountCID, avoidMts);
   rmAddAreaConstraint(mountCID, avoidImpassableLand);
   rmAddAreaConstraint(mountCID, avoidSocket);
   rmAddAreaConstraint(mountCID, avoidTradeRouteLong);
   rmAddAreaConstraint(mountCID, iceEdgeConstraint2);
   if (cNumberNonGaiaPlayers < 4)
      rmAddAreaConstraint(mountCID, SWConstraint2);
   else
      rmAddAreaConstraint(mountCID, SWConstraint);
   rmBuildArea(mountCID);

   int mountDID=rmCreateArea("mount D");
   rmSetAreaSize(mountDID, 0.85*playerFraction, playerFraction);
   rmAddAreaToClass(mountDID, rmClassID("classMountain"));
   rmSetAreaCoherence(mountDID, 0.9);
   rmSetAreaCliffType(mountDID, "rocky mountain2");
   rmSetAreaCliffEdge(mountDID, 3, 0.27, 0.15, 1.0, 1);
   rmSetAreaCliffPainting(mountDID, true, true, true, 1.5, true);
   rmSetAreaTerrainType(mountDID, "great_lakes\groundforestsnow_gl");
   rmSetAreaCliffHeight(mountDID, 6, 0.0, 0.5);
   rmSetAreaHeightBlend(mountDID, 1);
   rmSetAreaSmoothDistance(mountDID, 20);
   rmAddAreaConstraint(mountDID, avoidMts);
   rmAddAreaConstraint(mountDID, avoidImpassableLand);
   rmAddAreaConstraint(mountDID, avoidSocket);
   rmAddAreaConstraint(mountDID, avoidTradeRouteLong);
   rmAddAreaConstraint(mountDID, iceEdgeConstraint2);
   if (cNumberNonGaiaPlayers < 4)
      rmAddAreaConstraint(mountDID, NEConstraint2);
   else
      rmAddAreaConstraint(mountDID, NEConstraint);
   rmBuildArea(mountDID);

// Text
   rmSetStatusText("",0.45);

// Additional 'mountain tops' for resources
   if (cNumberNonGaiaPlayers == 2)
	numTries = 2;
   else if (cNumberNonGaiaPlayers == 3)
	numTries = 2; 
   else if (cNumberNonGaiaPlayers == 4)
	numTries = 3; 
   else if (cNumberNonGaiaPlayers > 6)
	numTries = 5; 
   else
	numTries = cNumberNonGaiaPlayers - 2;
   for(i=0; <numTries)
   { 
	threeChoice = rmRandInt(1,3);
      int smallLandID=rmCreateArea("small land"+i, rmAreaID("big continent 2"));
      rmAddAreaToClass(smallLandID, rmClassID("classMountain"));
      rmSetAreaWarnFailure(smallLandID, false);
      rmSetAreaSize(smallLandID, rmAreaTilesToFraction(450), rmAreaTilesToFraction(700));
      rmSetAreaCliffType(smallLandID, "rocky mountain2");
      rmAddAreaConstraint(smallLandID, avoidMts);
      rmAddAreaConstraint(smallLandID, avoidImpassableLand);
      rmAddAreaConstraint(smallLandID, avoidSocket);
      rmAddAreaConstraint(smallLandID, avoidTradeRouteLong);
	rmAddAreaConstraint(smallLandID, iceEdgeConstraint2);
      rmSetAreaMinBlobs(smallLandID, 1);
      rmSetAreaMaxBlobs(smallLandID, 2);
      rmSetAreaMinBlobDistance(smallLandID, 15.0);
      rmSetAreaMaxBlobDistance(smallLandID, 20.0);
      if (threeChoice == 1)
        rmSetAreaCliffEdge(smallLandID, 1, 0.9, 0.1, 1.0, 0);
	else if (threeChoice == 2) 
        rmSetAreaCliffEdge(smallLandID, 2, 0.43, 0.1, 1.0, 0);
	else
        rmSetAreaCliffEdge(smallLandID, 3, 0.29, 0.1, 1.0, 0);
      rmSetAreaCliffPainting(smallLandID, true, true, true, 1.5, true);
      rmSetAreaTerrainType(smallLandID, "great_lakes\groundforestsnow_gl");
      rmSetAreaCliffHeight(smallLandID, rmRandInt(8,10), 1.0, 1.0);
      rmSetAreaCoherence(smallLandID, 0.75);
      rmSetAreaSmoothDistance(smallLandID, 15);
      rmSetAreaHeightBlend(smallLandID, 1);
      rmBuildArea(smallLandID);

      rmPlaceObjectDefInArea(GoldFarID, 0, rmAreaID("small land"+i), 1);
      rmPlaceObjectDefInArea(StragglerTreeID, 0, rmAreaID("small land"+i), 4);
      if (rmRandInt(1,2) == 1)
         rmPlaceObjectDefInArea(mtElkID, 0, rmAreaID("small land"+i), 1);
   }  

// Text
   rmSetStatusText("",0.50);

// NATIVE AMERICANS
   int VillageAID = -1;
   int VillageType = rmRandInt(1,5);
   VillageAID = rmCreateGrouping("nootka village A", "native nootka village "+VillageType);
   rmSetGroupingMinDistance(VillageAID, 0.0);
   rmSetGroupingMaxDistance(VillageAID, 15.0);
   rmAddGroupingConstraint(VillageAID, avoidImpassableLand);
   rmAddGroupingToClass(VillageAID, rmClassID("importantItem"));
   rmAddGroupingConstraint(VillageAID, avoidSocket);
   rmAddGroupingConstraint(VillageAID, avoidTradeRoute);

   rmPlaceGroupingInArea(VillageAID, 0, rmAreaID("mount C"), 1);
   rmPlaceObjectDefInArea(StragglerTreeID, 0, mountCID, 4);

   int VillageBID = -1;
   VillageType = rmRandInt(1,5);
   VillageBID = rmCreateGrouping("nootka village B", "native nootka village "+VillageType);
   rmSetGroupingMinDistance(VillageBID, 0.0);
   rmSetGroupingMaxDistance(VillageBID, 15.0);
   rmAddGroupingConstraint(VillageBID, avoidImpassableLand);
   rmAddGroupingToClass(VillageBID, rmClassID("importantItem"));
   rmAddGroupingConstraint(VillageBID, avoidSocket);
   rmAddGroupingConstraint(VillageBID, avoidTradeRoute);

   rmPlaceGroupingInArea(VillageBID, 0, rmAreaID("mount D"), 1);
   rmPlaceObjectDefInArea(StragglerTreeID, 0, mountDID, 4);

   if (rmRandInt(1,2) == 1)
   {
      rmPlaceObjectDefInArea(mtElkID, 0, mountDID, 1);
      rmPlaceObjectDefInArea(mtElkID, 0, mountCID, 1);
   }

   if (cNumberNonGaiaPlayers > 3)
   {
      rmPlaceGroupingInArea(VillageBID, 0, rmAreaID("mount E"), 1);
      rmPlaceObjectDefInArea(GoldFarID, 0, mountEID, 1);
      rmPlaceObjectDefInArea(StragglerTreeID, 0, mountEID, 4);
      if (rmRandInt(1,3) == 1)
         rmPlaceObjectDefInArea(mtElkID, 0, mountEID, 1);
   }

// Text
   rmSetStatusText("",0.55);

//STARTING UNITS
   int startingTCID= rmCreateObjectDef("startingTC");
   if ( rmGetNomadStart())
   {
	rmAddObjectDefItem(startingTCID, "CoveredWagon", 1, 0.0);
   }
   else
   {
 	rmAddObjectDefItem(startingTCID, "TownCenter", 1, 0.0);
   }
   rmAddObjectDefToClass(startingTCID, rmClassID("startingUnit"));
   rmAddObjectDefConstraint(startingTCID, avoidTradeRoute);
   rmSetObjectDefMinDistance(startingTCID, 0.0);
   rmSetObjectDefMaxDistance(startingTCID, 16.0);

   int startingUnits = rmCreateStartingUnitsObjectDef(5.0);
   rmSetObjectDefMinDistance(startingUnits, 5.0);
   rmSetObjectDefMaxDistance(startingUnits, 8.0);
   rmAddObjectDefConstraint(startingUnits, avoidStartingUnitsSmall);
	
   int StartAreaTreeID=rmCreateObjectDef("starting trees");
   rmAddObjectDefItem(StartAreaTreeID, "TreeRockiesSnow", 1, 0.0);
   rmSetObjectDefMinDistance(StartAreaTreeID, 12.0);
   rmSetObjectDefMaxDistance(StartAreaTreeID, 20.0);
   rmAddObjectDefConstraint(StartAreaTreeID, avoidStartingUnitsSmall);

   int StartBighornID=rmCreateObjectDef("starting bighorn");
   rmAddObjectDefItem(StartBighornID, "bighornsheep", 5, 4.0);
   rmAddObjectDefToClass(StartBighornID, rmClassID("classHuntable"));
   rmSetObjectDefMinDistance(StartBighornID, 9.0);
   rmSetObjectDefMaxDistance(StartBighornID, 13.0);
   rmSetObjectDefCreateHerd(StartBighornID, true);
   rmAddObjectDefConstraint(StartBighornID, avoidStartingUnitsSmall);

   int playerNuggetID=rmCreateObjectDef("player nugget");
   rmAddObjectDefItem(playerNuggetID, "nugget", 1, 0.0);
   rmAddObjectDefToClass(playerNuggetID, rmClassID("nuggets"));
   rmAddObjectDefToClass(playerNuggetID, rmClassID("startingUnit"));
   rmSetObjectDefMinDistance(playerNuggetID, 30.0);
   rmSetObjectDefMaxDistance(playerNuggetID, 35.0);
   rmAddObjectDefConstraint(playerNuggetID, avoidStartingUnitsSmall);
   rmAddObjectDefConstraint(playerNuggetID, avoidTradeRoute);
   rmAddObjectDefConstraint(playerNuggetID, avoidNuggets);
   rmAddObjectDefConstraint(playerNuggetID, playerEdgeConstraint);	
   rmAddObjectDefConstraint(playerNuggetID, circleConstraint);

   int playerGoldID=rmCreateObjectDef("player silver ore");
   silverType = rmRandInt(1,10);
   for(i=1; <cNumberPlayers)
   {
	rmPlaceObjectDefAtLoc(startingTCID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(startingUnits, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	// Everyone gets two ore groupings, one pretty close, the other a little further away.
	silverType = rmRandInt(1,10);
	playerGoldID = rmCreateObjectDef("player silver closer "+i);
	rmAddObjectDefItem(playerGoldID, "mine", 1, 0.0);
	rmAddObjectDefConstraint(playerGoldID, avoidStartingUnitsSmall);
	rmSetObjectDefMinDistance(playerGoldID, 15.0);
	rmSetObjectDefMaxDistance(playerGoldID, 20.0);
	rmPlaceObjectDefAtLoc(playerGoldID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	// Placing starting Pronghorns...
	rmPlaceObjectDefAtLoc(StartBighornID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	// Placing starting trees...
	rmPlaceObjectDefAtLoc(StartAreaTreeID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(StartAreaTreeID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(StartAreaTreeID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(StartAreaTreeID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(StartAreaTreeID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(StartAreaTreeID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(StartAreaTreeID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(StartAreaTreeID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	// Nuggets
	rmSetNuggetDifficulty(1, 1);
	rmPlaceObjectDefAtLoc(playerNuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(playerNuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
   }

// Text
   rmSetStatusText("",0.60); 

// Cliffs
   int numCliffs = cNumberNonGaiaPlayers + rmRandInt(2,4);
   int cliffHt = 0;
   for (i=0; <numCliffs)
   {
	threeChoice = rmRandInt(1,3);
      cliffHt = rmRandInt(7,10);    
	int bigCliffID=rmCreateArea("big cliff" +i);
	rmSetAreaWarnFailure(bigCliffID, false);
	rmSetAreaCliffType(bigCliffID, "rocky mountain2");
	rmAddAreaToClass(bigCliffID, rmClassID("classCliff"));
      rmSetAreaSize(bigCliffID, rmAreaTilesToFraction(250), rmAreaTilesToFraction(350));
	if (threeChoice == 1)
         rmSetAreaCliffEdge(bigCliffID, 1, 0.55, 0.1, 1.0, 0);
	else if (threeChoice == 2)
         rmSetAreaCliffEdge(bigCliffID, 1, 0.8, 0.1, 1.0, 0);
	else
         rmSetAreaCliffEdge(bigCliffID, 2, 0.41, 0.08, 1.0, 0);
      rmSetAreaCliffPainting(bigCliffID, true, true, true, 1.5, true);
      rmSetAreaCliffHeight(bigCliffID, cliffHt, 1.0, 1.0);
	rmSetAreaCoherence(bigCliffID, rmRandFloat(0.5, 0.9));
	rmSetAreaSmoothDistance(bigCliffID, 10);
	rmSetAreaHeightBlend(bigCliffID, 2.0);
	rmSetAreaMinBlobs(bigCliffID, 1);
	rmSetAreaMaxBlobs(bigCliffID, 3);
	rmSetAreaMinBlobDistance(bigCliffID, 8);
	rmSetAreaMaxBlobDistance(bigCliffID, 15);
	rmAddAreaConstraint(bigCliffID, avoidImportantItem);
	rmAddAreaConstraint(bigCliffID, avoidTradeRoute);
	rmAddAreaConstraint(bigCliffID, avoidCliff20);
	rmAddAreaConstraint(bigCliffID, avoidSocket);
	rmAddAreaConstraint(bigCliffID, avoidIce);
	rmAddAreaConstraint(bigCliffID, avoidCoin);
	rmAddAreaConstraint(bigCliffID, avoidStartingUnits);
	rmAddAreaConstraint(bigCliffID, nuggetPlayerConstraint);
	if (cNumberNonGaiaPlayers < 4)
	   rmAddAreaConstraint(bigCliffID, silverEdgeConstraint);
	else
	   rmAddAreaConstraint(bigCliffID, cliffEdgeConstraint);
	rmBuildArea(bigCliffID);
   }

// Text
   rmSetStatusText("",0.65);

// Define and place forests - west and east
   numTries=3*cNumberNonGaiaPlayers;  
   failCount=0;
   for (i=0; <numTries)
   {   
	int westForest=rmCreateArea("westForest"+i);
	rmSetAreaWarnFailure(westForest, false);
	rmAddAreaToClass(westForest, rmClassID("classForest"));
	rmSetAreaSize(westForest, rmAreaTilesToFraction(165), rmAreaTilesToFraction(210));
	rmSetAreaForestType(westForest, "rockies snow forest");
	rmSetAreaForestDensity(westForest, 0.9);
	rmSetAreaForestClumpiness(westForest, 0.3);					
	rmSetAreaForestUnderbrush(westForest, 0.0);
	rmSetAreaCoherence(westForest, 0.3);
	rmSetAreaSmoothDistance(westForest, 10);
	rmSetAreaObeyWorldCircleConstraint(westForest, false);
	rmAddAreaConstraint(westForest, avoidImportantItemForest);		
	rmAddAreaConstraint(westForest, playerConstraintForest);	
	rmAddAreaConstraint(westForest, forestVsForestConstraint);			
	rmAddAreaConstraint(westForest, SWConstraint);				
	rmAddAreaConstraint(westForest, avoidTradeRoute);
	rmAddAreaConstraint(westForest, avoidIce);
	rmAddAreaConstraint(westForest, avoidSocket);
	rmAddAreaConstraint(westForest, avoidCoin);
	rmAddAreaConstraint(westForest, playerEdgeConstraint);
	rmAddAreaConstraint(westForest, avoidStartingUnits);
	if(rmBuildArea(westForest)==false)
	{
		// Stop trying once we fail 5 times in a row.
		failCount++;
		if(failCount==5)
			break;
	}
	else
		failCount=0; 
   }

// Text
   rmSetStatusText("",0.70);

   numTries=3*cNumberNonGaiaPlayers;  
   failCount=0;
   for (i=0; <numTries)
   {   
	int eastForest=rmCreateArea("eastForest"+i);
	rmSetAreaWarnFailure(eastForest, false);
	rmAddAreaToClass(eastForest, rmClassID("classForest"));
      rmSetAreaSize(eastForest, rmAreaTilesToFraction(165), rmAreaTilesToFraction(210));
	rmSetAreaForestType(eastForest, "rockies snow forest");
	rmSetAreaForestDensity(eastForest, 0.9);
	rmSetAreaForestClumpiness(eastForest, 0.3);					
	rmSetAreaForestUnderbrush(eastForest, 0.0);
	rmSetAreaCoherence(eastForest, 0.3);
	rmSetAreaSmoothDistance(eastForest, 10);
	rmSetAreaObeyWorldCircleConstraint(eastForest, false);
	rmAddAreaConstraint(eastForest, avoidImportantItemForest);	
	rmAddAreaConstraint(eastForest, playerConstraintForest);		
	rmAddAreaConstraint(eastForest, forestVsForestConstraint);		
	rmAddAreaConstraint(eastForest, NEConstraint);	
	rmAddAreaConstraint(eastForest, avoidTradeRoute);
	rmAddAreaConstraint(eastForest, avoidIce);
	rmAddAreaConstraint(eastForest, avoidSocket);
	rmAddAreaConstraint(eastForest, avoidCoin);
	rmAddAreaConstraint(eastForest, playerEdgeConstraint);
	rmAddAreaConstraint(eastForest, avoidStartingUnits);
	if(rmBuildArea(eastForest)==false)
	{
		// Stop trying once we fail 5 times in a row.
		failCount++;
		if(failCount==5)
			break;
	}
	else
		failCount=0;
   } 

// Text
   rmSetStatusText("",0.75);

// Huntables - two groups on each side per player
   threeChoice = rmRandInt(1,3);
   int bighorn1ID=rmCreateObjectDef("bighorn herd 1");
   if (threeChoice == 1)
      rmAddObjectDefItem(bighorn1ID, "elk", rmRandInt(6,8), 10.0);
   else if (threeChoice == 3)
      rmAddObjectDefItem(bighorn1ID, "caribou", rmRandInt(6,8), 10.0);
   else
	rmAddObjectDefItem(bighorn1ID, "BighornSheep", rmRandInt(6,8), 10.0);
   rmAddObjectDefToClass(bighorn1ID, rmClassID("classHuntable"));
   rmSetObjectDefMinDistance(bighorn1ID, 40);
   rmSetObjectDefMaxDistance(bighorn1ID, size*0.5);
   rmAddObjectDefConstraint(bighorn1ID, avoidBighorn);
   rmAddObjectDefConstraint(bighorn1ID, avoidImpassableLand);
   rmAddObjectDefConstraint(bighorn1ID, avoidTradeRoute);
   rmAddObjectDefConstraint(bighorn1ID, avoidSocket);
   rmAddObjectDefConstraint(bighorn1ID, forestConstraint);
   rmAddObjectDefConstraint(bighorn1ID, avoidIce);
   rmAddObjectDefConstraint(bighorn1ID, avoidCoin);
   rmAddObjectDefConstraint(bighorn1ID, avoidStartingUnits);
   rmAddObjectDefConstraint(bighorn1ID, silverEdgeConstraint);
   rmAddObjectDefConstraint(bighorn1ID, centerConstraint);
   rmSetObjectDefCreateHerd(bighorn1ID, true);
   rmPlaceObjectDefPerPlayer(bighorn1ID, false, 1);

   threeChoice = rmRandInt(1,3);
   int bighorn2ID=rmCreateObjectDef("bighorn herd 2");
   if (threeChoice == 2)
      rmAddObjectDefItem(bighorn2ID, "elk", rmRandInt(6,8), 10.0);
   else if (threeChoice == 1)
      rmAddObjectDefItem(bighorn2ID, "caribou", rmRandInt(6,8), 10.0);
   else
	rmAddObjectDefItem(bighorn2ID, "BighornSheep", rmRandInt(6,8), 10.0);
   rmAddObjectDefToClass(bighorn2ID, rmClassID("classHuntable"));
   rmSetObjectDefMinDistance(bighorn2ID, 65);
   rmSetObjectDefMaxDistance(bighorn2ID, size*0.6);
   rmAddObjectDefConstraint(bighorn2ID, avoidBighorn);
   rmAddObjectDefConstraint(bighorn2ID, avoidImpassableLand);
   rmAddObjectDefConstraint(bighorn2ID, avoidTradeRoute);
   rmAddObjectDefConstraint(bighorn2ID, avoidSocket);
   rmAddObjectDefConstraint(bighorn2ID, forestConstraint);
   rmAddObjectDefConstraint(bighorn2ID, avoidIce);
   rmAddObjectDefConstraint(bighorn2ID, avoidCoin);
   rmAddObjectDefConstraint(bighorn2ID, avoidStartingUnits);
   rmAddObjectDefConstraint(bighorn2ID, silverEdgeConstraint);
   rmAddObjectDefConstraint(bighorn2ID, centerConstraint);
   rmSetObjectDefCreateHerd(bighorn2ID, true);
   rmPlaceObjectDefPerPlayer(bighorn2ID, false, 1);

// Text
   rmSetStatusText("",0.80);

// Random Nuggets
   int nugget2= rmCreateObjectDef("nugget medium"); 
   rmAddObjectDefItem(nugget2, "Nugget", 1, 0.0);
   rmSetNuggetDifficulty(2, 2);
   rmAddObjectDefToClass(nugget2, rmClassID("nuggets"));
   rmSetObjectDefMinDistance(nugget2, 60.0);
   rmSetObjectDefMaxDistance(nugget2, 110.0);
   rmAddObjectDefConstraint(nugget2, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(nugget2, avoidSocket);
   rmAddObjectDefConstraint(nugget2, avoidTradeRoute);
   rmAddObjectDefConstraint(nugget2, nuggetPlayerConstraint);
   rmAddObjectDefConstraint(nugget2, avoidNuggets);
   rmAddObjectDefConstraint(nugget2, playerEdgeConstraint);
   rmAddObjectDefConstraint(nugget2, centerConstraint);
   rmAddObjectDefConstraint(nugget2, avoidAll);

   if (nuggetChance == 1)
      rmPlaceObjectDefPerPlayer(nugget2, false, 2);
   else
      rmPlaceObjectDefPerPlayer(nugget2, false, 1);

   int nugget3= rmCreateObjectDef("nugget hard"); 
   rmAddObjectDefItem(nugget3, "Nugget", 1, 0.0);
   rmSetNuggetDifficulty(3, 3);
   rmAddObjectDefToClass(nugget3, rmClassID("nuggets"));
   rmSetObjectDefMinDistance(nugget3, 80.0);
   rmSetObjectDefMaxDistance(nugget3, size*0.55);
   rmAddObjectDefConstraint(nugget3, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(nugget3, avoidSocket);
   rmAddObjectDefConstraint(nugget3, avoidTradeRoute);
   rmAddObjectDefConstraint(nugget3, farPlayerConstraint);
   rmAddObjectDefConstraint(nugget3, avoidNuggets);
   rmAddObjectDefConstraint(nugget3, playerEdgeConstraint);
   rmAddObjectDefConstraint(nugget3, centerConstraint);
   rmAddObjectDefConstraint(nugget3, avoidAll);

   if (nuggetChance == 1)
      rmPlaceObjectDefPerPlayer(nugget3, false, 1);
   else
      rmPlaceObjectDefPerPlayer(nugget3, false, 2); 

// Text
   rmSetStatusText("",0.85);

// Lone elk
   int loneElkID=rmCreateObjectDef("lone elk");
   if (threeChoice == 3)
      rmAddObjectDefItem(loneElkID, "elk", rmRandInt(1,2), 3.0);
   else if (threeChoice == 2)
      rmAddObjectDefItem(loneElkID, "caribou", rmRandInt(1,2), 3.0);
   else
	rmAddObjectDefItem(loneElkID, "BighornSheep", rmRandInt(1,2), 3.0);
   rmSetObjectDefMinDistance(loneElkID, 80);
   rmSetObjectDefMaxDistance(loneElkID, size*0.6);
   rmAddObjectDefConstraint(loneElkID, farPlayerConstraint);
   rmAddObjectDefConstraint(loneElkID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(loneElkID, playerEdgeConstraint);
   rmAddObjectDefConstraint(loneElkID, avoidBighorn);
   rmAddObjectDefConstraint(loneElkID, avoidAll);
   rmAddObjectDefConstraint(loneElkID, avoidIce);
   rmAddObjectDefConstraint(loneElkID, centerConstraint);
   rmSetObjectDefCreateHerd(loneElkID, true);
   rmPlaceObjectDefPerPlayer(loneElkID, false, 2);

// Text
   rmSetStatusText("",0.90);

// Extra tree clumps near players - to ensure fair access to wood
   int extraTreesID=rmCreateObjectDef("extra trees");
   rmAddObjectDefItem(extraTreesID, "TreeRockiesSnow", 5, 5.0);  
   rmSetObjectDefMinDistance(extraTreesID, 14);
   rmSetObjectDefMaxDistance(extraTreesID, 19);
   rmAddObjectDefConstraint(extraTreesID, avoidAll);
   rmAddObjectDefConstraint(extraTreesID, avoidCoin);
   for(i=1; <cNumberPlayers)
      rmPlaceObjectDefInArea(extraTreesID, 0, rmAreaID("Player"+i), 2);

// Text
   rmSetStatusText("",0.95);

// Random trees
   rmAddObjectDefConstraint(StragglerTreeID, avoidIce);
   rmSetObjectDefMinDistance(StragglerTreeID, 10.0);
   rmSetObjectDefMaxDistance(StragglerTreeID, size);
   for(i=0; <cNumberNonGaiaPlayers*20)
      rmPlaceObjectDefAtLoc(StragglerTreeID, 0, 0.5, 0.5);

// Text
   rmSetStatusText("",1.0);
}