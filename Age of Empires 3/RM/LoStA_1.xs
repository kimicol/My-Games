// Land Unknown adapted to Rocket
// ver 05 May 2006

// version history
// 17 Mar - Explorers can be closer and farther from TC
// 17 Mar - TCs avoid trade routes less than other objects do
// 17 Mar - Player areas larger to avoid river eating TC problems on small maps
// 17 Mar - Water flags can be farther from player towns
// 12 Apr - Water flags place more consistently
// 12 Apr - Water flags avoid ponds
// 05 May - Natives allocated correctly
// 05 May - Player trees more consistent
// 05 May - Dangerous nuggets are more rare
// 05 May - Continental style more rare

void main(void)
{

  // Text
   rmSetStatusText("",0.01);

  // Set size.

   int playerTiles=24000;
	if (cNumberNonGaiaPlayers >4)
		playerTiles = 17000;
	if (cNumberNonGaiaPlayers >7)
		playerTiles = 19000;
	int size=2.0*sqrt(cNumberNonGaiaPlayers*playerTiles);
	rmEchoInfo("Map size="+size+"m x "+size+"m");
	rmSetMapSize(size, size);
	rmSetMapElevationParameters(cElevTurbulence, 0.02, rmRandFloat(2, 4), 0.7, 8.0);

// ============= Base terrain ============= 

	float baseTerrain = rmRandFloat(0,1);
	int amazonMap = -1;
	int carolinaMap = -1;
	int saguenayMap = -1;
	int rockiesMap = -1;
	int sonoraMap = -1;
	string riverName = "";
	string oceanName = "";
	string pondName = "";
	string cliffName = "";
	string forestName = "";
	string landName = "";
	string treeName = "";
	string critterOneName = "";
	string critterTwoName = "";
	string livestockName = "";
	string fishName = "";
	string whaleName = "";

	if(baseTerrain < 0.2)
	{
		rmEchoInfo("Amazon terrain");
		amazonMap = 1;
		rmSetBaseTerrainMix("amazon grass");
		rmTerrainInitialize("pampas\ground5_pam", 6);
		rmSetMapType("yucatan");
		rmSetMapType("tropical");
		rmSetMapType("land");
	        rmSetLightingSet("amazon");
		riverName = "Amazon River";
		oceanName = "Amazon River Basin";
		pondName = "Bayou";
		cliffName = "Amazon";
		forestName = "Amazon Rain Forest";
		landName = "amazon grass";
		treeName = "treeAmazon";
		critterOneName = "capybara";
		critterTwoName = "tapir";
		livestockName = "cow";
		fishName = "fishMahi";
		whaleName = "humpbackWhale";
	}

	else if(baseTerrain < 0.4)
	{
		rmEchoInfo("Carolina terrain");
		carolinaMap = 1;
		rmSetBaseTerrainMix("carolina_grass");
		rmTerrainInitialize("pampas\ground5_pam", 6);
		rmSetMapType("carolina");
		rmSetMapType("grass");
		rmSetMapType("land");
		rmSetLightingSet("carolina");
		riverName = "Pampas River";
		oceanName = "Atlantic Coast";
		pondName = "Texas Pond";
		cliffName = "Carolina Inland";
		forestName = "Carolina Pine Forest";
		landName = "carolina_grass";
		treeName = "treeCarolinaGrass";
		critterOneName = "turkey";
		critterTwoName = "deer";
		livestockName = "sheep";
		fishName = "fishCod";
		whaleName = "humpbackWhale";
	}

	else if(baseTerrain < 0.6)
	{
		rmEchoInfo("Saguenay terrain");
		saguenayMap = 1;
		rmSetBaseTerrainMix("saguenay tundra");
		rmTerrainInitialize("saguenay\ground1_sag",6);
		rmSetMapType("saguenay");
		rmSetMapType("grass");
		rmSetMapType("land");
	        rmSetLightingSet("saguenay");
		riverName = "Amazon River";
		oceanName = "Hudson Bay";
		pondName = "Saguenay Lake";
		cliffName = "New England Inland";
		forestName = "Saguenay Forest";
		landName = "saguenay tundra";
		treeName = "treeSaguenay";
		critterOneName = "elk";
		critterTwoName = "moose";
		livestockName = "sheep";
		fishName = "fishSalmon";
		whaleName = "minkeWhale";
	}

	else if(baseTerrain < 0.8)
	{
		rmEchoInfo("Rockies terrain");
		rockiesMap = 1;
		rmSetBaseTerrainMix("rockies_snow");
		rmTerrainInitialize("rockies\groundsnow1_roc", 6);
                rmSetGlobalSnow( 1.0 );	
		rmSetMapType("rockies");
		rmSetMapType("land");
		rmSetLightingSet("rockies");
		riverName = "Yukon River";
		oceanName = "Great Lakes Ice";
		pondName = "Great Lakes Ice";
		cliffName = "Rocky Mountain2";
		forestName = "Rockies Snow Forest";
		landName = "rockies_snow";
		treeName = "treeRockies";
		critterOneName = "caribou";
		critterTwoName = "muskOx";
		livestockName = "cow";
		fishName = "fishSardine";
		whaleName = "beluga";
	}

	else
	{
		rmEchoInfo("Sonora terrain");
		sonoraMap = 1;
		rmSetBaseTerrainMix("sonora_dirt");
		rmTerrainInitialize("sonora\ground2_son", 6);
		rmSetMapType("sonora");
		rmSetMapType("grass");
		rmSetMapType("land");
		rmSetLightingSet("Sonora");
		riverName = "Pampas River";
		oceanName = "Great Lakes";
		pondName = "Great Lakes"; 
		cliffName = "Sonora";
		forestName = "Sonora Forest";
		landName = "sonora_dirt";
		treeName = "treeSonora";
		critterOneName = "turkey";
		critterTwoName = "rhea";
		livestockName = "llama";
		fishName = "fishTarpon";
		whaleName = "humpbackWhale";
	}

	// Text
   rmSetStatusText("", 0.1);



// ============= Classes =============

	int classPlayer=rmDefineClass("player");
	int classNatives=rmDefineClass("natives");
	int classCanyon=rmDefineClass("canyon");
	int pondClass=rmDefineClass("pond");
	rmDefineClass("startingUnit");
	rmDefineClass("classForest");



// ============= Constraints =============

	int avoidImpassableLand = rmCreateTerrainDistanceConstraint("avoid impassable land", "Land", false, 24.0);
	int playerAvoidImpassableLand = rmCreateTerrainDistanceConstraint("player avoid impassable land", "Land", false, 18.0);
	int mediumAvoidImpassableLand = rmCreateTerrainDistanceConstraint("slightly avoid impassable", "Land", false, 12.0);
	int shortAvoidImpassableLand = rmCreateTerrainDistanceConstraint("just barely avoid impassable", "Land", false, 4.0);
	int TCAvoidImpassableLand = rmCreateTerrainDistanceConstraint("TCs vs impassable land", "Land", false, 8.0);
	int avoidPlayers = rmCreateClassDistanceConstraint("stay away from players medium", classPlayer, 15.0);
	int avoidPlayersFar = rmCreateClassDistanceConstraint("stay away from players far", classPlayer, 50.0);
	int avoidTradeRoute = rmCreateTradeRouteDistanceConstraint("trade route", 10.0);
	int avoidTradeRouteSocket = rmCreateTypeDistanceConstraint("avoid trade route sockets", "sockettraderoute", 15.0);
	int TCAvoidTradeRoute = rmCreateTradeRouteDistanceConstraint("TC vs trade route", 4.0);
	int TCAvoidTradeRouteSocket = rmCreateTypeDistanceConstraint("TC avoid trade route sockets", "sockettraderoute", 8.0);
	int avoidNatives = rmCreateClassDistanceConstraint("stay away from natives", classNatives, 60.0);
	int nativesAvoidPlayers = rmCreateClassDistanceConstraint("natives vs. players", classPlayer, 50.0);
   int edgeConstraint=rmCreatePieConstraint("continent avoids edge",  0.5, 0.5, 0, rmGetMapXSize()-30, 0, 0, 0);
	int avoidCanyon = rmCreateClassDistanceConstraint("don't place on mesa where you can't path", classCanyon, 2.0);
   int pondConstraint=rmCreateClassDistanceConstraint("ponds avoid ponds", rmClassID("pond"), 30.0);
   int forestConstraint=rmCreateClassDistanceConstraint("forest vs. forest", rmClassID("classForest"), 20.0);
	int avoidTC=rmCreateTypeDistanceConstraint("vs. TC", "TownCenter", 20.0);
	int avoidCW=rmCreateTypeDistanceConstraint("vs. CW", "CoveredWagon", 20.0);
   int avoidNugget=rmCreateTypeDistanceConstraint("nugget avoid nugget", "nugget", 50.0);
   int fishVsFishID=rmCreateTypeDistanceConstraint("fish v fish", "abstractFish", 20.0);
   int whaleVsWhaleID=rmCreateTypeDistanceConstraint("whale v whale", "abstractWhale", 25.0);
   int fishLand = rmCreateTerrainDistanceConstraint("fish land", "land", true, 6.0);
   int whaleLand = rmCreateTerrainDistanceConstraint("whale v. land", "land", true, 20.0);
	int flagVsFlag = rmCreateTypeDistanceConstraint("flag avoid same", "HomeCityWaterSpawnFlag", 15);
   int avoidFood = rmCreateTypeDistanceConstraint("food avoids food", "food", 40.0);
	int avoidSilver = rmCreateTypeDistanceConstraint("fast coin avoids coin", "gold", 40.0);
         int avoidSheep = rmCreateTypeDistanceConstraint("sheep avoids sheep", "sheep", 40.0);
   int avoidAll=rmCreateTypeDistanceConstraint("avoid all", "all", 4.0);



// ============= Land and Water Configuration =============

	int allLand = 1;
	int riverExists = -1;
	int oceanMiddle = -1;
	int oceanOffCenter = -1;
	int oceanRing = -1;
	int plateauMiddle = -1;
	int forestMiddle = -1;
	int blockedMiddle = -1; // used to determine if trade route should be a circle
	
	float landConfig = rmRandFloat(0,1);

// ============= Land Only =============
	if(landConfig < 0.25)
		rmEchoInfo("just land");

// ============= River Across Middle =============
	else if(landConfig < 0.35)
	{
		rmEchoInfo("river exists");
		allLand = -1;
		riverExists = 1;
		int unknownRiver = rmRiverCreate(-1, riverName, 30, 15, 5, 8);
		float riverPosition = rmRandFloat(0,1);

		// Spin river randomly around the edge		
		if(riverPosition < 0.12)
			rmRiverSetConnections(unknownRiver, 0.0, 0.5, 1.0, 0.5);
		else if(riverPosition < 0.24)
			rmRiverSetConnections(unknownRiver, 0.0, 0.0, 1.0, 1.0);
		else if(riverPosition < 0.36)
			rmRiverSetConnections(unknownRiver, 0.5, 0.0, 0.5, 1.0);
		else if(riverPosition < 0.48)
			rmRiverSetConnections(unknownRiver, 0.0, 1.0, 1.0, 0.0);
		else if(riverPosition < 0.60)
			rmRiverSetConnections(unknownRiver, 0.0, 0.25, 1.0, 0.75);
		else if(riverPosition < 0.72)
			rmRiverSetConnections(unknownRiver, 0.0, 0.75, 1.0, 0.25);
		else if(riverPosition < 0.84)
			rmRiverSetConnections(unknownRiver, 0.25, 0.0, 0.75, 1.0);
		else
			rmRiverSetConnections(unknownRiver, 0.75, 0.0, 0.25, 1.0);
		
		// River always has 2 shallows and usually 3
		rmRiverSetShallowRadius(unknownRiver, rmRandInt(10, 12));
		rmRiverAddShallow(unknownRiver, rmRandFloat(0.1, 0.35)); 

		if(rmRandFloat(0,1) < 0.66)
		{
			rmRiverSetShallowRadius(unknownRiver, rmRandInt(10, 12));
			rmRiverAddShallow(unknownRiver, 0.5);
		}

		rmRiverSetShallowRadius(unknownRiver, rmRandInt(10, 12));
		rmRiverAddShallow(unknownRiver, rmRandFloat(0.65, 0.95));
		rmRiverSetBankNoiseParams(unknownRiver, 0.07, 2, 1.5, 10.0, 0.667, 3.0);

		rmRiverBuild(unknownRiver);
	}

// ============= Great Lakes Style Ocean =============
	else if(landConfig < 0.53)
	{
		rmEchoInfo("ocean in middle");
		allLand = -1;
		oceanMiddle = 1;
		blockedMiddle = 1;

		// But don't build ocean every single time
		if(rmRandFloat(0,1) < 0.9)
		{
			int lakeOfTheUnknown=rmCreateArea("big lake in middle");
			rmSetAreaWaterType(lakeOfTheUnknown, oceanName);
			if(rmRandFloat(0,1) < 0.6)
			{
				rmSetAreaSize(lakeOfTheUnknown, 0.07, 0.15);
				rmEchoInfo("larger lake");
			}
			else
			{
				rmSetAreaSize(lakeOfTheUnknown, 0.02, 0.05);
				rmEchoInfo("smaller lake");
			}
			rmSetAreaLocation(lakeOfTheUnknown, 0.5, 0.5);
			rmAddAreaConstraint(lakeOfTheUnknown, avoidPlayers);
			rmSetAreaSmoothDistance(lakeOfTheUnknown, 50);
			rmSetAreaCoherence(lakeOfTheUnknown, 0.25);
		}
	} 

// Build the lake later to avoid players

// ============= Saguenay Style Ocean =============
	else if(landConfig < 0.67)
	{
		rmEchoInfo("ocean off center");
		allLand = -1;
		oceanOffCenter = 1;
		float bayPosition = rmRandFloat(0,1);
		int unknownBay=rmCreateArea("big bay on edge");
		rmSetAreaWaterType(unknownBay, oceanName);
		rmSetAreaWarnFailure(unknownBay, false);
		rmSetAreaSize(unknownBay, 0.08, 0.15);

		// Spin bay randomly around the edge		
		if(bayPosition < 0.12)
			rmSetAreaLocation(unknownBay, 0.0, 0.0);
		else if(bayPosition < 0.24)
			rmSetAreaLocation(unknownBay, 0.0, 0.5);
		else if(bayPosition < 0.36)
			rmSetAreaLocation(unknownBay, 0.0, 1.0);
		else if(bayPosition < 0.48)
			rmSetAreaLocation(unknownBay, 0.5, 1.0);
		else if(bayPosition < 0.60)
			rmSetAreaLocation(unknownBay, 1.0, 1.0);
		else if(bayPosition < 0.72)
			rmSetAreaLocation(unknownBay, 1.0, 0.5);
		else if(bayPosition < 0.84)
			rmSetAreaLocation(unknownBay, 1.0, 0.0);
		else
			rmSetAreaLocation(unknownBay, 0.5, 0.0);

  		rmSetAreaObeyWorldCircleConstraint(unknownBay, false);
		rmAddAreaConstraint(unknownBay, avoidPlayers);
	   rmSetAreaSmoothDistance(unknownBay, 50);
	   rmSetAreaCoherence(unknownBay, 0.15);
	}

	// Build bay later to avoid players

// ============= Midgard Style Ocean  =============
	else if(landConfig < 0.83)
	{
		rmEchoInfo("ocean ring");
		allLand = -1;
		oceanRing = 1;

		int worldOcean=rmCreateArea("ocean that covers whole map");
		rmSetAreaWaterType(worldOcean, oceanName);
		rmSetAreaSize(worldOcean, 1, 1);
		rmSetAreaLocation(worldOcean, 0.5, 0.5);
		rmSetAreaWarnFailure(worldOcean, false);
      rmSetAreaObeyWorldCircleConstraint(worldOcean, false);
		rmBuildArea(worldOcean);

		int continent=rmCreateArea("island continent in ocean");
		rmSetAreaMix(continent, landName);
      rmSetAreaElevationType(continent, cElevTurbulence);
      rmSetAreaElevationVariation(continent, 4.0);
      rmSetAreaBaseHeight(continent, 3.5);
      rmSetAreaElevationMinFrequency(continent, 0.09);
      rmSetAreaElevationOctaves(continent, 3);
      rmSetAreaElevationPersistence(continent, 0.2);
		rmSetAreaElevationNoiseBias(continent, 1);
		rmSetAreaSize(continent, 0.32, 0.32);
		rmSetAreaLocation(continent, 0.5, 0.5);
	   rmSetAreaSmoothDistance(continent, 50);
	   rmSetAreaCoherence(continent, 0.25);
		rmAddAreaConstraint(continent, edgeConstraint);
		rmBuildArea(continent);
	}

// ============= Sonora Style Plateau / Canyon =============
	else if(landConfig < 0.90)
	{
		rmEchoInfo("plateau in middle");
		allLand = -1;
		plateauMiddle = 1;
		blockedMiddle = 1;
		int centerMesa=rmCreateArea("large mesa or canyon in middle");
		rmSetAreaSize(centerMesa, 0.05, 0.12);  
		rmSetAreaCliffType(centerMesa, cliffName);

		if(rmRandFloat(0,1) < 0.8)
		{		
			rmSetAreaCliffEdge(centerMesa, 1, 1.0, 0.1, 1.0, 0);
			rmAddAreaToClass(centerMesa, classCanyon);
			rmEchoInfo("no ramps");	
		}
		else
		{
			rmSetAreaCliffEdge(centerMesa, 4, 0.2, 0.0, 1.0, 0); 
			rmEchoInfo("ramps");
		}
		if(rmRandFloat(0,1) < 0.6)
			rmSetAreaCliffHeight(centerMesa, rmRandInt(6,8), 1.0, 1.0);
		else
			rmSetAreaCliffHeight(centerMesa, rmRandInt(-8,-6), 1.0, 1.0);
		rmSetAreaMinBlobs(centerMesa, 3);
		rmSetAreaMaxBlobs(centerMesa, 5);
		rmSetAreaMinBlobDistance(centerMesa, 3.0);
		rmSetAreaMaxBlobDistance(centerMesa, 5.0);
		rmSetAreaCoherence(centerMesa, 0.3);
		rmSetAreaLocation(centerMesa, 0.5, 0.5);
	   rmSetAreaSmoothDistance(centerMesa, 20);
		rmAddAreaConstraint(centerMesa, avoidPlayers); 
	}

// Build canyon later to avoid players

// ============= Oasis Style Forest =============
	else
	{
		rmEchoInfo("forest in middle");
		allLand = -1;
		forestMiddle = 1;
		int greatUnknownForest=rmCreateArea("large central forest");
      rmSetAreaWarnFailure(greatUnknownForest, false);
      rmSetAreaSize(greatUnknownForest, 0.08, 0.08);
      rmSetAreaForestType(greatUnknownForest, forestName);
      rmSetAreaForestDensity(greatUnknownForest, 0.8);
      rmSetAreaForestClumpiness(greatUnknownForest, 0.6);
      rmSetAreaForestUnderbrush(greatUnknownForest, 0.0);
      rmSetAreaMinBlobs(greatUnknownForest, 1);
      rmSetAreaMaxBlobs(greatUnknownForest, 5);
      rmSetAreaMinBlobDistance(greatUnknownForest, 16.0);
      rmSetAreaMaxBlobDistance(greatUnknownForest, 70.0);
      rmSetAreaCoherence(greatUnknownForest, 0.15);
      rmSetAreaSmoothDistance(greatUnknownForest, 0);
      rmAddAreaToClass(greatUnknownForest, rmClassID("classForest"));
		rmSetAreaLocation(greatUnknownForest, 0.5, 0.5);
      rmAddAreaConstraint(greatUnknownForest, avoidPlayers); 
	}
	
// Build forest later to avoid players


	// Text
   rmSetStatusText("", 0.2);


// ============= Player Configurations =============

// Sometimes teams closer together

	if (riverExists == 1)
	{
		rmSetTeamSpacingModifier(1.0);
		rmEchoInfo("Teams spaced normal because of river");
	}
	else if (rmRandFloat(0,1) < 0.33)
	{
		rmSetTeamSpacingModifier(0.50);
		rmEchoInfo("Teams close together");
	}
	else if (rmRandFloat(0,1) < 0.33)
	{
		rmSetTeamSpacingModifier(0.33);
		rmEchoInfo("Teams very close together");
	}
	else
		rmEchoInfo("Teams spaced normal");


	if (oceanMiddle == 1)
	{
		rmPlacePlayersCircular(0.38, 0.40, 0);
		rmEchoInfo("players nearer edge because ocean in middle");
	}
	else if(oceanRing == 1)
	{
		rmPlacePlayersCircular(0.25, 0.25, 0);
		rmEchoInfo("players very far from edge because of continent");
	}
	else if(oceanOffCenter == 1)
	{
		rmPlacePlayersCircular(0.25, 0.25, 0);
		rmEchoInfo("players very far from edge because of off center bay");
	}
	else
	{
		rmPlacePlayersCircular(0.27, 0.40, 0);
		rmEchoInfo("players can be farther from edge");
	}
	

//	float playerFraction = rmAreaTilesToFraction(1000);
	float playerFraction = rmAreaTilesToFraction(1200); 
//	This fixes no TC on 2P maps

	for(i=1; <cNumberPlayers)
   {
      // Create the area.
      int id=rmCreateArea("Player"+i);
      // Assign to the player.
      rmSetPlayerArea(i, id);
      // Set the size.
      rmSetAreaSize(id, playerFraction, playerFraction);
      rmAddAreaToClass(id, classPlayer);
      rmSetAreaMinBlobs(id, 1);
      rmSetAreaMaxBlobs(id, 1);
      rmAddAreaConstraint(id, avoidPlayers);
		// for testing areas
 //     rmSetAreaTerrainType(id, "rockies\groundsnow1_roc");
	   rmSetAreaCoherence(id, 0.35);
	   rmSetAreaSmoothDistance(id, 20);
		rmAddAreaConstraint(id, playerAvoidImpassableLand);
		rmSetAreaLocPlayer(id, i);
		rmSetAreaWarnFailure(id, false);
   }
	rmBuildAllAreas();

	// Text
   rmSetStatusText("", 0.3);


// ============= Trade Route =============


	int tradeRouteID = rmCreateTradeRoute();

   int socketID=rmCreateObjectDef("sockets for Trade Route");

	float XStart = -1;
	float ZStart = -1;
	float XStop = -1;
	float ZStop = -1;
	float routePosition = rmRandFloat(0,1);

   rmAddObjectDefItem(socketID, "SocketTradeRoute", 1, 0.0);
	rmAddObjectDefConstraint(socketID, shortAvoidImpassableLand);
   rmSetObjectDefAllowOverlap(socketID, true);
   rmSetObjectDefMinDistance(socketID, 0.0);
   rmSetObjectDefMaxDistance(socketID, 8.0);
	rmAddClosestPointConstraint(shortAvoidImpassableLand);
   vector tradeRoutePoint = cOriginVector;

	// Trade route circular if center mesa or ocean, else linear
	if(blockedMiddle == 1)
	{
		tradeRoutePoint = rmFindClosestPoint(0.08, 0.55, 30);
		rmAddTradeRouteWaypoint(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)));
		tradeRoutePoint = rmFindClosestPoint(0.20, 0.83, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.45, 0.93, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.67, 0.89, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.78, 0.78, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.84, 0.70, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.86, 0.68, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.88, 0.40, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.81, 0.23, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.70, 0.10, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.50, 0.08, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.30, 0.15, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.15, 0.23, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
		tradeRoutePoint = rmFindClosestPoint(0.08, 0.55, 30);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);

	}
	else // nothing big in middle so go linear
	{
		// If continet, scoot linear trade route in a bit
		if(oceanRing == 1)
		{
			// Spin trade route points around edge
			if(routePosition < 0.12)
			{
				XStart = 0.25;
				ZStart = 0.5;
				XStop = 0.75;
				ZStop = 0.5;
			}
			else if(routePosition < 0.24)
			{
				XStart = 0.25;
				ZStart = 0.25;
				XStop = 0.75;
				ZStop = 0.75;
			}
			else if(routePosition < 0.36)
			{
				XStart = 0.5;
				ZStart = 0.25;
				XStop = 0.5;
				ZStop = 0.75;
			}
			else if(routePosition < 0.48)
			{
				XStart = 0.25;
				ZStart = 0.75;
				XStop = 0.75;
				ZStop = 0.25;
			}
			else if(routePosition < 0.60)
			{
				XStart = 0.25;
				ZStart = 0.25;
				XStop = 0.75;
				ZStop = 0.75;
			}
			else if(routePosition < 0.72)
			{	
				XStart = 0.25;
				ZStart = 0.75;
				XStop = 0.75;
				ZStop = 0.25;
			}
			else if(routePosition < 0.84)
			{
				XStart = 0.25;
				ZStart = 0.25;
				XStop = 0.75;
				ZStop = 0.75;
			}
			else
			{
				XStart = 0.75;
				ZStart = 0.25;
				XStop = 0.25;
				ZStop = 0.75;
			}
		}
		else
		// Otherwise extend trade route to edge
		{
			// Spin trade route points around edge
			if(routePosition < 0.12)
			{
				XStart = 0.0;
				ZStart = 0.5;
				XStop = 1.0;
				ZStop = 0.5;
			}
			else if(routePosition < 0.24)
			{
				XStart = 0.0;
				ZStart = 0.0;
				XStop = 1.0;
				ZStop = 1.0;
			}
			else if(routePosition < 0.36)
			{
				XStart = 0.5;
				ZStart = 0.0;
				XStop = 0.5;
				ZStop = 1.0;
			}
			else if(routePosition < 0.48)
			{
				XStart = 0.0;
				ZStart = 1.0;
				XStop = 1.0;
				ZStop = 0.0;
			}
			else if(routePosition < 0.60)
			{
				XStart = 0.0;
				ZStart = 0.25;
				XStop = 1.0;
				ZStop = 0.75;
			}
			else if(routePosition < 0.72)
			{	
				XStart = 0.0;
				ZStart = 0.75;
				XStop = 1.0;
				ZStop = 0.25;
			}
			else if(routePosition < 0.84)
			{
				XStart = 0.25;
				ZStart = 0.0;
				XStop = 0.75;
				ZStop = 1.0;
			}
			else
			{
				XStart = 0.75;
				ZStart = 0.0;
				XStop = 0.25;
				ZStop = 1.0;
			}
		}

		// Assign trade route waypoints
		tradeRoutePoint = rmFindClosestPoint(XStart, ZStart, 100.0);
		rmAddTradeRouteWaypoint(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)));
		rmAddRandomTradeRouteWaypoints(tradeRouteID, 0.5, 0.5, 6, 6);
		tradeRoutePoint = rmFindClosestPoint(XStop, ZStop, 100.0);
		rmAddRandomTradeRouteWaypoints(tradeRouteID, rmXMetersToFraction(xsVectorGetX(tradeRoutePoint)), rmZMetersToFraction(xsVectorGetZ(tradeRoutePoint)), 4, 6);
	}	

   bool placedTradeRoute = rmBuildTradeRoute(tradeRouteID, "dirt");
   if(placedTradeRoute == false)
      rmEchoError("Failed to place trade route");  

   // add the sockets along the trade route.
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID);
   vector socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.20);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	// If continent, then 2 slots. Otherwise 3 or 4.
	if(oceanRing < 1)
	{
		if(rmRandFloat(0,1) < 0.4)
		{
			socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.50);
			rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
		}
		else
		{
			socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.40);
			rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	
			socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.60);
			rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
		}
	}

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.80);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	rmClearClosestPointConstraints();


	// Text
   rmSetStatusText("", 0.4);

// ============= Starting Units =============
/*
	int startingTCID= rmCreateObjectDef("startingTC");
	if (rmGetNomadStart())
		rmAddObjectDefItem(startingTCID, "CoveredWagon", 1);
	else
		rmAddObjectDefItem(startingTCID, "townCenter", 1);
	rmSetObjectDefMinDistance(startingTCID, 0.0);
	rmSetObjectDefMaxDistance(startingTCID, 20.0);
	rmAddObjectDefConstraint(startingTCID, TCAvoidImpassableLand);
	rmAddObjectDefConstraint(startingTCID, TCAvoidTradeRoute);
	rmAddObjectDefConstraint(startingTCID, TCAvoidTradeRouteSocket);
	rmAddObjectDefToClass(startingTCID, rmClassID("player"));
*/
	int startingUnits = rmCreateStartingUnitsObjectDef(5.0);
	rmSetObjectDefMinDistance(startingUnits, 8.0);
	rmSetObjectDefMaxDistance(startingUnits, 14.0);
	rmAddObjectDefConstraint(startingUnits, shortAvoidImpassableLand);
	//rmAddObjectDefToClass(startingUnits, rmClassID("startingUnit"));
       
// Place Starting Units now so other stuff can avoid them
	for(i=1; <cNumberPlayers)
	{
		//rmPlaceObjectDefAtLoc(startingTCID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
		rmPlaceObjectDefAtLoc(startingUnits, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	}

	// Text
   rmSetStatusText("", 0.5);



// ============= Choose Natives =============

	int AztecVillageID = -1;
	int CaribsVillageID = -1;
	int CherokeeVillageID = -1;
	int ComancheVillageID = -1;
	int CreeVillageID = -1;
	int IncasVillageID = -1;
	int IroquoisVillageID = -1;
	int LakotaVillageID = -1;
	int MayaVillageID = -1;
	int NootkaVillageID = -1;
	int SeminolesVillageID = -1;
	int TupiVillageID = -1;

	float nativeChance = -1;

// Usually 3 to 4, but rarely more or less

	int nativeNumber = rmRandInt(3,4);
	

	if(rmRandFloat(0,1) < 0.25)
		nativeNumber = rmRandInt(5,6);
	else if(rmRandFloat(0,1) < 0.15)
		nativeNumber = rmRandInt(1,2);
	rmEchoInfo("Native number = "+nativeNumber);

	rmAllocateSubCivs(nativeNumber);


// For each native, randomly determine tribe

	for(i = 0; <nativeNumber)
	{
		nativeChance = rmRandFloat(0,1);
		if(nativeChance < 0.08)
		{
			rmSetSubCiv(i, "Aztecs");
			rmEchoInfo("subCiv"+i+" is Aztecs");
			AztecVillageID = rmCreateGrouping("aztec village "+i, "native aztec village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(AztecVillageID, 0);
			rmSetGroupingMaxDistance(AztecVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(AztecVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(AztecVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(AztecVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(AztecVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(AztecVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(AztecVillageID, avoidNatives);
			rmAddGroupingConstraint(AztecVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(AztecVillageID, 0, 0.5, 0.5);
		}
		else if(nativeChance < 0.16)
		{
			rmSetSubCiv(i, "Caribs");
			rmEchoInfo("subCiv"+i+" is Caribs");
			CaribsVillageID = rmCreateGrouping("carib village "+i, "native carib village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(CaribsVillageID, 0);
			rmSetGroupingMaxDistance(CaribsVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(CaribsVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(CaribsVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(CaribsVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(CaribsVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(CaribsVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(CaribsVillageID, avoidNatives);
			rmAddGroupingConstraint(CaribsVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(CaribsVillageID, 0, 0.5, 0.5);
		}	
		else if(nativeChance < 0.24)
		{
			rmSetSubCiv(i, "Cherokee");
			rmEchoInfo("subCiv"+i+" is Cherokee");
			CherokeeVillageID = rmCreateGrouping("cherokee village "+i, "native cherokee village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(CherokeeVillageID, 0);
			rmSetGroupingMaxDistance(CherokeeVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(CherokeeVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(CherokeeVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(CherokeeVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(CherokeeVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(CherokeeVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(CherokeeVillageID, avoidNatives);
			rmAddGroupingConstraint(CherokeeVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(CherokeeVillageID, 0, 0.5, 0.5);
		}
		else if(nativeChance < 0.32)
		{	
			rmSetSubCiv(i, "Comanche");
			rmEchoInfo("subCiv"+i+" is Comanche");
			ComancheVillageID = rmCreateGrouping("comanche village "+i, "native comanche village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(ComancheVillageID, 0);
			rmSetGroupingMaxDistance(ComancheVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(ComancheVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(ComancheVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(ComancheVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(ComancheVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(ComancheVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(ComancheVillageID, avoidNatives);
			rmAddGroupingConstraint(ComancheVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(ComancheVillageID, 0, 0.5, 0.5);
		}
		else if(nativeChance < 0.40)
		{
			rmSetSubCiv(i, "Cree");
			rmEchoInfo("subCiv"+i+" is Cree");
			CreeVillageID = rmCreateGrouping("cree village "+i, "native cree village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(CreeVillageID, 0);
			rmSetGroupingMaxDistance(CreeVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(CreeVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(CreeVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(CreeVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(CreeVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(CreeVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(CreeVillageID, avoidNatives);
			rmAddGroupingConstraint(CreeVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(CreeVillageID, 0, 0.5, 0.5);
		}	
		else if(nativeChance < 0.48)
		{
			rmSetSubCiv(i, "Incas");
			rmEchoInfo("subCiv"+i+" is Incas");
			IncasVillageID = rmCreateGrouping("inca village "+i, "native inca village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(IncasVillageID, 0);
			rmSetGroupingMaxDistance(IncasVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(IncasVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(IncasVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(IncasVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(IncasVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(IncasVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(IncasVillageID, avoidNatives);
			rmAddGroupingConstraint(IncasVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(IncasVillageID, 0, 0.5, 0.5);
		}	
		else if(nativeChance < 0.56)
		{
			rmSetSubCiv(i, "Iroquois");
			rmEchoInfo("subCiv"+i+" is Iroquois");
			IroquoisVillageID = rmCreateGrouping("iroquois village "+i, "native iroquois village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(IroquoisVillageID, 0);
			rmSetGroupingMaxDistance(IroquoisVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(IroquoisVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(IroquoisVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(IroquoisVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(IroquoisVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(IroquoisVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(IroquoisVillageID, avoidNatives);
			rmAddGroupingConstraint(IroquoisVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(IroquoisVillageID, 0, 0.5, 0.5);
		}	
		else if(nativeChance < 0.64)
		{
			rmSetSubCiv(i, "Lakota");
			rmEchoInfo("subCiv"+i+" is Lakota");
			LakotaVillageID = rmCreateGrouping("lakota village "+i, "native lakota village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(LakotaVillageID, 0);
			rmSetGroupingMaxDistance(LakotaVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(LakotaVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(LakotaVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(LakotaVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(LakotaVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(LakotaVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(LakotaVillageID, avoidNatives);
			rmAddGroupingConstraint(LakotaVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(LakotaVillageID, 0, 0.5, 0.5);
		}		
		else if(nativeChance < 0.72)
		{
			rmSetSubCiv(i, "Maya");
			rmEchoInfo("subCiv"+i+" is Maya");
			MayaVillageID = rmCreateGrouping("maya village "+i, "native maya village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(MayaVillageID, 0);
			rmSetGroupingMaxDistance(MayaVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(MayaVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(MayaVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(MayaVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(MayaVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(MayaVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(MayaVillageID, avoidNatives);
			rmAddGroupingConstraint(MayaVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(MayaVillageID, 0, 0.5, 0.5);
		}	
		else if(nativeChance < 0.80)
		{
			rmSetSubCiv(i, "Nootka");
			rmEchoInfo("subCiv"+i+" is Nootka");
			NootkaVillageID = rmCreateGrouping("nootka village number "+i, "native nootka village 1" /*+rmRandInt(1,5)*/);
			rmSetGroupingMinDistance(NootkaVillageID, 0);
			rmSetGroupingMaxDistance(NootkaVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(NootkaVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(NootkaVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(NootkaVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(NootkaVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(NootkaVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(NootkaVillageID, avoidNatives);
			rmAddGroupingConstraint(NootkaVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(NootkaVillageID, 0, 0.5, 0.5);
		}	
		else if(nativeChance < 0.88)
		{
			rmSetSubCiv(i, "Seminoles");
			rmEchoInfo("subCiv"+i+" is Seminoles");
			SeminolesVillageID = rmCreateGrouping("seminoles village "+i, "native seminole village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(SeminolesVillageID, 0);
			rmSetGroupingMaxDistance(SeminolesVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(SeminolesVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(SeminolesVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(SeminolesVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(SeminolesVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(SeminolesVillageID, nativesAvoidPlayers);
			rmAddGroupingConstraint(SeminolesVillageID, avoidNatives);
			rmAddGroupingConstraint(SeminolesVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(SeminolesVillageID, 0, 0.5, 0.5);
		}		
		else
		{
			rmSetSubCiv(i, "Tupi");
			rmEchoInfo("subCiv"+i+" is Tupi");
			TupiVillageID = rmCreateGrouping("tupi village "+i, "native tupi village "+rmRandInt(1,5));
			rmSetGroupingMinDistance(TupiVillageID, 0);
			rmSetGroupingMaxDistance(TupiVillageID, rmXFractionToMeters(0.45));
			rmAddGroupingToClass(TupiVillageID, rmClassID("natives"));
			rmAddGroupingConstraint(TupiVillageID, avoidImpassableLand);
			rmAddGroupingConstraint(TupiVillageID, avoidTradeRoute);
			rmAddGroupingConstraint(TupiVillageID, avoidTradeRouteSocket);
			rmAddGroupingConstraint(TupiVillageID, avoidPlayers);
			rmAddGroupingConstraint(TupiVillageID, avoidNatives);
			rmAddGroupingConstraint(TupiVillageID, avoidCanyon);
			rmPlaceGroupingAtLoc(TupiVillageID, 0, 0.5, 0.5);
		}	
	}


	// Text
   rmSetStatusText("", 0.6);


// ============= Add Cliffs =============

   int numTries=0;
   int failCount=0;

	if(oceanRing == 1) // no cliffs for continent
	{
		numTries = 0;
	}
	else if(allLand == 1) // might have lots of cliffs if land
	{
		if(rmRandFloat(0,1) > 0.4)
			numTries = 8*cNumberNonGaiaPlayers;
	}
	else if(plateauMiddle == 1) // might have lots of cliffs if center mesa
	{
		if(rmRandFloat(0,1) > 0.7)
			numTries = 8*cNumberNonGaiaPlayers;
	}
	else
	{
		numTries = 4*cNumberNonGaiaPlayers;
	}
	
		if(rmRandFloat(0,1) < 0.40) // only do cliffs 40% of the time in any case
		{		
			for(i=0; <numTries)
			{
				int smallCliffHeight=rmRandInt(0,10);
				int smallMesaID=rmCreateArea("small cliff "+i);
				rmSetAreaSize(smallMesaID, rmAreaTilesToFraction(100), rmAreaTilesToFraction(400));
				rmSetAreaWarnFailure(smallMesaID, false);
				rmSetAreaCliffType(smallMesaID, cliffName);
				rmAddAreaToClass(smallMesaID, classCanyon);
				rmSetAreaCliffEdge(smallMesaID, 1, 1.0, 0.1, 1.0, 0);
				rmSetAreaCliffHeight(smallMesaID, rmRandInt(6,8), 1.0, 1.0);
				rmSetAreaMinBlobs(smallMesaID, 3);
				rmSetAreaMaxBlobs(smallMesaID, 5);
				rmSetAreaMinBlobDistance(smallMesaID, 3.0);
				rmSetAreaMaxBlobDistance(smallMesaID, 5.0);
				rmSetAreaCoherence(smallMesaID, 0.3);
				rmSetAreaSmoothDistance(smallMesaID, 10);
				rmAddAreaConstraint(smallMesaID, avoidCanyon);
				rmAddAreaConstraint(smallMesaID, avoidImpassableLand);
				rmAddAreaConstraint(smallMesaID, avoidPlayers); 
				rmAddAreaConstraint(smallMesaID, avoidNatives); 
				rmAddAreaConstraint(smallMesaID, avoidTradeRouteSocket);
				rmAddAreaConstraint(smallMesaID, avoidTradeRoute);
				if(rmBuildArea(smallMesaID)==false)
				{
					// Stop trying once we fail 3 times in a row.
					failCount++;
					if(failCount==20)
						break;
				}
				else
					failCount=0;
			}
		}
	

// ============= Add Ponds =============


	if(rmRandFloat(0,1) < 0.45)
	{
		rmEchoInfo("ponds exist");
		int numPonds=rmRandInt(2, 5);
		for(i=0; <numPonds)
		{
			int smallPondID=rmCreateArea("small pond "+i);
			rmSetAreaSize(smallPondID, rmAreaTilesToFraction(170), rmAreaTilesToFraction(400));
			rmSetAreaWaterType(smallPondID, pondName);
			rmSetAreaMinBlobs(smallPondID, 1);
			rmSetAreaMaxBlobs(smallPondID, 5);
			rmSetAreaBaseHeight(smallPondID, 4);
			rmSetAreaMinBlobDistance(smallPondID, 5.0);
			rmSetAreaMaxBlobDistance(smallPondID, 70.0);
			rmAddAreaToClass(smallPondID, pondClass);
			rmSetAreaCoherence(smallPondID, 0.5);
			rmSetAreaSmoothDistance(smallPondID, 5);
			rmAddAreaConstraint(smallPondID, pondConstraint);
			rmAddAreaConstraint(smallPondID, avoidPlayers);
			rmAddAreaConstraint(smallPondID, avoidNatives);
			rmAddAreaConstraint(smallPondID, mediumAvoidImpassableLand);
			rmAddAreaConstraint(smallPondID, avoidCanyon);
			rmAddAreaConstraint(smallPondID, edgeConstraint);
			rmAddAreaConstraint(smallPondID, avoidTradeRoute);
			rmSetAreaWarnFailure(smallPondID, false);
			rmBuildArea(smallPondID);
		}
	}

	// Text
   rmSetStatusText("", 0.7);

// ============= Add Forests =============

	numTries=6*cNumberNonGaiaPlayers;
	failCount = 0;
	int sparseForests = -1;

	if(rmRandFloat(0,1) > 0.9)
	{
		numTries = 3*cNumberNonGaiaPlayers;
		rmEchoInfo("sparse forests");
		sparseForests = 1;
	}

   for (i=0; <numTries)
	{   
      int forest=rmCreateArea("forest "+i);
      rmSetAreaWarnFailure(forest, false);
      rmSetAreaSize(forest, rmAreaTilesToFraction(200), rmAreaTilesToFraction(400));
      rmSetAreaForestType(forest, forestName);
      rmSetAreaForestDensity(forest, 0.8);
      rmSetAreaForestClumpiness(forest, 0.6);
      rmSetAreaForestUnderbrush(forest, 0.0);
      rmSetAreaMinBlobs(forest, 1);
      rmSetAreaMaxBlobs(forest, 5);
      rmSetAreaMinBlobDistance(forest, 16.0);
      rmSetAreaMaxBlobDistance(forest, 70.0);
      rmSetAreaCoherence(forest, 0.4);
      rmSetAreaSmoothDistance(forest, 0);
      rmAddAreaToClass(forest, rmClassID("classForest")); 
      rmAddAreaConstraint(forest, forestConstraint);
      rmAddAreaConstraint(forest, avoidTC);
      rmAddAreaConstraint(forest, avoidCW);
      rmAddAreaConstraint(forest, avoidAll);
      rmAddAreaConstraint(forest, avoidCanyon);
      rmAddAreaConstraint(forest, mediumAvoidImpassableLand); 
      rmAddAreaConstraint(forest, avoidTradeRoute);

      if(rmBuildArea(forest)==false)
      {
         // Stop trying once we fail 3 times in a row.
         failCount++;
         if(failCount==5)
            break;
      }
      else
         failCount=0; 
	}
	
	// Text
   rmSetStatusText("", 0.8);

// ============= Starting Resources =============

// Silver

	int playerSilverID = rmCreateObjectDef("player silver");
	rmAddObjectDefItem(playerSilverID, "mine", 1, 0);
	rmAddObjectDefConstraint(playerSilverID, avoidTradeRoute);
	rmSetObjectDefMinDistance(playerSilverID, 18.0);
	rmSetObjectDefMaxDistance(playerSilverID, 22.0);
	rmAddObjectDefConstraint(playerSilverID, avoidAll);
   rmAddObjectDefConstraint(playerSilverID, shortAvoidImpassableLand);

	int playerBerryID=rmCreateObjectDef("player berries");
   rmAddObjectDefItem(playerBerryID, "berryBush", rmRandInt(2,3), 2.0);
   rmSetObjectDefMinDistance(playerBerryID, 10);
   rmSetObjectDefMaxDistance(playerBerryID, 15);
	rmAddObjectDefConstraint(playerBerryID, avoidAll);
   rmAddObjectDefConstraint(playerBerryID, shortAvoidImpassableLand);

	int playerTreeID=rmCreateObjectDef("player trees");
   rmAddObjectDefItem(playerTreeID, treeName, 1, 0.0);
	rmAddObjectDefConstraint(playerTreeID, avoidTradeRoute);
   rmSetObjectDefMinDistance(playerTreeID, 6);
   rmSetObjectDefMaxDistance(playerTreeID, 14);
	rmAddObjectDefConstraint(playerTreeID, avoidAll);
   rmAddObjectDefConstraint(playerTreeID, shortAvoidImpassableLand);

   int nearDeerID=rmCreateObjectDef("herds near town");
   rmAddObjectDefItem(nearDeerID, critterOneName, rmRandInt(8,10), 10.0);
   rmSetObjectDefMinDistance(nearDeerID, 30);
   rmSetObjectDefMaxDistance(nearDeerID, 40);
   rmAddObjectDefConstraint(nearDeerID, avoidFood);
	rmAddObjectDefConstraint(nearDeerID, avoidAll);
   rmAddObjectDefConstraint(nearDeerID, avoidImpassableLand);
   rmSetObjectDefCreateHerd(nearDeerID, true);

	int farDeerID=rmCreateObjectDef("herds far away");
	int bonusChance=rmRandFloat(0, 1);
   if(bonusChance<0.5)   
      rmAddObjectDefItem(farDeerID, critterTwoName, rmRandInt(6,8), 10.0);
   else
      rmAddObjectDefItem(farDeerID, critterTwoName, rmRandInt(9,12), 10.0);
   rmSetObjectDefMinDistance(farDeerID, 100);
   rmSetObjectDefMaxDistance(farDeerID, rmXFractionToMeters(0.25));
   rmAddObjectDefConstraint(farDeerID, avoidFood);
	rmAddObjectDefConstraint(farDeerID, avoidAll);
	if(oceanRing == 1)
		rmAddObjectDefConstraint(farDeerID, avoidPlayers);
	else
		rmAddObjectDefConstraint(farDeerID, avoidPlayersFar);
   rmAddObjectDefConstraint(farDeerID, avoidImpassableLand);
   rmAddObjectDefConstraint(farDeerID, avoidCanyon);
   rmSetObjectDefCreateHerd(farDeerID, true);

	// Define a parm for placing water flags on water maps
	int waterFlagID = -1;
	int placeWaterFlag = -1;

	if (oceanMiddle == 1)
		placeWaterFlag = 1;
	else if (oceanOffCenter == 1)
		placeWaterFlag = 1;
	else if (oceanRing == 1)
		placeWaterFlag = 1;

	// Now place all these definitions

	float bonusSilverChance = rmRandFloat(0,1);
	float bonusTreeChance = rmRandFloat(0,1);
	float bonusNuggetChance1 = rmRandFloat(0,1);
	float bonusNuggetChance2 = rmRandFloat(0,1);
	float berryChance = rmRandFloat(0,1);
	float bonusFoodChance = rmRandFloat(0,1);

	for(i=1; <cNumberPlayers)
	{
		rmClearClosestPointConstraints();

		vector TCLocation = rmGetUnitPosition(rmGetUnitPlacedOfPlayer(startingUnits, i));
/*
		// SILVER
		// Always one silver, but possible for 2 or 3
		rmPlaceObjectDefAtLoc(playerSilverID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusSilverChance > 0.4)
			rmPlaceObjectDefAtLoc(playerSilverID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusSilverChance > 0.8)
			rmPlaceObjectDefAtLoc(playerSilverID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
*/		
		// TREES
		// Have 4-6 trees, unless sparse
		rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
 		rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusTreeChance > 0.5)
			rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusTreeChance > 0.8)
			rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		// If sparse forests, add extra trees
		if (sparseForests == 1)
		{
			rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
 			rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
			rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
			rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
			rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
			rmPlaceObjectDefAtLoc(playerTreeID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		}
/*
		// NUGGETS
		// Always 1 of type I. Can have +1 or +2 of type I and +1 or +2 of type II
		rmPlaceObjectDefAtLoc(nugget1, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusNuggetChance1 > 0.5)
			rmPlaceObjectDefAtLoc(nugget1, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusNuggetChance1 > 0.9)
			rmPlaceObjectDefAtLoc(nugget1, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusNuggetChance2 > 0.8)
			rmPlaceObjectDefAtLoc(nugget2, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusNuggetChance2 > 0.95)
			rmPlaceObjectDefAtLoc(nugget2, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
*/
		// FOOD
		// Always 1 near and 1 far. Sometimes +1 or +2 far.
		rmPlaceObjectDefAtLoc(nearDeerID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		rmPlaceObjectDefAtLoc(farDeerID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusFoodChance > 0.70)
			rmPlaceObjectDefAtLoc(farDeerID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
		if (bonusFoodChance > 0.90)
			rmPlaceObjectDefAtLoc(farDeerID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));

		// BERRIES
		// 30% of the time
		if (berryChance > 0.7)
			rmPlaceObjectDefAtLoc(playerBerryID, 0, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));

		// WATER FLAG
		// If it can't place it within 0.2, it tries again at 0.7
		if (placeWaterFlag == 1)
		{
			waterFlagID=rmCreateObjectDef("HC water flag "+i);
			rmAddObjectDefItem(waterFlagID, "HomeCityWaterSpawnFlag", 1, 0.0);
		   rmAddObjectDefConstraint(waterFlagID, edgeConstraint);
			rmAddObjectDefConstraint(waterFlagID, flagVsFlag);
			rmAddObjectDefConstraint(waterFlagID, fishLand);
			rmAddObjectDefConstraint(waterFlagID, pondConstraint);

			rmSetObjectDefMinDistance(waterFlagID, 0.0);
			rmSetObjectDefMaxDistance(waterFlagID, rmXFractionToMeters(0.2));
			rmPlaceObjectDefAtLoc(waterFlagID, i, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
			if(rmGetNumberUnitsPlaced(waterFlagID) < 1)
			{
				rmEchoInfo("------- FAILED TO PLACE WATER FLAG "+i+". RELAXING CONSTRAINTS");
				rmSetObjectDefMaxDistance(waterFlagID, rmXFractionToMeters(0.7));
				rmPlaceObjectDefAtLoc(waterFlagID, i, rmXMetersToFraction(xsVectorGetX(TCLocation)), rmZMetersToFraction(xsVectorGetZ(TCLocation)));
			}	
		}
	}


	// Text
   rmSetStatusText("", 0.9);


// ============= Other Resources =============
/*
// Silver

	int silverID = -1;
	int silverCount = (cNumberNonGaiaPlayers*2 + rmRandInt(3,6));
	rmEchoInfo("silver count = "+silverCount);

	for(i=0; < silverCount)
	{
      silverID = rmCreateObjectDef("silver "+i);
	   rmAddObjectDefItem(silverID, "mine", 1, 0.0);
      rmSetObjectDefMinDistance(silverID, 0.0);
      rmSetObjectDefMaxDistance(silverID, rmXFractionToMeters(0.5));
		rmAddObjectDefConstraint(silverID, avoidSilver);
      rmAddObjectDefConstraint(silverID, avoidAll);
		if(oceanRing == 1)
			rmAddObjectDefConstraint(silverID, avoidPlayers);
		else
			rmAddObjectDefConstraint(silverID, avoidPlayersFar);
      rmAddObjectDefConstraint(silverID, avoidImpassableLand);
      rmAddObjectDefConstraint(silverID, avoidTradeRoute);
		rmPlaceObjectDefAtLoc(silverID, 0, 0.5, 0.5);
   }
*/

// Sheep

	int sheepID = rmCreateObjectDef("sheep");
	rmAddObjectDefItem(sheepID, "sheep", 2, 4.0);
	rmSetObjectDefMinDistance(sheepID, 0.0);
	rmSetObjectDefMaxDistance(sheepID, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(sheepID, avoidSheep);
	rmAddObjectDefConstraint(sheepID, avoidAll);
	rmAddObjectDefConstraint(sheepID, avoidTradeRoute);
	rmAddObjectDefConstraint(sheepID, avoidImpassableLand);
	rmPlaceObjectDefAtLoc(sheepID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*2);

// Treasures        

	int nugget1ID= rmCreateObjectDef("nugget"); 
	rmAddObjectDefItem(nugget1ID, "Nugget", 1, 0.0);
	rmSetObjectDefMinDistance(nugget1ID, 0.0);
	rmSetObjectDefMaxDistance(nugget1ID, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(nugget1ID, avoidImpassableLand);
	rmAddObjectDefConstraint(nugget1ID, avoidNugget);
	rmAddObjectDefConstraint(nugget1ID, avoidAll);
	rmPlaceObjectDefAtLoc(nugget1ID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*rmRandInt(11,15));
	
	int nugget2ID= rmCreateObjectDef("nugget hard"); 
	rmAddObjectDefItem(nugget2ID, "Nugget", 1, 0.0);
	rmSetObjectDefMinDistance(nugget2ID, 0.0);
	rmSetObjectDefMaxDistance(nugget2ID, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(nugget2ID, avoidImpassableLand);
	rmAddObjectDefConstraint(nugget2ID, avoidNugget);
	rmAddObjectDefConstraint(nugget2ID, avoidAll);
	rmPlaceObjectDefAtLoc(nugget2ID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*rmRandInt(4,5));
	


// add fish if ocean
	if (placeWaterFlag == 1)
	{
		int fishID=rmCreateObjectDef("fish");
		rmAddObjectDefItem(fishID, fishName, 1, 0.0);
		rmSetObjectDefMinDistance(fishID, 0.0);
		rmSetObjectDefMaxDistance(fishID, rmXFractionToMeters(0.5));
		rmAddObjectDefConstraint(fishID, fishVsFishID);
		rmAddObjectDefConstraint(fishID, fishLand);
		rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, 12*cNumberNonGaiaPlayers);                 

		int whaleID=rmCreateObjectDef("whale");
		rmAddObjectDefItem(whaleID, whaleName, 1, 0.0);
		rmSetObjectDefMinDistance(whaleID, 0.0);
		rmSetObjectDefMaxDistance(whaleID, rmXFractionToMeters(0.5));
		rmAddObjectDefConstraint(whaleID, whaleVsWhaleID);
		rmAddObjectDefConstraint(whaleID, whaleLand);
		if(rmRandFloat(0,1) < 0.5)
		rmPlaceObjectDefAtLoc(whaleID, 0, 0.5, 0.5, 5*cNumberNonGaiaPlayers);
	}

  // Text
   rmSetStatusText("",1.0);

	// DONE!!!!


}