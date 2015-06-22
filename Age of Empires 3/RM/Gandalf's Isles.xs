// Gandalf's Isles
// by RF_Gandalf
// A Random map script for AOE3

include "mercenaries.xs";

void main(void)
{

// Text
   rmSetStatusText("",0.01);

// Set up for variables
   string baseType = "";
   string forestType = "";
   string treeType = "";
   string deerType = "";
   string deer2Type = "";
   string sheepType = "";
   string centerHerdType = "";
   string fishType = "";
   string fish2Type = "";
   string whaleType = "";

// Set up for natives to appear on the map
   int subCiv0=-1;
   int subCiv1=-1;
   int subCiv2=-1;
   int subCiv3=-1;
   int subCiv4=-1;
   int subCiv5=-1;
   int subCiv6=-1;
   int subCiv7=-1;
   int subCiv8=-1;
   int subCiv9=-1;
   int subCiv10=-1;
   int subCiv11=-1;

   if (rmAllocateSubCivs(12) == true)
   {
	subCiv0=rmGetCivID("Comanche");
      if (subCiv0 >= 0)
         rmSetSubCiv(0, "Comanche");

	subCiv1=rmGetCivID("Iroquois");
      if (subCiv1 >= 0)
         rmSetSubCiv(1, "Iroquois"); 

	subCiv2=rmGetCivID("Aztecs");
      if (subCiv2 >= 0)
         rmSetSubCiv(2, "Aztecs");

	subCiv3=rmGetCivID("Maya");
      if (subCiv3 >= 0)
         rmSetSubCiv(3, "Maya");

	subCiv4=rmGetCivID("Lakota");
      if (subCiv4 >= 0)
         rmSetSubCiv(4, "Lakota");

	subCiv5=rmGetCivID("Nootka");
      if (subCiv5 >= 0)
         rmSetSubCiv(5, "Nootka");

	subCiv6=rmGetCivID("Cherokee");
      if (subCiv6 >= 0)
         rmSetSubCiv(6, "Cherokee");

	subCiv7=rmGetCivID("Cree");
      if (subCiv7 >= 0)
         rmSetSubCiv(7, "Cree");

	subCiv8=rmGetCivID("Tupi");
      if (subCiv8 >= 0)
         rmSetSubCiv(8, "Tupi");

	subCiv9=rmGetCivID("Caribs");
      if (subCiv9 >= 0)
         rmSetSubCiv(9, "Caribs");

	subCiv10=rmGetCivID("Seminoles");
      if (subCiv10 >= 0)
         rmSetSubCiv(10, "Seminoles");

	subCiv11=rmGetCivID("Incas");
      if (subCiv11 >= 0)
         rmSetSubCiv(11, "Incas"); 
   }

// Pick pattern for trees, terrain, features, etc.
   int patternChance = rmRandInt(1, 20);   
   int variantChance = rmRandInt(1, 2);
   int lightingChance = rmRandInt(1, 2);
   int axisChance = rmRandInt(1,2);
   int playerSide = rmRandInt(1,2);   
   int positionChance = rmRandInt(1,2);   
   int distChance = rmRandInt(1,7);
   int sectionChance = rmRandInt(0,12);
   int directionChance = rmRandInt(1,2);
   int nativePattern = -1;
   int sheepChance = rmRandInt(1, 2);
   int tropical = 0;
   int placeBerries = 1;
   int noHeight = 0;
   int baseHeight = rmRandInt(1,2);

// Text
   rmSetStatusText("",0.05);

// Picks the map size
   int playerTiles=47500;  
   if (cNumberNonGaiaPlayers == 8)
	playerTiles = 35000;
   else if (cNumberNonGaiaPlayers == 7)
	playerTiles = 37000;  
   else if (cNumberNonGaiaPlayers == 6)
	playerTiles = 39000;
   else if (cNumberNonGaiaPlayers == 5)
	playerTiles = 41000;  
   else if (cNumberNonGaiaPlayers == 4)
	playerTiles = 42500;
   else if (cNumberNonGaiaPlayers == 3)
	playerTiles = 44500; 

   int size=2.0*sqrt(cNumberNonGaiaPlayers*playerTiles/0.8);
   rmEchoInfo("Map size="+size+"m x "+size+"m");
   rmSetMapSize(size, size);
   rmSetSeaLevel(0.0);

// Select terrain pattern details
   if (patternChance == 1) // NE
   { 
      rmSetSeaType("new england coast");
      rmSetMapType("newEngland");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("constantinople");
	else
	   rmSetLightingSet("new england");
      baseType = "newengland_grass";
	forestType = "new england forest";
	treeType = "TreeNewEngland";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "turkey";
         centerHerdType = "moose";         
	}
      else 
	{     
         deerType = "deer";
         deer2Type = "moose";
         centerHerdType = "deer";        
	}
      if (sheepChance == 1)
         sheepType = "sheep";
      else
         sheepType = "cow";
      fishType = "FishCod"; 
      fish2Type = "FishSalmon";
      whaleType = "minkeWhale";
	nativePattern = 1;
   }
   else if (patternChance == 2) // carolina
   {
      rmSetSeaType("atlantic coast");
      rmSetMapType("carolina");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("312b_washington");
	else
	   rmSetLightingSet("carolina");
      baseType = "carolina_grass";
	forestType = "carolina pine forest";
	treeType = "TreeCarolinaGrass";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "turkey";
         centerHerdType = "deer";
	}
      else 
	{     
         deerType = "deer";
         deer2Type = "deer";
         centerHerdType = "turkey";        
	}
      if (sheepChance == 1)
         sheepType = "cow";
      else
         sheepType = "sheep";
      fishType = "FishSardine";
      fish2Type = "FishCod";
      whaleType = "humpbackWhale";
	nativePattern = 3;
	noHeight = 1;
   }
   else if (patternChance == 3) // bayou
   {
      rmSetSeaType("yucatan Coast");
      rmSetMapType("bayou");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("berlin dusk");
	else
         rmSetLightingSet("bayou");

      baseType = "bayou_grass";
	forestType = "bayou swamp forest";
	treeType = "TreeBayou";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "turkey";
         centerHerdType = "deer";
	}
      else 
	{     
         deerType = "deer";
         deer2Type = "deer";
         centerHerdType = "turkey";        
	}
      if (sheepChance == 1)
         sheepType = "sheep";
      else
         sheepType = "cow";
      fishType = "FishSardine";
      fish2Type = "FishCod";
      whaleType = "humpbackWhale";
	nativePattern = 3;
   }
   else if (patternChance == 4) // great lakes green
   {
      if (variantChance == 1)
         rmSetSeaType("great lakes");
      else
	   rmSetSeaType("new england coast");
      rmSetMapType("greatlakes");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("constantinople");
	else
         rmSetLightingSet("Great Lakes");

      baseType = "greatlakes_grass";
	forestType = "great lakes forest";
	treeType = "TreeGreatLakes";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "bison";
         centerHerdType = "moose";
	}
      else 
	{     
         deerType = "deer";
         deer2Type = "turkey";
         centerHerdType = "moose";        
	}   
      if (sheepChance == 1)
         sheepType = "cow";
      else
         sheepType = "sheep";
      fishType = "FishSardine";
      fish2Type = "FishCod";
      whaleType = "minkeWhale";
	nativePattern = 4;
   }
   else if (patternChance == 5) // great lakes winter
   {
      rmSetSeaType("great lakes");
      rmSetMapType("greatlakes");
      rmSetMapType("snow");
	if (lightingChance == 1)
	   rmSetLightingSet("308b_caribbeanlight");
	else
         rmSetLightingSet("Great Lakes Winter");
      baseType = "greatlakes_snow";
	forestType = "great lakes forest snow";
	treeType = "TreeGreatLakesSnow";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "moose";
         centerHerdType = "elk";
	}
      else 
	{     
         deerType = "bison";
         deer2Type = "deer";
         centerHerdType = "moose";       
	}      
      if (sheepChance == 1)
         sheepType = "cow";
      else
         sheepType = "sheep";
      fishType = "FishSalmon";
      fish2Type = "FishCod";
      whaleType = "minkeWhale";
      placeBerries = 0;
	nativePattern = 5;
	noHeight = 1;
   }
   else if (patternChance == 6) // saguenay
   {
      rmSetSeaType("hudson bay");
      rmSetMapType("saguenay");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("lisbon");
	else
         rmSetLightingSet("saguenay");
      baseType = "saguenay grass";
	forestType = "saguenay forest";
	treeType = "TreeSaguenay";
      if (variantChance == 1)
	{
         deerType = "caribou";
         deer2Type = "moose";
         centerHerdType = "caribou";
	}
      else 
	{     
         deerType = "caribou";
         deer2Type = "caribou";
         centerHerdType = "moose";       
	}
      sheepType = "sheep";
      fishType = "FishSalmon";
      fish2Type = "FishCod";
      whaleType = "beluga";
	nativePattern = 6;
   }
   else if (patternChance == 7) // yukon
   {
      rmSetSeaType("great lakes ice");
      rmSetMapType("yukon");
      rmSetMapType("snow");
	if (lightingChance == 1)
	   rmSetLightingSet("305b");
	else
         rmSetLightingSet("yukon");
      baseType = "yukon snow";
	forestType = "yukon snow forest";
	treeType = "TreeYukonSnow";
      if (variantChance == 1)
	{
         deerType = "caribou";
         deer2Type = "muskOx";
         centerHerdType = "muskOx";
	}
      else 
	{     
         deerType = "muskOx";
         deer2Type = "caribou";
         centerHerdType = "caribou";       
	}
      sheepChance = 0;
      fishType = "FishSalmon";
      fish2Type = "FishCod";
      whaleType = "beluga";
      placeBerries = 0;
	nativePattern = 16;
	noHeight = 1;
   }
   else if (patternChance == 8) // rockies
   {
      rmSetSeaType("great lakes");
      rmSetMapType("rockies");
      rmSetMapType("snow");
	if (lightingChance == 1)
	   rmSetLightingSet("305b");
	else
         rmSetLightingSet("rockies");
      baseType = "rockies_grass";
	forestType = "rockies forest";
	treeType = "TreeRockies";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "elk";
         centerHerdType = "deer";
	}
      else 
	{     
         deerType = "elk";
         deer2Type = "bighornsheep";
         centerHerdType = "deer";
	}   
      if (sheepChance == 1)
         sheepType = "cow";
      else
         sheepType = "sheep";
      fishType = "FishSalmon";
      fish2Type = "FishCod";
      whaleType = "humpbackWhale";
	nativePattern = 7;
   }
   else if (patternChance == 9) // great plains 1
   {
      rmSetSeaType("Yucatan coast");
      rmSetMapType("greatPlains");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("ottoman morning");
	else
         rmSetLightingSet("great plains");
      baseType = "great plains grass"; 
	forestType = "great plains forest";
	treeType = "TreeGreatPlains";
      if (variantChance == 1)
	{
         deerType = "bison";
         deer2Type = "pronghorn";
         centerHerdType = "deer";
	}
      else 
	{     
         deerType = "pronghorn";
         deer2Type = "bison";
         centerHerdType = "elk";
	} 
      if (sheepChance == 1)
         sheepType = "cow";
      else
         sheepType = "sheep";
      fishType = "FishSardine";
      fish2Type = "FishCod";
      whaleType = "minkeWhale";
	nativePattern = 8;
   }
   else if (patternChance == 10) // great plains 2
   {
      rmSetSeaType("Yucatan coast");
      rmSetMapType("greatPlains");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("spc14abuffalo");
	else
         rmSetLightingSet("great plains");
      baseType = "great plains drygrass";
	forestType = "great plains forest";
	treeType = "TreeGreatPlains";
      if (variantChance == 1)
	{
         deerType = "bison";
         deer2Type = "pronghorn";
         centerHerdType = "bison";
	}
      else 
	{     
         deerType = "pronghorn";
         deer2Type = "bison";
         centerHerdType = "deer";
	}
      sheepType = "cow";
      fishType = "FishSardine";
      fish2Type = "FishCod";
      whaleType = "humpbackWhale";
	nativePattern = 2;
   }
   else if (patternChance == 11) // texas grass
   {  
      rmSetSeaType("Atlantic Coast");
      rmSetMapType("texas");
	rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("pampas");
	else
         rmSetLightingSet("texas");
      baseType = "texas_grass";
	forestType = "texas forest";
	treeType = "TreeTexas";
      if (variantChance == 1)
	{
         deerType = "bison";
         deer2Type = "deer";
         centerHerdType = "bison";
	}
      else 
	{     
         deerType = "pronghorn";
         deer2Type = "bison";
         centerHerdType = "deer";
	}
      sheepType = "cow";
      fishType = "FishSardine";
      fish2Type = "FishCod";
      whaleType = "humpbackWhale";
	nativePattern = 9;
	noHeight = 1;
   }
   else if (patternChance == 12) // texas desert
   { 
      rmSetSeaType("Atlantic Coast");
      rmSetMapType("texas");
	rmSetMapType("grass");
      if (lightingChance == 1)
         rmSetLightingSet("seville");
      else
         rmSetLightingSet("texas");
      baseType = "texas_dirt";
	forestType = "texas forest dirt";
	treeType = "TreeTexasDirt";
      if (variantChance == 1)
	{
         deerType = "bison";
         deer2Type = "pronghorn";
         centerHerdType = "pronghorn";
	}
      else 
	{     
         deerType = "pronghorn";
         deer2Type = "bison";
         centerHerdType = "bison";
	}
      sheepType = "cow";
      fishType = "FishSardine";
      fish2Type = "FishCod";
      whaleType = "humpbackWhale";
	nativePattern = 2;
	noHeight = 1;
   }
   else if (patternChance == 13) // sonora
   {  
      rmSetSeaType("caribbean coast");
      rmSetMapType("sonora");
	rmSetMapType("grass");
   	if (lightingChance == 1)
         rmSetLightingSet("sonora");
	else
         rmSetLightingSet("pampas");
      baseType = "sonora_dirt";
	forestType = "sonora forest";
	treeType = "TreeSonora";
      if (variantChance == 1)
	{
         deerType = "pronghorn";
         deer2Type = "bison";
         centerHerdType = "bighornsheep";         
	}
      else 
	{     
         deerType = "pronghorn";
         deer2Type = "bighornsheep";
         centerHerdType = "bison";         
	}
      if (sheepChance == 1)
         sheepType = "sheep";
      else
         sheepType = "cow";
      fishType = "FishSardine";
      fish2Type = "FishMahi";
      whaleType = "humpbackWhale";
      if (variantChance == 1)
   	   nativePattern = 10;
      else 
         nativePattern = 11;
	noHeight = 1;
   }
   else if (patternChance == 14) // yucatan
   {
      rmSetSeaType("yucatan Coast");
      rmSetMapType("yucatan");
      rmSetMapType("tropical");
	if (lightingChance == 1)
	   rmSetLightingSet("311b");
	else
         rmSetLightingSet("yucatan");
      baseType = "yucatan_grass";
	forestType = "yucatan forest";
	treeType = "TreeYucatan";
      if (variantChance == 1)
      {
         deerType = "tapir";
         deer2Type = "turkey";
         centerHerdType = "capybara";
      }
      else
	{
         deerType = "capybara";
         deer2Type = "turkey";
         centerHerdType = "tapir";
	}
      sheepChance = 0;
      tropical = 1;
      fishType = "FishTarpon";
      fish2Type = "FishMahi";
      whaleType = "humpbackWhale";
	nativePattern = 11;
   }
   else if (patternChance == 15) // caribbean
   {
      rmSetSeaType("caribbean coast");
      rmSetMapType("caribbean");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("301a_malta");
	else
         rmSetLightingSet("caribbean");
      baseType = "caribbean grass";
	forestType = "caribbean palm forest";
	treeType = "TreeCaribbean";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "deer";
         centerHerdType = "tapir";
	}
      else 
	{     
         deerType = "deer";
         deer2Type = "tapir";
         centerHerdType = "deer";
	}
      sheepChance = 0;
      tropical = 1;
      fishType = "FishTarpon";
      fish2Type = "FishMahi";
      whaleType = "humpbackWhale";
	nativePattern = 12;
	noHeight = 1;
   }
   else if (patternChance == 16) // amazon
   {
      rmSetSeaType("yucatan coast");
      rmSetMapType("amazonia");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("323b_inca");
	else
         rmSetLightingSet("amazon");
      baseType = "amazon grass";
	forestType = "amazon rain forest";
	treeType = "TreeAmazon";
      if (variantChance == 1)
      {
         deerType = "tapir";
         deer2Type = "tapir";
         centerHerdType = "capybara";
      }
      else
	{
         deerType = "capybara";
         deer2Type = "tapir";
         centerHerdType = "capybara";
	}
      sheepChance = 0;
      tropical = 1;
      fishType = "FishMahi";
      fish2Type = "FishTarpon";
      whaleType = "humpbackWhale";
      nativePattern = 13;
   }
   else if (patternChance == 17) // pampas
   {
      rmSetSeaType("caribbean coast");
      rmSetMapType("pampas");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("texas");
	else
         rmSetLightingSet("pampas");
      baseType = "pampas_grass";
	forestType = "pampas forest";
	treeType = "TreePampas";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "rhea";
         centerHerdType = "rhea";
	}
      else 
	{     
         deerType = "rhea";
         deer2Type = "deer";
         centerHerdType = "rhea";
	}
      sheepType = "llama";
      fishType = "FishMahi";
      fish2Type = "FishTarpon";
      whaleType = "humpbackWhale";
	nativePattern = 14;
	noHeight = 1;
   }
   else if (patternChance == 18) // patagonia
   {
      rmSetSeaType("hudson bay");
      rmSetMapType("patagonia");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("paris day");
	else
         rmSetLightingSet("patagonia");
      baseType = "patagonia_grass";
	forestType = "patagonia forest";
	treeType = "TreePatagoniaDirt";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "rhea";
         centerHerdType = "rhea";
	}
      else 
	{     
         deerType = "rhea";
         deer2Type = "deer";
         centerHerdType = "rhea";
	}
      sheepType = "llama";
      fishType = "FishSalmon";
      fish2Type = "FishSardine";
      whaleType = "minkeWhale";
	nativePattern = 14;
   }
   else if (patternChance == 19) // andes
   {
      rmSetSeaType("hudson bay");
      rmSetMapType("patagonia");
      rmSetMapType("grass");
	if (lightingChance == 1)
         rmSetLightingSet("greatplainstest");
	else
	   rmSetLightingSet("st_petersburg");
      baseType = "patagonia_dirt";
	forestType = "patagonia forest";
	treeType = "TreePatagoniaDirt";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "rhea";
         centerHerdType = "deer";
	}
      else 
	{     
         deerType = "rhea";
         deer2Type = "deer";
         centerHerdType = "deer";
	}
      sheepType = "llama";
      fishType = "FishSalmon";
      fish2Type = "FishCod";
      whaleType = "minkeWhale";
      if (variantChance == 1)
   	   nativePattern = 15;
      else 
         nativePattern = 17;	
   }
   else if (patternChance == 20) // yukon tundra
   {
      rmSetSeaType("hudson bay");
      rmSetMapType("yukon");
      rmSetMapType("snow");
	if (lightingChance == 1)
         rmSetLightingSet("seville morning");
	else
         rmSetLightingSet("yukon");
      baseType = "yukon grass";
	forestType = "yukon forest";
	treeType = "TreeYukon";
      if (variantChance == 1)
	{
            deerType = "muskOx";
            deer2Type = "caribou";
            centerHerdType = "caribou";
	}
      else 
	{  
         deerType = "caribou"; 
         deer2Type = "caribou";
         centerHerdType = "muskOx";
	}
      sheepChance = 0;
      fishType = "FishSalmon";
      fish2Type = "FishCod";
      whaleType = "minkeWhale";
      placeBerries = 0;
	nativePattern = 6;
   }

// Precipitation
   if (patternChance == 16) // amazon
      if (lightingChance == 2)
         rmSetGlobalRain( 1.0 );
   if (patternChance == 7) // yukon
      rmSetGlobalSnow( 0.8 );
   if (patternChance == 5) // great lakes winter
      rmSetGlobalSnow( 0.7 );
   if (patternChance == 8) // rockies
      rmSetGlobalSnow( 0.5 );
   if (patternChance == 14) // yucatan
      if (lightingChance == 2)
         rmSetGlobalRain( 0.7 );
   if (patternChance == 20) // yukon tundra
      if (lightingChance == 2)         
         rmSetGlobalSnow( 0.7 );

   rmTerrainInitialize("water");

   rmSetMapType("water");
   rmSetWorldCircleConstraint(true);
   rmSetWindMagnitude(2.0);

   chooseMercs();

// Define some classes.
   int classPlayer=rmDefineClass("player");
   rmDefineClass("startingUnit");
   rmDefineClass("classForest");
   rmDefineClass("importantItem");
   rmDefineClass("natives");
   rmDefineClass("nuggets");
   rmDefineClass("center");
   rmDefineClass("socketClass");
   rmDefineClass("classFish");
   int classHuntable=rmDefineClass("huntableFood");   
   int classHerdable=rmDefineClass("herdableFood"); 
   int classMines=rmDefineClass("all mines"); 
   int classCenterIsland=rmDefineClass("center island");
   int classBonusIsland=rmDefineClass("bonus island");
   int classSettlementIsland=rmDefineClass("settlement island");
   int classNativeIsland=rmDefineClass("native island");
   int classGoldIsland=rmDefineClass("gold island");
   int islandsX=rmDefineClass("islandsX");
   int islandsY=rmDefineClass("islandsY");
   int islandsZ=rmDefineClass("islandsZ");

// Text
   rmSetStatusText("",0.10);

// -------------Define constraints
   // Map edge constraints
   int playerEdgeConstraint=rmCreateBoxConstraint("player edge of map", rmXTilesToFraction(10), rmZTilesToFraction(10), 1.0-rmXTilesToFraction(10), 1.0-rmZTilesToFraction(10), 0.01);
   int centerConstraint=rmCreateClassDistanceConstraint("stay away from center", rmClassID("center"), 30.0);
   int centerConstraintShort=rmCreateClassDistanceConstraint("stay away from center short", rmClassID("center"), 12.0);
   int centerConstraintFar=rmCreateClassDistanceConstraint("stay away from center far", rmClassID("center"), 70.0);
   int circleConstraint=rmCreatePieConstraint("circle Constraint", 0.5, 0.5, 0, rmZFractionToMeters(0.47), rmDegreesToRadians(0), rmDegreesToRadians(360));
   int circleEdgeConstraint=rmCreatePieConstraint("circle edge Constraint", 0.5, 0.5, 0, rmZFractionToMeters(0.46), rmDegreesToRadians(0), rmDegreesToRadians(360));
   int centralExtraLandConstraint=rmCreatePieConstraint("circle Constraint for extra land", 0.5, 0.5, 0, rmZFractionToMeters(0.17), rmDegreesToRadians(0), rmDegreesToRadians(360));
   int centralExtraLandConstraint2=rmCreatePieConstraint("2nd circle Constraint for extra land", 0.5, 0.5, 0, rmZFractionToMeters(0.12), rmDegreesToRadians(0), rmDegreesToRadians(360));

   // Player constraints
   int playerConstraintForest=rmCreateClassDistanceConstraint("forests kinda stay away from players", classPlayer, 15.0);
   int playerConstraint=rmCreateClassDistanceConstraint("stay away from players", classPlayer, 45.0);
   int mediumPlayerConstraint=rmCreateClassDistanceConstraint("medium stay away from players", classPlayer, 25.0);
   int nuggetPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players a lot", classPlayer, 60.0);
   int farPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players more", classPlayer, 85.0);
   int fartherPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players the most", classPlayer, 105.0);
   int longPlayerConstraint=rmCreateClassDistanceConstraint("land stays away from players", classPlayer, 75.0);

   float constraintChance = rmRandFloat(0, 1);
   int constraintNum = 0;
   if(constraintChance < 0.25)
      constraintNum = 28;
   else if(constraintChance < 0.5)
      constraintNum = 30;
   else if(constraintChance < 0.75)
      constraintNum = 32;
   else 
      constraintNum = 34;
   int secondPlayerConstraint=rmCreateClassDistanceConstraint("also stay away from players", classPlayer, constraintNum); 

   // Nature avoidance
   int forestConstraint2=rmCreateClassDistanceConstraint("forest v forest2", rmClassID("classForest"), 10.0);
   int forestConstraint=rmCreateClassDistanceConstraint("forest vs. forest", rmClassID("classForest"), 20.0);
   int avoidCoin=rmCreateTypeDistanceConstraint("avoid coin", "gold", 10.0);
   int coinAvoidCoin=rmCreateTypeDistanceConstraint("coin avoids coin", "gold", 35.0);
   int longAvoidCoin=rmCreateClassDistanceConstraint("long avoid coin", rmClassID("all mines"), 110.0);
   int avoidStartResource=rmCreateTypeDistanceConstraint("start resource no overlap", "resource", 1.0);
   int avoidSheep=rmCreateClassDistanceConstraint("sheep avoids sheep etc", rmClassID("herdableFood"), 45.0);
   int huntableConstraint=rmCreateClassDistanceConstraint("huntable constraint", rmClassID("huntableFood"), 35.0);

   // Avoid impassable land, certain features
   int avoidImpassableLand=rmCreateTerrainDistanceConstraint("avoid impassable land", "Land", false, 4.0);
   int shortAvoidImpassableLand=rmCreateTerrainDistanceConstraint("short avoid impassable land", "Land", false, 2.0);
   int longAvoidImpassableLand=rmCreateTerrainDistanceConstraint("long avoid impassable land", "Land", false, 18.0);
   int avoidWater10 = rmCreateTerrainDistanceConstraint("avoid water mid-long", "Land", false, 10.0);
   int avoidWater15 = rmCreateTerrainDistanceConstraint("avoid water mid-longer", "Land", false, 15.0);
   int avoidWater20 = rmCreateTerrainDistanceConstraint("avoid water a little more", "Land", false, 20.0);
   int rockVsLand = rmCreateTerrainDistanceConstraint("rock v. land", "land", true, 2.0);
  
   // Unit avoidance
   int avoidStartingUnits=rmCreateClassDistanceConstraint("objects avoid starting units", rmClassID("startingUnit"), 30.0);
   int avoidStartingUnitsSmall=rmCreateClassDistanceConstraint("objects avoid starting units small", rmClassID("startingUnit"), 10.0);
   int avoidImportantItem=rmCreateClassDistanceConstraint("things avoid each other", rmClassID("importantItem"), 10.0);
   int avoidImportantItemSmall=rmCreateClassDistanceConstraint("important item small avoidance", rmClassID("importantItem"), 7.0);
   int avoidNatives=rmCreateClassDistanceConstraint("stuff avoids natives", rmClassID("natives"), 60.0);
   int avoidNativesLong=rmCreateClassDistanceConstraint("stuff avoids natives longer", rmClassID("natives"), 90.0);
   int avoidNativesShort=rmCreateClassDistanceConstraint("stuff avoids natives shorter", rmClassID("natives"), 15.0);
   int avoidNugget=rmCreateClassDistanceConstraint("stuff avoids nuggets", rmClassID("nuggets"), 40.0);
   int avoidNuggetSmall=rmCreateTypeDistanceConstraint("avoid nuggets by a little", "AbstractNugget", 10.0);
   int avoidAll=rmCreateTypeDistanceConstraint("avoid all", "all", 6.0);

   // Trade route avoidance.
   int avoidTradeRoute = rmCreateTradeRouteDistanceConstraint("trade route", 8.0);
   int avoidSocket=rmCreateClassDistanceConstraint("avoid sockets", rmClassID("socketClass"), 10.0);

   // New extra stuff for water spawn point avoidance.
   int flagLand = rmCreateTerrainDistanceConstraint("flag vs land", "land", true, 5.0);
   int flagVsFlag = rmCreateTypeDistanceConstraint("flag avoid same", "HomeCityWaterSpawnFlag", 40);
   int flagEdgeConstraint = rmCreatePieConstraint("flags stay near edge of map", 0.5, 0.5, rmGetMapXSize()-30, rmGetMapXSize()-5, 0, 0, 0);

   // Center constraint
   int avoidCenter=rmCreateClassDistanceConstraint("avoid the center", rmClassID("center"), 30.0);
 
   // Island constraints
   float constraintChance2 = rmRandFloat(0, 1);
   int constraintNum2 = 0;
   if(constraintChance2 < 0.33)
      constraintNum2 = 26;
   else if(constraintChance2 < 0.66)
      constraintNum2 = 29;
   else 
      constraintNum2 = 32;
   float constraintChance3 = rmRandFloat(0, 1);
   int constraintNum3 = 0;
   if(constraintChance3 < 0.33)
      constraintNum3 = 27;
   else if(constraintChance3 < 0.66)
      constraintNum3 = 30;
   else
      constraintNum3 = 32;

   int settlementIslandConstraint=rmCreateClassDistanceConstraint("avoid settlement islands", classSettlementIsland, constraintNum3); 
   int centerIslandConstraint=rmCreateClassDistanceConstraint("avoid center island", classCenterIsland, constraintNum2);
   int nativeIslandConstraint=rmCreateClassDistanceConstraint("avoid native island", classNativeIsland, constraintNum3);
   int nativeIslandConstraintLarge=rmCreateClassDistanceConstraint("avoid native island large", classNativeIsland, rmXFractionToMeters(0.38));
   int islandsXvsY=rmCreateClassDistanceConstraint("island X avoids Y", islandsY, rmRandInt(27,32));
   int islandsYvsX=rmCreateClassDistanceConstraint("island Y avoids X", islandsX, rmRandInt(27,32));
   int islandsXYvsZ=rmCreateClassDistanceConstraint("islands Y and X avoid Z", islandsZ, rmRandInt(27,32));
   int islandsZvsX=rmCreateClassDistanceConstraint("island Z avoids X", islandsX, rmRandInt(27,32));
   int islandsZvsY=rmCreateClassDistanceConstraint("island Z avoids Y", islandsY, rmRandInt(27,32));

// ---------------------------------------------------------------------------------------End constraints

// Text
   rmSetStatusText("",0.15);

// NATIVE AMERICANS - defined
   // Village A 
   int villageAID = -1;
   int whichNative = rmRandInt(1,2);
   int villageType = rmRandInt(1,5);

   if (nativePattern == 1)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native cherokee village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native iroquois village "+villageType);
   }
   if (nativePattern == 2)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native comanche village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native lakota village "+villageType);
   }
   if (nativePattern == 3)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native cherokee village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native seminole village "+villageType);
   }
   if (nativePattern == 4)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native iroquois village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native lakota village "+villageType);
   }
   if (nativePattern == 5)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native iroquois village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native cree village "+villageType);
   }
   if (nativePattern == 6)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native nootka village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native cree village "+villageType);
   }
   if (nativePattern == 7)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native nootka village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native comanche village "+villageType);
   }
   if (nativePattern == 8)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native cree village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native lakota village "+villageType);
   }
   if (nativePattern == 9)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native comanche village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native seminole village "+villageType);
   }
   if (nativePattern == 10)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native comanche village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native aztec village "+villageType);
   }
   if (nativePattern == 11)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native maya village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native aztec village "+villageType);
   }
   if (nativePattern == 12)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native maya village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native carib village "+villageType);
   }
   if (nativePattern == 13)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native tupi village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native carib village "+villageType);
   }
   if (nativePattern == 14)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native tupi village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native inca village "+villageType);
   }
   if (nativePattern == 15)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native maya village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native inca village "+villageType);
   }
   if (nativePattern == 16)
   {
      if (whichNative == 1)
	   villageAID = rmCreateGrouping("village A", "native nootka village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native iroquois village "+villageType);
   }
   if (nativePattern == 17)
   {
      if (whichNative == 1)
   	   villageAID = rmCreateGrouping("village A", "native aztec village "+villageType);
      else if (whichNative == 2)
	   villageAID = rmCreateGrouping("village A", "native inca village "+villageType);
   }
   rmAddGroupingToClass(villageAID, rmClassID("natives"));
   rmAddGroupingToClass(villageAID, rmClassID("importantItem"));
   rmSetGroupingMinDistance(villageAID, 34.0);
   rmSetGroupingMaxDistance(villageAID, rmXFractionToMeters(0.06));
   rmAddGroupingConstraint(villageAID, avoidImpassableLand);
   rmAddGroupingConstraint(villageAID, avoidTradeRoute);
   rmAddGroupingConstraint(villageAID, avoidSocket);
   rmAddGroupingConstraint(villageAID, avoidWater15);
   rmAddGroupingConstraint(villageAID, avoidNatives);

   // Village D - opposite type from A 
   int villageDID = -1;
   villageType = rmRandInt(1,5);

   if (nativePattern == 1)
   {
      if (whichNative == 2)
 	   villageDID = rmCreateGrouping("village D", "native cherokee village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native iroquois village "+villageType);
   }
   if (nativePattern == 2)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native comanche village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native lakota village "+villageType);
   }
   if (nativePattern == 3)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native cherokee village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native seminole village "+villageType);
   }
   if (nativePattern == 4)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native iroquois village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native lakota village "+villageType);
   }
   if (nativePattern == 5)
   {
      if (whichNative == 2)
 	   villageDID = rmCreateGrouping("village D", "native iroquois village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native cree village "+villageType);
   }
   if (nativePattern == 6)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native nootka village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native cree village "+villageType);
   }
   if (nativePattern == 7)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native nootka village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native comanche village "+villageType);
   }
   if (nativePattern == 8)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native cree village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native lakota village "+villageType);
   }
   if (nativePattern == 9)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native comanche village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native seminole village "+villageType);
   }
   if (nativePattern == 10)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native comanche village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native aztec village "+villageType);
   }
   if (nativePattern == 11)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native maya village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native aztec village "+villageType);
   }
   if (nativePattern == 12)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native maya village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native carib village "+villageType);
   }
   if (nativePattern == 13)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native tupi village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native carib village "+villageType);
   }
   if (nativePattern == 14)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native tupi village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native inca village "+villageType);
   }
   if (nativePattern == 15)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native maya village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native inca village "+villageType);
   }
   if (nativePattern == 16)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native nootka village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native iroquois village "+villageType);
   }
   if (nativePattern == 17)
   {
      if (whichNative == 2)
	   villageDID = rmCreateGrouping("village D", "native aztec village "+villageType);
      else if (whichNative == 1)
	   villageDID = rmCreateGrouping("village D", "native inca village "+villageType);
   }
   rmAddGroupingToClass(villageDID, rmClassID("natives"));
   rmAddGroupingToClass(villageDID, rmClassID("importantItem"));
   rmSetGroupingMinDistance(villageDID, 0.0);
   rmSetGroupingMaxDistance(villageDID, rmXFractionToMeters(0.05));
   rmAddGroupingConstraint(villageDID, avoidImpassableLand);
   rmAddGroupingConstraint(villageDID, avoidTradeRoute);
   rmAddGroupingConstraint(villageDID, avoidSocket);
   rmAddGroupingConstraint(villageDID, avoidWater15);
   rmAddGroupingConstraint(villageDID, avoidNativesLong);
   rmAddGroupingConstraint(villageDID, playerConstraint);

// Center area
   int centerArea=rmCreateArea("TheCenter");
   rmSetAreaSize(centerArea, 0.1, 0.1);
   rmSetAreaLocation(centerArea, 0.5, 0.5);
   rmAddAreaToClass(centerArea, rmClassID("center")); 

// --------------------------------------------------------------------------------Done special definitions 

// Text
   rmSetStatusText("",0.20);

// Set up player starting locations
if (sectionChance == 0)
{
      directionChance = 0;

      if (distChance == 1)
         rmPlacePlayersCircular(0.31, 0.32, 0.0);
      else if (distChance == 2)
         rmPlacePlayersCircular(0.32, 0.33, 0.0);
      else if (distChance == 3)
         rmPlacePlayersCircular(0.33, 0.34, 0.0);
	else if (distChance == 4)
	   rmPlacePlayersCircular(0.34, 0.35, 0.0);
      else if (distChance == 5)
	   rmPlacePlayersCircular(0.35, 0.36, 0.0);
	else if (distChance == 6)
	   rmPlacePlayersCircular(0.36, 0.37, 0.0);
	else if (distChance == 7)
	   rmPlacePlayersCircular(0.37, 0.38, 0.0);
}
else
{
   if (cNumberNonGaiaPlayers == 2)
   {
	    sectionChance = rmRandInt(1,21);
	    distChance = rmRandInt(1,4);

	    if (sectionChance == 1) // opposite, across axis 1
	    {
             rmSetPlacementSection(0.0, 0.5);
		 axisChance = 2;
		 if (rmRandInt(1,3) == 1)
		    directionChance = 0;
		 else
	       { 
		    if (rmRandInt(1,2) == 1)
		       directionChance = 1;
		    else
                   directionChance = 2;
		 }
	    }
	    else if (sectionChance == 2) // opposite, across axis 2
	    {
             rmSetPlacementSection(0.25, 0.75);
		 axisChance = 1;
		 if (rmRandInt(1,3) == 1)
		    directionChance = 0;
		 else
	       { 
		    if (rmRandInt(1,2) == 1)
		       directionChance = 1;
		    else
                   directionChance = 2;
		 }
	    }
	    else if (sectionChance == 3) // next 4 same side, 0.3 of map
	    {
             rmSetPlacementSection(0.1, 0.4);
		 if (rmRandInt(1,3) == 1)
		 {
		    directionChance = 0;
		    axisChance = 1;
		 }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 1;
		    else
                   directionChance = 0;
		 }
	    }
	    else if (sectionChance == 4)
	    {
             rmSetPlacementSection(0.6, 0.9);
		 if (rmRandInt(1,3) == 1)
		 {
		    directionChance = 0;
		    axisChance = 1;
		 }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 2;
		    else
                   directionChance = 0;
		 }
	    }
	    else if (sectionChance == 5)
	    {
             rmSetPlacementSection(0.35, 0.65);
		 if (rmRandInt(1,3) == 1)
		 {
		    directionChance = 0;
		    axisChance = 2;
		 }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 2;
		    else
                   directionChance = 0;
		 }
	    }
	    else if (sectionChance == 6)
	    {
             rmSetPlacementSection(0.85, 0.15);
		 if (rmRandInt(1,3) == 1)
		 {
		    directionChance = 0;
		    axisChance = 2;
		 }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 1;
		    else
                   directionChance = 0;
		 }
	    }
	    else if (sectionChance == 7) // next 4 same side, 0.2 of map
	    {
             rmSetPlacementSection(0.15, 0.35);
		 if (rmRandInt(1,3) == 1)
		 {
		    directionChance = 0;
		    axisChance = 1;
		 }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 1;
		    else
                   directionChance = 0;
		 }
	    }
	    else if (sectionChance == 8)
	    {
             rmSetPlacementSection(0.65, 0.85);
		 if (rmRandInt(1,3) == 1)
		 {
		    directionChance = 0;
		    axisChance = 1;
		 }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 2;
		    else
                   directionChance = 0;
		 }
	    }
	    else if (sectionChance == 9)
	    {
             rmSetPlacementSection(0.4, 0.6);
		 if (rmRandInt(1,3) == 1)
		 {
		    directionChance = 0;
		    axisChance = 2;
		 }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 2;
		    else
                   directionChance = 0;
		 }
	    }
	    else if (sectionChance == 10)
	    {
             rmSetPlacementSection(0.9, 0.1);
		 if (rmRandInt(1,3) == 1)
		 {
		    directionChance = 0;
		    axisChance = 2;
		 }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 1;
		    else
                   directionChance = 0;
		 }
	    }
	    else if (sectionChance == 11) // next 4 same side, 0.4 of map
	    {
             rmSetPlacementSection(0.05, 0.45);
		 if (rmRandInt(1,2) == 1)
		 {
		    directionChance = 0;
		    axisChance = 2;
		 }
		 else
		 {
		    axisChance = 2;
		    directionChance = 1;
		 }
	    }
	    else if (sectionChance == 12)
	    {
             rmSetPlacementSection(0.55, 0.95);
		 if (rmRandInt(1,2) == 1)
		 {
		    directionChance = 0;
		    axisChance = 2;
		 }
		 else
		 {
		    axisChance = 2;
  	          directionChance = 2;
		 }
	    }
	    else if (sectionChance == 13)
	    {
             rmSetPlacementSection(0.3, 0.7);
		 if (rmRandInt(1,2) == 1)
		 {
		    directionChance = 0;
		    axisChance = 1;
		 }
		 else
		 {
		    axisChance = 1;
		    directionChance = 2;
		 }
	    }
	    else if (sectionChance == 14)
	    {
             rmSetPlacementSection(0.8, 0.2);
		 if (rmRandInt(1,2) == 1)
		 {
		    directionChance = 0;
		    axisChance = 1;
		 }
		 else
		 {
		    axisChance = 1;
		    directionChance = 1;
		 }
	    }
	    else if (sectionChance == 15) // opposite, not on axis
	    {
             rmSetPlacementSection(0.1, 0.6);
		 if (rmRandInt(1,4) == 1)
		 {
		    directionChance = 0;
		    axisChance = 1;
		 }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,3) == 1)
		       directionChance = 0;
		    else
		    {
		       if (rmRandInt(1,2) == 1)
		          directionChance = 1;
		       else
                      directionChance = 2;
		    }
		 }
	    }
	    else if (sectionChance == 16) // opposite, not on axis
	    {
             rmSetPlacementSection(0.4, 0.9);
		 if (rmRandInt(1,4) == 1)
		 {
		    directionChance = 0;
		    axisChance = 1;
		 }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,3) == 1)
		       directionChance = 0;
		    else
		    {
		       if (rmRandInt(1,2) == 1)
		          directionChance = 1;
		       else
                      directionChance = 2;
		    }
		 }
	    }
	    else if (sectionChance == 17) // opposite, not on axis
	    {
             rmSetPlacementSection(0.15, 0.65);
		 if (rmRandInt(1,4) == 1)
		 {
		    directionChance = 0;
		    axisChance = 2;
		 }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,3) == 1)
		       directionChance = 0;
		    else
		    {
		       if (rmRandInt(1,2) == 1)
		          directionChance = 1;
		       else
                      directionChance = 2;
		    }
		 }
	    }
	    else if (sectionChance == 18) // opposite, not on axis
	    {
             rmSetPlacementSection(0.35, 0.85);
		 if (rmRandInt(1,4) == 1)
		 {
		    directionChance = 0;
		    axisChance = 2;
		 }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,3) == 1)
		       directionChance = 0;
		    else
		    {
		       if (rmRandInt(1,2) == 1)
		          directionChance = 1;
		       else
                      directionChance = 2;
		    }
		 }
	    }
	    else if (sectionChance == 19) // asymmetric
	    {
             rmSetPlacementSection(0.2, 0.4);
  	       directionChance = 1;
		 axisChance = 2;
	    }
	    else if (sectionChance == 20) // asymmetric
	    {
             rmSetPlacementSection(0.6, 0.8);
  	       directionChance = 2;
		 axisChance = 2;
	    }
	    else if (sectionChance == 21) // asymmetric
	    {
             rmSetPlacementSection(0.0, 0.7);
		 axisChance = 2;
		 if (rmRandInt(1,2) == 1)
		 {
		    directionChance = 0;
		 }
		 else
		 {
		    directionChance = 1;
		 }
	    }
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.31, 0.32, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.33, 0.34, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
   }
   else if (cNumberNonGaiaPlayers == 3)
   {
	    sectionChance = rmRandInt(1,15);
	    distChance = rmRandInt(1,6);

	    if (sectionChance == 1) // east - next 4 0.5 circ
	    {
             rmSetPlacementSection(0.0, 0.5);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 1;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 1;
		 }
	    }
	    else if (sectionChance == 2) // south 
	    {
             rmSetPlacementSection(0.25, 0.75);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 2;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 2;
		 }
	    }
	    else if (sectionChance == 3) // west
	    {
             rmSetPlacementSection(0.5, 0.0);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 1;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 2;
		 }
	    }
	    else if (sectionChance == 4) // north
	    {
             rmSetPlacementSection(0.75, 0.25);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 2;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 1;
		 }
	    }
	    else if (sectionChance == 5) // east - next 4 0.7 circ
	    {
             rmSetPlacementSection(0.9, 0.6);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 1;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 1;
		 }
	    }
	    else if (sectionChance == 6) // south 
	    {
             rmSetPlacementSection(0.15, 0.85);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 2;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 2;
		 }
	    }
	    else if (sectionChance == 7) // west
	    {
             rmSetPlacementSection(0.4, 0.1);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 1;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 2;
		 }
	    }
	    else if (sectionChance == 8) // north
	    {
             rmSetPlacementSection(0.65, 0.35);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 2;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 1;
		 }
	    }
	    else if (sectionChance == 9) // east - next 4 0.6 circ, not on axis
	    {
             rmSetPlacementSection(0.00, 0.60);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 1;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 1;
		 }
	    }
	    else if (sectionChance == 10) // south 
	    {
             rmSetPlacementSection(0.25, 0.85);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 2;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 2;
		 }
	    }
	    else if (sectionChance == 11) // west
	    {
             rmSetPlacementSection(0.50, 0.10);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 1;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 2;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 2;
		 }
	    }
	    else if (sectionChance == 12) // north
	    {
             rmSetPlacementSection(0.75, 0.35);
		 if (rmRandInt(1,3) == 1)
		 {
		    axisChance = 2;
		    directionChance = 0;
             }
		 else
		 {
		    axisChance = 1;
		    if (rmRandInt(1,2) == 1)
		       directionChance = 0;
		    else
  	             directionChance = 1;
		 }
	    }
	    else   // chance 13, 14, 15 whole circular
	    {
	       directionChance = 0;	
	    }
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.31, 0.32, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.33, 0.34, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.35, 0.36, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
   }    
   else 
   {
      if (cNumberTeams == 2)
      {
        if (cNumberNonGaiaPlayers == 4) // 2 teams, 4 players 
        {
	    distChance = rmRandInt(1,6);

	    if (sectionChance == 9)
		 directionChance = 1;
	    if (sectionChance == 10)
		 directionChance = 1;
	    if (sectionChance == 11)
		 directionChance = 2;
	    if (sectionChance == 12)
		 directionChance = 2;

	    if (sectionChance == 4)
		 directionChance = 0;
	    if (sectionChance == 5)
		 directionChance = 0;
	    if (sectionChance == 6)
		 directionChance = 0;
	    if (sectionChance == 7)
		 directionChance = 0;
	    if (sectionChance == 8)
		 directionChance = 0;

          if (axisChance == 1)
          {
           if (playerSide == 1)
	  	  rmSetPlacementTeam(0);
           else if (playerSide == 2)
	        rmSetPlacementTeam(1);

	     if (sectionChance == 1)
             rmSetPlacementSection(0.17, 0.33);
	     else if (sectionChance == 2)
             rmSetPlacementSection(0.15, 0.35);
	     else if (sectionChance == 3)
             rmSetPlacementSection(0.13, 0.37);
	     else if (sectionChance == 4)
             rmSetPlacementSection(0.11, 0.39);
	     else if (sectionChance == 5)
             rmSetPlacementSection(0.1, 0.34); // toward CC
	     else if (sectionChance == 6)
             rmSetPlacementSection(0.09, 0.31); // toward CC
	     else if (sectionChance == 7)
             rmSetPlacementSection(0.16, 0.4); // toward C
	     else if (sectionChance == 8)
             rmSetPlacementSection(0.19, 0.41); // toward C
	     else if (sectionChance == 9)
             rmSetPlacementSection(0.12, 0.32); // toward N
	     else if (sectionChance == 10)
		 rmSetPlacementSection(0.10, 0.28); // toward N
	     else if (sectionChance == 11)
             rmSetPlacementSection(0.18, 0.38); // toward S
	     else if (sectionChance == 12)
             rmSetPlacementSection(0.16, 0.40); // toward S

 	     if (distChance == 1)
      	 rmPlacePlayersCircular(0.32, 0.33, 0.0);
  	     else if (distChance == 2)
  	       rmPlacePlayersCircular(0.31, 0.32, 0.0);
 	     else if (distChance == 3)
              rmPlacePlayersCircular(0.30, 0.31, 0.0);
	     else if (distChance == 4)
	        rmPlacePlayersCircular(0.36, 0.37, 0.0);
           else if (distChance == 5)
              rmPlacePlayersCircular(0.33, 0.34, 0.0);
	     else if (distChance == 6)
	        rmPlacePlayersCircular(0.34, 0.35, 0.0);

	     if (playerSide == 1) 
		  rmSetPlacementTeam(1);
  	     else if (playerSide == 2)
	        rmSetPlacementTeam(0);
	     
	     if (sectionChance == 1)
             rmSetPlacementSection(0.67, 0.83);
	     else if (sectionChance == 2)
             rmSetPlacementSection(0.65, 0.85);
	     else if (sectionChance == 3)
             rmSetPlacementSection(0.63, 0.87);
	     else if (sectionChance == 4)
             rmSetPlacementSection(0.61, 0.89);
	     else if (sectionChance == 5)
             rmSetPlacementSection(0.60, 0.84); // cc
	     else if (sectionChance == 6)
             rmSetPlacementSection(0.59, 0.81); // cc
	     else if (sectionChance == 7)
             rmSetPlacementSection(0.66, 0.90); // c
	     else if (sectionChance == 8)
             rmSetPlacementSection(0.69, 0.91); // c
	     else if (sectionChance == 9)
             rmSetPlacementSection(0.68, 0.88); // n
	     else if (sectionChance == 10)
             rmSetPlacementSection(0.72, 0.90); // n
	     else if (sectionChance == 11)
             rmSetPlacementSection(0.62, 0.82); // s
	     else if (sectionChance == 12)
             rmSetPlacementSection(0.60, 0.84); // s

 	     if (distChance == 1)
      	 rmPlacePlayersCircular(0.32, 0.33, 0.0);
  	     else if (distChance == 2)
  	       rmPlacePlayersCircular(0.31, 0.32, 0.0);
 	     else if (distChance == 3)
              rmPlacePlayersCircular(0.30, 0.31, 0.0);
	     else if (distChance == 4)
	        rmPlacePlayersCircular(0.36, 0.37, 0.0);
           else if (distChance == 5)
              rmPlacePlayersCircular(0.33, 0.34, 0.0);
	     else if (distChance == 6)
	        rmPlacePlayersCircular(0.34, 0.35, 0.0);
         }
         else if (axisChance == 2)
         {
	    if (playerSide == 1)
		 rmSetPlacementTeam(0);
          else if (playerSide == 2)
		 rmSetPlacementTeam(1);

	    if (sectionChance == 1)
             rmSetPlacementSection(0.42, 0.58);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.40, 0.60);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.38, 0.62);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.36, 0.64);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.35, 0.59); // toward CC
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.34, 0.56); // toward CC
	    else if (sectionChance == 7)
             rmSetPlacementSection(0.41, 0.65); // toward C
	    else if (sectionChance == 8)
             rmSetPlacementSection(0.44, 0.66); // toward C
	    else if (sectionChance == 9)
             rmSetPlacementSection(0.37, 0.57); // toward E
	    else if (sectionChance == 10)
             rmSetPlacementSection(0.35, 0.5); // toward E
	    else if (sectionChance == 11)
             rmSetPlacementSection(0.43, 0.63); // toward W
	    else if (sectionChance == 12)
             rmSetPlacementSection(0.41, 0.65); // toward W

 	     if (distChance == 1)
      	 rmPlacePlayersCircular(0.32, 0.33, 0.0);
  	     else if (distChance == 2)
  	       rmPlacePlayersCircular(0.31, 0.32, 0.0);
 	     else if (distChance == 3)
              rmPlacePlayersCircular(0.30, 0.31, 0.0);
	     else if (distChance == 4)
	        rmPlacePlayersCircular(0.36, 0.37, 0.0);
           else if (distChance == 5)
              rmPlacePlayersCircular(0.33, 0.34, 0.0);
	     else if (distChance == 6)
	        rmPlacePlayersCircular(0.34, 0.35, 0.0);

	    if (playerSide == 1)
		 rmSetPlacementTeam(1);
          else if (playerSide == 2)
		 rmSetPlacementTeam(0);
	    
	    if (sectionChance == 1)
             rmSetPlacementSection(0.92, 0.08);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.90, 0.10);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.88, 0.12);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.86, 0.14);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.85, 0.09); // toward CC
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.84, 0.06); // toward CC
	    else if (sectionChance == 7)
             rmSetPlacementSection(0.91, 0.15); // toward C
	    else if (sectionChance == 8)
             rmSetPlacementSection(0.94, 0.16); // toward C
	    else if (sectionChance == 9)
             rmSetPlacementSection(0.93, 0.13); // toward E
	    else if (sectionChance == 10)
             rmSetPlacementSection(0.00, 0.15); // toward E
	    else if (sectionChance == 11)
             rmSetPlacementSection(0.87, 0.07); // toward W
	    else if (sectionChance == 12)
             rmSetPlacementSection(0.85, 0.09); // toward W

 	     if (distChance == 1)
      	 rmPlacePlayersCircular(0.32, 0.33, 0.0);
  	     else if (distChance == 2)
  	       rmPlacePlayersCircular(0.31, 0.32, 0.0);
 	     else if (distChance == 3)
              rmPlacePlayersCircular(0.30, 0.31, 0.0);
	     else if (distChance == 4)
	        rmPlacePlayersCircular(0.36, 0.37, 0.0);
           else if (distChance == 5)
              rmPlacePlayersCircular(0.33, 0.34, 0.0);
	     else if (distChance == 6)
	        rmPlacePlayersCircular(0.34, 0.35, 0.0);
         }	  
        }
        else if (cNumberNonGaiaPlayers < 7) // for 2 teams, for 5-6 players
        {
	    sectionChance = rmRandInt(1,15);
	    if (sectionChance < 13)
  	    {
	       if (sectionChance == 9)
		  directionChance = 1;
	       if (sectionChance == 10)
	 	  directionChance = 1;
	       if (sectionChance == 11)
		  directionChance = 2;
	       if (sectionChance == 12)
		  directionChance = 2;

	       if (sectionChance == 4)
		  directionChance = 0;
	       if (sectionChance == 5)
		  directionChance = 0;
	       if (sectionChance == 6)
		  directionChance = 0;
	       if (sectionChance == 7)
		  directionChance = 0;
	       if (sectionChance == 8)
		  directionChance = 0;

             if (axisChance == 1)
             {  
             if (playerSide == 1)
	  	    rmSetPlacementTeam(0);
             else if (playerSide == 2)
		    rmSetPlacementTeam(1);

	       if (sectionChance == 1)
                rmSetPlacementSection(0.13, 0.37);
	       else if (sectionChance == 2)
                rmSetPlacementSection(0.12, 0.38);
	       else if (sectionChance == 3)
                rmSetPlacementSection(0.11, 0.39);
	       else if (sectionChance == 4)
                rmSetPlacementSection(0.10, 0.40);
	       else if (sectionChance == 5)
                rmSetPlacementSection(0.1, 0.34); // toward CC
	       else if (sectionChance == 6)
                rmSetPlacementSection(0.09, 0.31); // toward CC
	       else if (sectionChance == 7)
                rmSetPlacementSection(0.16, 0.4); // toward C
	       else if (sectionChance == 8)
                rmSetPlacementSection(0.19, 0.41); // toward C
	       else if (sectionChance == 9)
                rmSetPlacementSection(0.12, 0.32); // toward N
	       else if (sectionChance == 10)
	  	    rmSetPlacementSection(0.07, 0.27); // toward N
	       else if (sectionChance == 11)
                rmSetPlacementSection(0.18, 0.38); // toward S
	       else if (sectionChance == 12)
                rmSetPlacementSection(0.16, 0.40); // toward S

             if (distChance == 1)
         	    rmPlacePlayersCircular(0.30, 0.31, 0.0);
             else if (distChance == 2)
                rmPlacePlayersCircular(0.31, 0.32, 0.0);
        	 else if (distChance == 3)
                rmPlacePlayersCircular(0.32, 0.33, 0.0);
		 else if (distChance == 4)
         	    rmPlacePlayersCircular(0.33, 0.34, 0.0);
      	 else if (distChance == 5)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
		 else if (distChance == 6)
	   	    rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.37, 0.38, 0.0);

	       if (playerSide == 1)
		    rmSetPlacementTeam(1);
             else if (playerSide == 2)
		    rmSetPlacementTeam(0);

	       if (sectionChance == 1)
                rmSetPlacementSection(0.63, 0.87);
	       else if (sectionChance == 2)
                rmSetPlacementSection(0.62, 0.88);
	       else if (sectionChance == 3)
                rmSetPlacementSection(0.61, 0.89);
	       else if (sectionChance == 4)
                rmSetPlacementSection(0.60, 0.90);
	       else if (sectionChance == 5)
                rmSetPlacementSection(0.60, 0.84); // cc
	       else if (sectionChance == 6)
                rmSetPlacementSection(0.59, 0.81); // cc
	       else if (sectionChance == 7)
                rmSetPlacementSection(0.66, 0.90); // c
	       else if (sectionChance == 8)
                rmSetPlacementSection(0.69, 0.91); // c
	       else if (sectionChance == 9)
                rmSetPlacementSection(0.68, 0.88); // n
	       else if (sectionChance == 10)
                rmSetPlacementSection(0.73, 0.93); // n
	       else if (sectionChance == 11)
                rmSetPlacementSection(0.62, 0.82); // s
	       else if (sectionChance == 12)
                rmSetPlacementSection(0.60, 0.84); // s

             if (distChance == 1)
         	    rmPlacePlayersCircular(0.30, 0.31, 0.0);
             else if (distChance == 2)
                rmPlacePlayersCircular(0.31, 0.32, 0.0);
        	 else if (distChance == 3)
                rmPlacePlayersCircular(0.32, 0.33, 0.0);
		 else if (distChance == 4)
         	    rmPlacePlayersCircular(0.33, 0.34, 0.0);
      	 else if (distChance == 5)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
		 else if (distChance == 6)
	   	    rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.37, 0.38, 0.0);
             }
             else if (axisChance == 2)
             {
	       if (playerSide == 1)
		    rmSetPlacementTeam(0);
             else if (playerSide == 2)
		    rmSetPlacementTeam(1);

	       if (sectionChance == 1)
                rmSetPlacementSection(0.38, 0.62);
	       else if (sectionChance == 3)
                rmSetPlacementSection(0.37, 0.63);
	       else if (sectionChance == 2)
                rmSetPlacementSection(0.36, 0.64);
	       else if (sectionChance == 4)
                rmSetPlacementSection(0.35, 0.65);
	       else if (sectionChance == 5)
                rmSetPlacementSection(0.35, 0.59); // toward CC
	       else if (sectionChance == 6)
                rmSetPlacementSection(0.34, 0.56); // toward CC
	       else if (sectionChance == 7)
                rmSetPlacementSection(0.41, 0.65); // toward C
	       else if (sectionChance == 8)
                rmSetPlacementSection(0.44, 0.66); // toward C
	       else if (sectionChance == 9)
                rmSetPlacementSection(0.37, 0.57); // toward E
	       else if (sectionChance == 10)
                rmSetPlacementSection(0.32, 0.52); // toward E
	       else if (sectionChance == 11)
                rmSetPlacementSection(0.43, 0.63); // toward W
	       else if (sectionChance == 12)
                rmSetPlacementSection(0.41, 0.65); // toward W

             if (distChance == 1)
         	    rmPlacePlayersCircular(0.30, 0.31, 0.0);
             else if (distChance == 2)
                rmPlacePlayersCircular(0.31, 0.32, 0.0);
        	 else if (distChance == 3)
                rmPlacePlayersCircular(0.32, 0.33, 0.0);
		 else if (distChance == 4)
         	    rmPlacePlayersCircular(0.33, 0.34, 0.0);
      	 else if (distChance == 5)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
		 else if (distChance == 6)
	   	    rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.37, 0.38, 0.0);
   
	       if (playerSide == 1)
	   	    rmSetPlacementTeam(1);
             else if (playerSide == 2)
		    rmSetPlacementTeam(0);

	       if (sectionChance == 1)
                rmSetPlacementSection(0.88, 0.12);
	       else if (sectionChance == 2)
                rmSetPlacementSection(0.87, 0.13);
	       else if (sectionChance == 3)
                rmSetPlacementSection(0.86, 0.14);
   	       else if (sectionChance == 4)
                rmSetPlacementSection(0.85, 0.15);
	       else if (sectionChance == 5)
                rmSetPlacementSection(0.85, 0.09); // toward CC
	       else if (sectionChance == 6)
                rmSetPlacementSection(0.84, 0.06); // toward CC
	       else if (sectionChance == 7)
                rmSetPlacementSection(0.91, 0.15); // toward C
	       else if (sectionChance == 8)
                rmSetPlacementSection(0.94, 0.16); // toward C
	       else if (sectionChance == 9)
                rmSetPlacementSection(0.93, 0.13); // toward E
	       else if (sectionChance == 10)
                rmSetPlacementSection(0.98, 0.18); // toward E
	       else if (sectionChance == 11)
                rmSetPlacementSection(0.87, 0.07); // toward W
	       else if (sectionChance == 12)
                rmSetPlacementSection(0.85, 0.09); // toward W

             if (distChance == 1)
         	    rmPlacePlayersCircular(0.30, 0.31, 0.0);
             else if (distChance == 2)
                rmPlacePlayersCircular(0.31, 0.32, 0.0);
        	 else if (distChance == 3)
                rmPlacePlayersCircular(0.32, 0.33, 0.0);
		 else if (distChance == 4)
         	    rmPlacePlayersCircular(0.33, 0.34, 0.0);
      	 else if (distChance == 5)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
		 else if (distChance == 6)
	   	    rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.37, 0.38, 0.0);
	       } 
	    }
	    else if (sectionChance > 12)
          {
		 directionChance = 0;
             if (distChance == 1)
         	    rmPlacePlayersCircular(0.30, 0.31, 0.0);
             else if (distChance == 2)
                rmPlacePlayersCircular(0.31, 0.32, 0.0);
        	 else if (distChance == 3)
                rmPlacePlayersCircular(0.32, 0.33, 0.0);
		 else if (distChance == 4)
         	    rmPlacePlayersCircular(0.33, 0.34, 0.0);
      	 else if (distChance == 5)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
		 else if (distChance == 6)
	   	    rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.37, 0.38, 0.0);
          }
        }
        else  // for 2 teams, for over 6 players
        {  
	     sectionChance = rmRandInt(1,7);
	     if (sectionChance > 5) // chances 6 and 7, opp sides
           {
              if (axisChance == 1)
              {
                 if (playerSide == 1)
	  	       rmSetPlacementTeam(0);
                 else if (playerSide == 2)
		       rmSetPlacementTeam(1);
                 rmSetPlacementSection(0.11, 0.39);

 	           if (distChance == 1)
	              rmPlacePlayersCircular(0.30, 0.31, 0.0);
	           else if (distChance == 2)
	              rmPlacePlayersCircular(0.32, 0.33, 0.0);
	           else if (distChance == 3)
	              rmPlacePlayersCircular(0.34, 0.35, 0.0);
	           else if (distChance == 4)
	              rmPlacePlayersCircular(0.36, 0.37, 0.0);
	           else if (distChance == 5)
	              rmPlacePlayersCircular(0.38, 0.39, 0.0);
	           else if (distChance == 6)
	              rmPlacePlayersCircular(0.40, 0.41, 0.0);
	           else if (distChance == 7)
	              rmPlacePlayersCircular(0.42, 0.43, 0.0);

	           if (playerSide == 1)
			 rmSetPlacementTeam(1);
                 else if (playerSide == 2)
			 rmSetPlacementTeam(0);
                 rmSetPlacementSection(0.61, 0.89);

 	           if (distChance == 1)
	              rmPlacePlayersCircular(0.30, 0.31, 0.0);
	           else if (distChance == 2)
	              rmPlacePlayersCircular(0.32, 0.33, 0.0);
	           else if (distChance == 3)
	              rmPlacePlayersCircular(0.34, 0.35, 0.0);
	           else if (distChance == 4)
	              rmPlacePlayersCircular(0.36, 0.37, 0.0);
	           else if (distChance == 5)
	              rmPlacePlayersCircular(0.38, 0.39, 0.0);
	           else if (distChance == 6)
	              rmPlacePlayersCircular(0.40, 0.41, 0.0);
	           else if (distChance == 7)
	              rmPlacePlayersCircular(0.42, 0.43, 0.0);
              }
              else if (axisChance == 2)
              {
                 if (playerSide == 1)
	  	       rmSetPlacementTeam(0);
                 else if (playerSide == 2)
		       rmSetPlacementTeam(1);
                 rmSetPlacementSection(0.36, 0.64);

 	           if (distChance == 1)
	              rmPlacePlayersCircular(0.30, 0.31, 0.0);
	           else if (distChance == 2)
	              rmPlacePlayersCircular(0.32, 0.33, 0.0);
	           else if (distChance == 3)
	              rmPlacePlayersCircular(0.34, 0.35, 0.0);
	           else if (distChance == 4)
	              rmPlacePlayersCircular(0.36, 0.37, 0.0);
	           else if (distChance == 5)
	              rmPlacePlayersCircular(0.38, 0.39, 0.0);
	           else if (distChance == 6)
	              rmPlacePlayersCircular(0.40, 0.41, 0.0);
	           else if (distChance == 7)
	              rmPlacePlayersCircular(0.42, 0.43, 0.0);

	           if (playerSide == 1)
			 rmSetPlacementTeam(1);
                 else if (playerSide == 2)
			 rmSetPlacementTeam(0);
                 rmSetPlacementSection(0.86, 0.14);

 	           if (distChance == 1)
	              rmPlacePlayersCircular(0.30, 0.31, 0.0);
	           else if (distChance == 2)
	              rmPlacePlayersCircular(0.32, 0.33, 0.0);
	           else if (distChance == 3)
	              rmPlacePlayersCircular(0.34, 0.35, 0.0);
	           else if (distChance == 4)
	              rmPlacePlayersCircular(0.36, 0.37, 0.0);
	           else if (distChance == 5)
	              rmPlacePlayersCircular(0.38, 0.39, 0.0);
	           else if (distChance == 6)
	              rmPlacePlayersCircular(0.40, 0.41, 0.0);
	           else if (distChance == 7)
	              rmPlacePlayersCircular(0.42, 0.43, 0.0);
              }   
           }  
	     else if (sectionChance == 1) // 0.7 of map, gap to E
           {	
             rmSetPlacementSection(0.39, 0.11);
 	       if (distChance == 1)
	          rmPlacePlayersCircular(0.30, 0.31, 0.0);
	       else if (distChance == 2)
	          rmPlacePlayersCircular(0.32, 0.33, 0.0);
	       else if (distChance == 3)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
	       else if (distChance == 4)
	          rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 5)
	          rmPlacePlayersCircular(0.38, 0.39, 0.0);
	       else if (distChance == 6)
	          rmPlacePlayersCircular(0.40, 0.41, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.42, 0.43, 0.0);
		 if (rmRandInt(1,4) == 1)
		 {
		    axisChance = 1;
		    directionChance = 0;
		 }
		 else
	       {
		    axisChance = 2;		     
		    if (rmRandInt(1,3) == 1)
		       directionChance = 0;
		    else
                   directionChance = 2;
		 }
           }
	     else if (sectionChance == 2) // 0.7 of map, gap to W
           {	
             rmSetPlacementSection(0.89, 0.61);
 	       if (distChance == 1)
	          rmPlacePlayersCircular(0.30, 0.31, 0.0);
	       else if (distChance == 2)
	          rmPlacePlayersCircular(0.32, 0.33, 0.0);
	       else if (distChance == 3)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
	       else if (distChance == 4)
	          rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 5)
	          rmPlacePlayersCircular(0.38, 0.39, 0.0);
	       else if (distChance == 6)
	          rmPlacePlayersCircular(0.40, 0.41, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.42, 0.43, 0.0);
		 if (rmRandInt(1,4) == 1)
		 {
		    axisChance = 1;
		    directionChance = 0;
		 }
		 else
	       {
		    axisChance = 2;		     
		    if (rmRandInt(1,3) == 1)
		       directionChance = 0;
		    else
                   directionChance = 1;
		 }
           }
           else if (sectionChance == 3) // 0.7 of map, gap to S
           {	
             rmSetPlacementSection(0.64, 0.36);
 	       if (distChance == 1)
	          rmPlacePlayersCircular(0.30, 0.31, 0.0);
	       else if (distChance == 2)
	          rmPlacePlayersCircular(0.32, 0.33, 0.0);
	       else if (distChance == 3)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
	       else if (distChance == 4)
	          rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 5)
	          rmPlacePlayersCircular(0.38, 0.39, 0.0);
	       else if (distChance == 6)
	          rmPlacePlayersCircular(0.40, 0.41, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.42, 0.43, 0.0);
		 if (rmRandInt(1,4) == 1)
		 {
		    axisChance = 2;
		    directionChance = 0;
		 }
		 else
	       {
		    axisChance = 1;		     
		    if (rmRandInt(1,3) == 1)
		       directionChance = 0;
		    else
                   directionChance = 1;
		 }
           }
           else if (sectionChance == 4) // 0.7 of map, gap to N
           {	
             rmSetPlacementSection(0.14, 0.86);
 	       if (distChance == 1)
	          rmPlacePlayersCircular(0.30, 0.31, 0.0);
	       else if (distChance == 2)
	          rmPlacePlayersCircular(0.32, 0.33, 0.0);
	       else if (distChance == 3)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
	       else if (distChance == 4)
	          rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 5)
	          rmPlacePlayersCircular(0.38, 0.39, 0.0);
	       else if (distChance == 6)
	          rmPlacePlayersCircular(0.40, 0.41, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.42, 0.43, 0.0);
		 if (rmRandInt(1,4) == 1)
		 {
		    axisChance = 2;
		    directionChance = 0;
		 }
		 else
	       {
		    axisChance = 1;		     
		    if (rmRandInt(1,3) == 1)
		       directionChance = 0;
		    else
                   directionChance = 2;
             }
           }
           else if (sectionChance == 5) // another circular chance
	     {
	       directionChance = 0;
 	       if (distChance == 1)
	          rmPlacePlayersCircular(0.30, 0.31, 0.0);
	       else if (distChance == 2)
	          rmPlacePlayersCircular(0.32, 0.33, 0.0);
	       else if (distChance == 3)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
	       else if (distChance == 4)
	          rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 5)
	          rmPlacePlayersCircular(0.38, 0.39, 0.0);
	       else if (distChance == 6)
	          rmPlacePlayersCircular(0.40, 0.41, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.42, 0.43, 0.0);
	     }
        }
      }
      else  // for FFA or over 2 teams
      {
	   sectionChance = rmRandInt(1,5);
	   if (sectionChance == 5) // another chance at circular placement
	   {
            directionChance = 0;
            if (cNumberNonGaiaPlayers < 6) //FFA 4 or 5 pl
            {
               if (distChance == 1)
         	      rmPlacePlayersCircular(0.30, 0.31, 0.0);
               else if (distChance == 2)
                  rmPlacePlayersCircular(0.31, 0.32, 0.0);
      	   else if (distChance == 3)
                  rmPlacePlayersCircular(0.32, 0.33, 0.0);
		   else if (distChance == 4)
         	      rmPlacePlayersCircular(0.33, 0.34, 0.0);
      	   else if (distChance == 5)
	            rmPlacePlayersCircular(0.34, 0.35, 0.0);
		   else if (distChance == 6)
	   	      rmPlacePlayersCircular(0.36, 0.37, 0.0);
	         else if (distChance == 7)
	            rmPlacePlayersCircular(0.37, 0.38, 0.0);
            }
            else  // over 5 FFA 
            { 
 	         if (distChance == 1)
	            rmPlacePlayersCircular(0.30, 0.31, 0.0);
	         else if (distChance == 2)
	            rmPlacePlayersCircular(0.32, 0.33, 0.0);
	         else if (distChance == 3)
	            rmPlacePlayersCircular(0.34, 0.35, 0.0);
	         else if (distChance == 4)
	            rmPlacePlayersCircular(0.36, 0.37, 0.0);
	         else if (distChance == 5)
	            rmPlacePlayersCircular(0.38, 0.39, 0.0);
	         else if (distChance == 6)
	            rmPlacePlayersCircular(0.40, 0.41, 0.0);
	         else if (distChance == 7)
                  rmPlacePlayersCircular(0.42, 0.43, 0.0);
            }
	   }
         else 
         {
	      if (sectionChance == 1) // 0.7 of map, gap to E	
		{
		    if (rmRandInt(1,4) == 1)
		    {
		       axisChance = 1;
		       directionChance = 0;
		    }
		    else
	          {
		       axisChance = 2;		     
		       if (rmRandInt(1,3) == 1)
		          directionChance = 0;
		       else
                      directionChance = 2;
		    }
                rmSetPlacementSection(0.39, 0.11);
		}
	      else if (sectionChance == 2) // 0.7 of map, gap to W
            {
		   if (rmRandInt(1,4) == 1)
		   {
		      axisChance = 1;
		      directionChance = 0;
		   }
		   else
	         {
		      axisChance = 2;		     
		      if (rmRandInt(1,3) == 1)
		         directionChance = 0;
		      else
                     directionChance = 1;
		   }
               rmSetPlacementSection(0.89, 0.61);
		}
            else if (sectionChance == 3) // 0.7 of map, gap to S
            {	
		   if (rmRandInt(1,4) == 1)
		   {
		      axisChance = 2;
		      directionChance = 0;
		   }
		   else
	         {
		      axisChance = 1;		     
		      if (rmRandInt(1,3) == 1)
		         directionChance = 0;
		      else
                     directionChance = 1;
		   }
               rmSetPlacementSection(0.64, 0.36);
            }
            else if (sectionChance == 4) // 0.7 of map, gap to N
            {	
		   if (rmRandInt(1,4) == 1)
		   {
		      axisChance = 2;
		      directionChance = 0;
		   }
		   else
	         {
		      axisChance = 1;		     
		      if (rmRandInt(1,3) == 1)
		         directionChance = 0;
		      else
                     directionChance = 2;
               }
               rmSetPlacementSection(0.14, 0.86);
            }  
		if (cNumberNonGaiaPlayers < 6)
		{
               if (distChance == 1)
         	      rmPlacePlayersCircular(0.30, 0.31, 0.0);
               else if (distChance == 2)
                  rmPlacePlayersCircular(0.31, 0.32, 0.0);
      	   else if (distChance == 3)
                  rmPlacePlayersCircular(0.32, 0.33, 0.0);
		   else if (distChance == 4)
         	      rmPlacePlayersCircular(0.33, 0.34, 0.0);
      	   else if (distChance == 5)
	            rmPlacePlayersCircular(0.34, 0.35, 0.0);
		   else if (distChance == 6)
	   	      rmPlacePlayersCircular(0.36, 0.37, 0.0);
	         else if (distChance == 7)
	            rmPlacePlayersCircular(0.37, 0.38, 0.0);
		}
		else
		{
 	         if (distChance == 1)
	            rmPlacePlayersCircular(0.30, 0.31, 0.0);
	         else if (distChance == 2)
	            rmPlacePlayersCircular(0.32, 0.33, 0.0);
	         else if (distChance == 3)
	            rmPlacePlayersCircular(0.34, 0.35, 0.0);
	         else if (distChance == 4)
	            rmPlacePlayersCircular(0.36, 0.37, 0.0);
	         else if (distChance == 5)
	            rmPlacePlayersCircular(0.38, 0.39, 0.0);
	         else if (distChance == 6)
	            rmPlacePlayersCircular(0.40, 0.41, 0.0);
	         else if (distChance == 7)
                  rmPlacePlayersCircular(0.42, 0.43, 0.0);
		}
         }
      }
   }
}

// Set up player areas.
   float playerFraction=rmAreaTilesToFraction(7000 + cNumberNonGaiaPlayers*150);
   float randomIslandChance=rmRandFloat(0, 1);
   for(i=1; <cNumberPlayers)
   {
      int id=rmCreateArea("Player"+i);
      rmSetPlayerArea(i, id);
      rmSetAreaSize(id, 0.95*playerFraction, 1.05*playerFraction);
      rmAddAreaToClass(id, classPlayer);
	if (noHeight == 1)
         rmSetAreaBaseHeight(id, 0.5);
	else
         rmSetAreaBaseHeight(id, baseHeight);
      rmSetAreaSmoothDistance(id, 20);
	rmSetAreaCoherence(id, 0.65);
      rmSetAreaElevationVariation(id, 1.0);
      rmSetAreaElevationMinFrequency(id, 0.09);
      rmSetAreaElevationOctaves(id, 3);
      rmSetAreaElevationPersistence(id, 0.2);
	rmSetAreaElevationNoiseBias(id, 1);
      rmAddAreaConstraint(id, avoidCenter); 
      rmAddAreaConstraint(id, mediumPlayerConstraint);
      rmAddAreaConstraint(id, circleEdgeConstraint);
      rmSetAreaLocPlayer(id, i);
      rmSetAreaMix(id, baseType);
   }
   rmBuildAllAreas();

// Text
   rmSetStatusText("",0.25);

// Starting TCs and units 		
   int startingUnits = rmCreateStartingUnitsObjectDef(5.0);
   rmSetObjectDefMinDistance(startingUnits, 5.0);
   rmSetObjectDefMaxDistance(startingUnits, 10.0);
   rmAddObjectDefConstraint(startingUnits, avoidAll);

   int startingTCID= rmCreateObjectDef("startingTC");
   rmSetObjectDefMaxDistance(startingTCID, 10.0);
   rmAddObjectDefConstraint(startingTCID, avoidAll);
   rmAddObjectDefConstraint(startingTCID, avoidTradeRoute);
   rmAddObjectDefConstraint(startingTCID, longAvoidImpassableLand);                
   if ( rmGetNomadStart())
   {
	rmAddObjectDefItem(startingTCID, "CoveredWagon", 1, 0.0);
   }
   else
   {
      rmAddObjectDefItem(startingTCID, "TownCenter", 1, 0.0);
   }

   for(i=1; <cNumberPlayers)
   {	
      rmPlaceObjectDefAtLoc(startingTCID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
      rmPlaceObjectDefAtLoc(startingUnits, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
   }

// Big Center Island
   int bigIslandID=rmCreateArea("big island");
   rmSetAreaSize(bigIslandID, rmAreaTilesToFraction(5000 + cNumberNonGaiaPlayers*500), rmAreaTilesToFraction(5500 + cNumberNonGaiaPlayers*500));
   rmSetAreaLocation(bigIslandID, 0.5, 0.5);
   if (axisChance == 1)
   {
	   if (directionChance == 1)
           rmAddAreaInfluenceSegment(bigIslandID, 0.5, 0.28, 0.5, 0.55);           
	   else if (directionChance == 2)
           rmAddAreaInfluenceSegment(bigIslandID, 0.5, 0.72, 0.5, 0.45);
	   else if (directionChance == 0)
           rmAddAreaInfluenceSegment(bigIslandID, 0.5, 0.38, 0.5, 0.62);
	   if (variantChance == 1)
           rmAddAreaInfluenceSegment(bigIslandID, 0.45, 0.5, 0.5, 0.5);  
	   else
           rmAddAreaInfluenceSegment(bigIslandID, 0.55, 0.5, 0.5, 0.5);  

   }
   else if (axisChance == 2)
   {
	   if (directionChance == 1)
           rmAddAreaInfluenceSegment(bigIslandID, 0.55, 0.5, 0.28, 0.5);
	   else if (directionChance == 2)
           rmAddAreaInfluenceSegment(bigIslandID, 0.45, 0.5, 0.72, 0.5);
	   else if (directionChance == 0)
           rmAddAreaInfluenceSegment(bigIslandID, 0.38, 0.5, 0.62, 0.5);
	   if (variantChance == 1)
           rmAddAreaInfluenceSegment(bigIslandID, 0.5, 0.45, 0.5, 0.5);  
	   else
           rmAddAreaInfluenceSegment(bigIslandID, 0.5, 0.55, 0.5, 0.5);  
   }
   rmSetAreaMix(bigIslandID, baseType);
   rmSetAreaWarnFailure(bigIslandID, false);
   rmAddAreaConstraint(bigIslandID, playerConstraint); 
   rmAddAreaToClass(bigIslandID, classSettlementIsland);
   rmAddAreaToClass(bigIslandID, classCenterIsland);
   rmAddAreaToClass(bigIslandID, classGoldIsland);
   rmSetAreaCoherence(bigIslandID, 0.5);
   rmSetAreaSmoothDistance(bigIslandID, 12);
   rmSetAreaHeightBlend(bigIslandID, 2);
   rmSetAreaBaseHeight(bigIslandID, baseHeight);
   rmBuildArea(bigIslandID);

// Extra Center Land
   int extraCount=cNumberNonGaiaPlayers + 2;  // num players plus some extra
   if (cNumberNonGaiaPlayers > 6)
      extraCount=cNumberNonGaiaPlayers + 1;
  
   for(i=0; <extraCount)
   {
      int extraLandID=rmCreateArea("extraland"+i);
      rmSetAreaSize(extraLandID, rmAreaTilesToFraction(500 + cNumberNonGaiaPlayers*100), rmAreaTilesToFraction(600 + cNumberNonGaiaPlayers*120));
      rmSetAreaMix(extraLandID, baseType);
      rmSetAreaWarnFailure(extraLandID, false);
      if (cNumberNonGaiaPlayers > 5)
         rmAddAreaConstraint(extraLandID, centralExtraLandConstraint2);
	else	
         rmAddAreaConstraint(extraLandID, centralExtraLandConstraint);
      rmAddAreaConstraint(extraLandID, playerConstraint); 
      rmAddAreaToClass(extraLandID, classCenterIsland);
      rmAddAreaToClass(extraLandID, classGoldIsland);
      rmSetAreaCoherence(extraLandID, 0.55);
      rmSetAreaSmoothDistance(extraLandID, 20);
      rmSetAreaHeightBlend(extraLandID, 2);
      rmSetAreaBaseHeight(extraLandID, baseHeight);
      rmBuildArea(extraLandID);
   }

// Text
   rmSetStatusText("",0.30);

// Trade Route
   int tradeRouteID = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	if (directionChance == 1)
	{
  	   rmAddTradeRouteWaypoint(tradeRouteID, 0.5, 0.53);
	   rmAddTradeRouteWaypoint(tradeRouteID, 0.5, 0.3);
	}
	else if (directionChance == 2)
	{
  	   rmAddTradeRouteWaypoint(tradeRouteID, 0.5, 0.47);
	   rmAddTradeRouteWaypoint(tradeRouteID, 0.5, 0.7);
	}
	else if (directionChance == 0)
	{
  	   rmAddTradeRouteWaypoint(tradeRouteID, 0.5, 0.39);
	   rmAddTradeRouteWaypoint(tradeRouteID, 0.5, 0.61);
	}
   }
   else if (axisChance == 2) 
   {
	if (directionChance == 1)
	{
  	   rmAddTradeRouteWaypoint(tradeRouteID, 0.53, 0.5);
	   rmAddTradeRouteWaypoint(tradeRouteID, 0.3, 0.5);
	}
	else if (directionChance == 2)
	{
  	   rmAddTradeRouteWaypoint(tradeRouteID, 0.47, 0.5);
	   rmAddTradeRouteWaypoint(tradeRouteID, 0.7, 0.5);
	}
	else if (directionChance == 0)
	{
  	   rmAddTradeRouteWaypoint(tradeRouteID, 0.39, 0.5);
	   rmAddTradeRouteWaypoint(tradeRouteID, 0.61, 0.5);
	}
   }
   rmBuildTradeRoute(tradeRouteID, "carolinas\trade_route");	

// Trade sockets
   int socketID=rmCreateObjectDef("sockets to dock Trade Posts");
   rmAddObjectDefItem(socketID, "SocketTradeRoute", 1, 0.0);
   rmSetObjectDefAllowOverlap(socketID, true);
   rmAddObjectDefToClass(socketID, rmClassID("importantItem"));
   rmSetObjectDefMinDistance(socketID, 0.0);
   rmSetObjectDefMaxDistance(socketID, 6.0);

   // add the meeting poles along the trade route.
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID);
   vector socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.08);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   if(cNumberNonGaiaPlayers > 6)
   {
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.92);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

// Text
   rmSetStatusText("",0.35);

// Player Nuggets
   int playerNuggetID=rmCreateObjectDef("player nugget");
   rmAddObjectDefItem(playerNuggetID, "nugget", 1, 0.0);
   rmAddObjectDefToClass(playerNuggetID, rmClassID("nuggets"));
   rmSetObjectDefMinDistance(playerNuggetID, 35.0);
   rmSetObjectDefMaxDistance(playerNuggetID, 55.0);
   rmAddObjectDefConstraint(playerNuggetID, avoidStartingUnitsSmall);
   rmAddObjectDefConstraint(playerNuggetID, avoidTradeRoute);
   rmAddObjectDefConstraint(playerNuggetID, avoidSocket);
   rmAddObjectDefConstraint(playerNuggetID, avoidNugget);
   rmAddObjectDefConstraint(playerNuggetID, avoidNativesShort);
   rmAddObjectDefConstraint(playerNuggetID, circleConstraint);
   rmAddObjectDefConstraint(playerNuggetID, avoidWater10);

   for(i=1; <cNumberPlayers)
   {
 	rmSetNuggetDifficulty(1, 1);
	rmPlaceObjectDefAtLoc(playerNuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
 	rmSetNuggetDifficulty(2, 2);
	rmPlaceObjectDefAtLoc(playerNuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceGroupingAtLoc(villageAID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
   }

// Random Nuggets
   int nuggetID= rmCreateObjectDef("nugget"); 
   rmAddObjectDefItem(nuggetID, "Nugget", 1, 0.0);
   rmAddObjectDefToClass(nuggetID, rmClassID("nuggets"));
   rmSetObjectDefMinDistance(nuggetID, 0.0);
   rmSetObjectDefMaxDistance(nuggetID, rmXFractionToMeters(0.1));
   rmAddObjectDefConstraint(nuggetID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(nuggetID, avoidNugget);
   rmAddObjectDefConstraint(nuggetID, avoidStartingUnits);
   rmAddObjectDefConstraint(nuggetID, avoidTradeRoute);
   rmAddObjectDefConstraint(nuggetID, avoidSocket);
   rmAddObjectDefConstraint(nuggetID, avoidAll);
   rmAddObjectDefConstraint(nuggetID, farPlayerConstraint);
   rmAddObjectDefConstraint(nuggetID, circleConstraint);
   rmAddObjectDefConstraint(nuggetID, avoidWater10);

// Start area trees 
   int StartAreaTreeID=rmCreateObjectDef("starting trees");
   rmAddObjectDefItem(StartAreaTreeID, treeType, 1, 0.0);
   rmSetObjectDefMinDistance(StartAreaTreeID, 8);
   rmSetObjectDefMaxDistance(StartAreaTreeID, 12);
   rmAddObjectDefConstraint(StartAreaTreeID, avoidStartingUnitsSmall);
   rmAddObjectDefConstraint(StartAreaTreeID, avoidTradeRoute);
   rmAddObjectDefConstraint(StartAreaTreeID, avoidAll);
   rmPlaceObjectDefPerPlayer(StartAreaTreeID, false, 4);

// Mines
   int silverType = -1;
   silverType = rmRandInt(1,10);
   int playerGoldID=rmCreateObjectDef("player silver closer");
   rmAddObjectDefItem(playerGoldID, "mine", 1, 0.0);
   rmAddObjectDefToClass(playerGoldID, rmClassID("all mines"));
   rmAddObjectDefConstraint(playerGoldID, avoidTradeRoute);
   rmAddObjectDefConstraint(playerGoldID, avoidSocket);
   rmAddObjectDefConstraint(playerGoldID, coinAvoidCoin);
   rmAddObjectDefConstraint(playerGoldID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(playerGoldID, avoidAll);
   rmAddObjectDefConstraint(playerGoldID, avoidWater20);
   rmSetObjectDefMinDistance(playerGoldID, 18.0);
   rmSetObjectDefMaxDistance(playerGoldID, 23.0);
   rmPlaceObjectDefPerPlayer(playerGoldID, false, 1);

   silverType = rmRandInt(1,10);
   int GoldMediumID=rmCreateObjectDef("player silver med");
   rmAddObjectDefItem(GoldMediumID, "mine", 1, 0.0);
   rmAddObjectDefToClass(GoldMediumID, rmClassID("all mines"));
   rmAddObjectDefConstraint(GoldMediumID, avoidTradeRoute);
   rmAddObjectDefConstraint(GoldMediumID, avoidSocket);
   rmAddObjectDefConstraint(GoldMediumID, coinAvoidCoin);
   rmAddObjectDefConstraint(GoldMediumID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(GoldMediumID, avoidAll);
   rmAddObjectDefConstraint(GoldMediumID, avoidWater10);
   rmSetObjectDefMinDistance(GoldMediumID, 40.0);
   rmSetObjectDefMaxDistance(GoldMediumID, 55.0);
   rmPlaceObjectDefPerPlayer(GoldMediumID, false, 1);

   silverType = rmRandInt(1,10);
   int extraGoldID = rmCreateObjectDef("real gold mines");
   rmAddObjectDefItem(extraGoldID, "minegold", 1, 0.0);
   rmAddObjectDefToClass(extraGoldID, rmClassID("all mines"));
   rmAddObjectDefToClass(extraGoldID, rmClassID("importantItem"));
   rmAddObjectDefConstraint(extraGoldID, avoidTradeRoute);
   rmAddObjectDefConstraint(extraGoldID, avoidSocket);
   rmAddObjectDefConstraint(extraGoldID, longAvoidCoin);
   rmAddObjectDefConstraint(extraGoldID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(extraGoldID, avoidWater15);
   rmAddObjectDefConstraint(extraGoldID, avoidAll);
   rmSetObjectDefMinDistance(extraGoldID, 10.0);
   rmSetObjectDefMaxDistance(extraGoldID, 75.0);

   silverType = rmRandInt(1,10);
   int extraSilverID = rmCreateObjectDef("extra silver mines");
   rmAddObjectDefItem(extraSilverID, "mine", 1, 0.0);
   rmAddObjectDefToClass(extraSilverID, rmClassID("all mines"));
   rmAddObjectDefToClass(extraSilverID, rmClassID("importantItem"));
   rmAddObjectDefConstraint(extraSilverID, avoidTradeRoute);
   rmAddObjectDefConstraint(extraSilverID, avoidSocket);
   rmAddObjectDefConstraint(extraSilverID, longAvoidCoin);
   rmAddObjectDefConstraint(extraSilverID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(extraSilverID, avoidWater10);
   rmAddObjectDefConstraint(extraSilverID, avoidAll);
   rmSetObjectDefMinDistance(extraSilverID, 10.0);
   rmSetObjectDefMaxDistance(extraSilverID, 75.0);

// Berries
   int berryNum = rmRandInt(2,5);
   int StartBerryBushID=rmCreateObjectDef("starting berry bush");
   rmAddObjectDefItem(StartBerryBushID, "BerryBush", rmRandInt(2,4), 4.0);
   rmSetObjectDefMinDistance(StartBerryBushID, 10.0);
   rmSetObjectDefMaxDistance(StartBerryBushID, 16.0);
   rmAddObjectDefConstraint(StartBerryBushID, avoidStartingUnitsSmall);
   rmAddObjectDefConstraint(StartBerryBushID, avoidAll);
   if (placeBerries == 1)
      rmPlaceObjectDefPerPlayer(StartBerryBushID, false, 1);
   if (tropical == 1)
      rmPlaceObjectDefPerPlayer(StartBerryBushID, false, 1);

// Start area huntable
   int deerNum = rmRandInt(4, 6);
   int startPronghornID=rmCreateObjectDef("starting pronghorn");
   rmAddObjectDefItem(startPronghornID, deerType, deerNum, 4.0);
   rmAddObjectDefToClass(startPronghornID, rmClassID("huntableFood"));
   rmSetObjectDefMinDistance(startPronghornID, 16);
   rmSetObjectDefMaxDistance(startPronghornID, 22);
   rmAddObjectDefConstraint(startPronghornID, avoidStartResource);
   rmAddObjectDefConstraint(startPronghornID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(startPronghornID, avoidAll);
   rmSetObjectDefCreateHerd(startPronghornID, true);
   rmPlaceObjectDefPerPlayer(startPronghornID, false, 1);

// Extra tree clumps near players - to ensure fair access to wood
   int extraTreesID=rmCreateObjectDef("extra trees");
   rmAddObjectDefItem(extraTreesID, treeType, 7, 7.0);
   rmSetObjectDefMinDistance(extraTreesID, 16);
   rmSetObjectDefMaxDistance(extraTreesID, 20);
   rmAddObjectDefConstraint(extraTreesID, avoidAll);
   rmAddObjectDefConstraint(extraTreesID, avoidCoin);
   rmAddObjectDefConstraint(extraTreesID, avoidSocket);
   rmAddObjectDefConstraint(extraTreesID, avoidTradeRoute);
   rmPlaceObjectDefPerPlayer(extraTreesID, false, 2);

// Second huntable
   int deer2Num = rmRandInt(4, 7);
   int farPronghornID=rmCreateObjectDef("far pronghorn");
   rmAddObjectDefItem(farPronghornID, deer2Type, deer2Num, 4.0);
   rmAddObjectDefToClass(farPronghornID, rmClassID("huntableFood"));
   rmSetObjectDefMinDistance(farPronghornID, 42.0);
   rmSetObjectDefMaxDistance(farPronghornID, 65.0);
   rmAddObjectDefConstraint(farPronghornID, avoidStartResource);
   rmAddObjectDefConstraint(farPronghornID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(farPronghornID, avoidNativesShort);
   rmAddObjectDefConstraint(farPronghornID, huntableConstraint);
   rmAddObjectDefConstraint(farPronghornID, avoidAll);
   rmSetObjectDefCreateHerd(farPronghornID, true);
   rmPlaceObjectDefPerPlayer(farPronghornID, false, 1);

// Random trees
   int randomTreeID=rmCreateObjectDef("random tree");
   rmAddObjectDefItem(randomTreeID, treeType, 1, 0.0);
   rmSetObjectDefMinDistance(randomTreeID, 8);
   rmSetObjectDefMaxDistance(randomTreeID, 15);
   rmAddObjectDefConstraint(randomTreeID, avoidStartingUnitsSmall);
   rmAddObjectDefConstraint(randomTreeID, avoidTradeRoute);
   rmAddObjectDefConstraint(randomTreeID, avoidAll);
   rmAddObjectDefConstraint(randomTreeID, avoidWater10);
   for(i=1; <cNumberPlayers)
   {
      rmPlaceObjectDefInArea(randomTreeID, 0, rmAreaID("Player"+i), 6);
   }

// Sheep etc
   int sheepID=rmCreateObjectDef("herdable animal");
   rmAddObjectDefItem(sheepID, sheepType, 2, 4.0);
   rmAddObjectDefToClass(sheepID, rmClassID("herdableFood"));
   rmSetObjectDefMinDistance(sheepID, 35.0);
   rmSetObjectDefMaxDistance(sheepID, 70.0);
   rmAddObjectDefConstraint(sheepID, avoidSheep);
   rmAddObjectDefConstraint(sheepID, avoidAll);
   rmAddObjectDefConstraint(sheepID, avoidImpassableLand);
   if (sheepChance > 0)
   {
      for(i=1; <cNumberPlayers)
	{
         rmPlaceObjectDefInArea(sheepID, 0, rmAreaID("player"+i), 2);
	}
   }

// Big island huntable
   deer2Num = rmRandInt(4, 7);
   int huntableID=rmCreateObjectDef("huntable 1");
   rmAddObjectDefItem(huntableID, centerHerdType, deer2Num, 5.0);
   rmAddObjectDefToClass(huntableID, rmClassID("huntableFood"));
   rmSetObjectDefMinDistance(huntableID, 42.0);
   rmSetObjectDefMaxDistance(huntableID, 65.0);
   rmAddObjectDefConstraint(huntableID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(huntableID, avoidNativesShort);
   rmAddObjectDefConstraint(huntableID, huntableConstraint);
   rmAddObjectDefConstraint(huntableID, avoidAll);
   rmSetObjectDefCreateHerd(huntableID, true);

// More island animals
   int centralHerdID=rmCreateObjectDef("central herd");  
   rmAddObjectDefItem(centralHerdID, centerHerdType, rmRandInt(2,3), 4.0);
   rmAddObjectDefToClass(centralHerdID, rmClassID("huntableFood"));
   rmSetObjectDefMinDistance(centralHerdID, 0);
   rmSetObjectDefMaxDistance(centralHerdID, rmXFractionToMeters(0.1));
   rmAddObjectDefConstraint(centralHerdID, avoidTradeRoute);
   rmAddObjectDefConstraint(centralHerdID, avoidImportantItem);
   rmAddObjectDefConstraint(centralHerdID, avoidWater10);
   rmAddObjectDefConstraint(centralHerdID, longPlayerConstraint);
   rmAddObjectDefConstraint(centralHerdID, huntableConstraint);

// Big island objects placement
   if (cNumberNonGaiaPlayers > 3)
      rmPlaceGroupingInArea(villageDID, 0, rmAreaID("big island"), 1);

   rmPlaceObjectDefInArea(extraGoldID, 0, rmAreaID("big island"), 1);

   rmPlaceObjectDefInArea(huntableID, 0, rmAreaID("big island"), 2);

   rmSetNuggetDifficulty(3, 3);
   rmPlaceObjectDefInArea(nuggetID, 0, rmAreaID("big island"), 1);
   rmSetNuggetDifficulty(4, 4);
   rmPlaceObjectDefInArea(nuggetID, 0, rmAreaID("big island"), 1);
     
   rmPlaceObjectDefInArea(centralHerdID, 0, rmAreaID("big island"), 1);

   rmPlaceObjectDefInArea(randomTreeID, 0, rmAreaID("big island"), 7);

// Text
   rmSetStatusText("",0.40);

// Native Islands 
   int chanceSetup = 0;
   int constraintChance4 = 0;

   int nativeIsland1ID=rmCreateArea("native island 1");
   rmSetAreaSize(nativeIsland1ID, rmAreaTilesToFraction(2500 + cNumberNonGaiaPlayers*200), rmAreaTilesToFraction(3000 + cNumberNonGaiaPlayers*220));
   rmSetAreaMix(nativeIsland1ID, baseType);
   rmAddAreaConstraint(nativeIsland1ID, settlementIslandConstraint);
   rmAddAreaConstraint(nativeIsland1ID, centerIslandConstraint);
   rmAddAreaConstraint(nativeIsland1ID, circleEdgeConstraint);
   rmAddAreaConstraint(nativeIsland1ID, playerConstraint); 
   rmAddAreaConstraint(nativeIsland1ID, nativeIslandConstraintLarge);
   rmAddAreaConstraint(nativeIsland1ID, centerIslandConstraint);
   rmAddAreaToClass(nativeIsland1ID, classSettlementIsland);
   rmAddAreaToClass(nativeIsland1ID, classNativeIsland);
   rmAddAreaToClass(nativeIsland1ID, classGoldIsland);
   rmSetAreaCoherence(nativeIsland1ID, 0.35);
   rmSetAreaSmoothDistance(nativeIsland1ID, 12);
   rmSetAreaHeightBlend(nativeIsland1ID, 2);
   rmSetAreaBaseHeight(nativeIsland1ID, baseHeight);
   rmBuildArea(nativeIsland1ID);

   int nativeIsland2ID=rmCreateArea("native island 2");
   rmSetAreaSize(nativeIsland2ID, rmAreaTilesToFraction(2500 + cNumberNonGaiaPlayers*150), rmAreaTilesToFraction(3000 + cNumberNonGaiaPlayers*200));
   rmSetAreaMix(nativeIsland2ID, baseType);
   rmAddAreaConstraint(nativeIsland2ID, settlementIslandConstraint);
   rmAddAreaConstraint(nativeIsland2ID, centerIslandConstraint);
   rmAddAreaConstraint(nativeIsland2ID, playerConstraint);
   rmAddAreaConstraint(nativeIsland2ID, nativeIslandConstraintLarge); 
   rmAddAreaConstraint(nativeIsland2ID, circleEdgeConstraint);
   rmAddAreaConstraint(nativeIsland2ID, centerIslandConstraint);
   rmAddAreaToClass(nativeIsland2ID, classSettlementIsland);
   rmAddAreaToClass(nativeIsland2ID, classNativeIsland);
   rmAddAreaToClass(nativeIsland2ID, classGoldIsland);
   rmSetAreaCoherence(nativeIsland2ID, 0.4);
   rmSetAreaSmoothDistance(nativeIsland2ID, 12);
   rmSetAreaHeightBlend(nativeIsland2ID, 2);
   rmSetAreaBaseHeight(nativeIsland2ID, baseHeight);
   rmBuildArea(nativeIsland2ID);

// Native Island Objects placement
   rmPlaceGroupingInArea(villageDID, 0, rmAreaID("native island 1"), 1);
   rmPlaceGroupingInArea(villageDID, 0, rmAreaID("native island 2"), 1);
   rmPlaceObjectDefInArea(centralHerdID, 0, rmAreaID("native island 1"), 1);
   rmPlaceObjectDefInArea(centralHerdID, 0, rmAreaID("native island 2"), 1);

// Text
   rmSetStatusText("",0.45);
     
// More Islands - may merge with big island or each other
   int numIslands = cNumberNonGaiaPlayers - 1;
   if (cNumberNonGaiaPlayers > 4)
      numIslands = cNumberNonGaiaPlayers - 2;
   if (cNumberNonGaiaPlayers > 7)
      numIslands = cNumberNonGaiaPlayers - 3;

   for(i=0; <numIslands)
   {
      int settlementIslandID=rmCreateArea("settlement island"+i);
      rmSetAreaSize(settlementIslandID, rmAreaTilesToFraction(2500 + cNumberNonGaiaPlayers*150), rmAreaTilesToFraction(3000 + cNumberNonGaiaPlayers*200));
      rmSetAreaMix(settlementIslandID, baseType);
      rmSetAreaWarnFailure(settlementIslandID, false);

      constraintChance4 = rmRandFloat(0.0,1.0);
	if (cNumberNonGaiaPlayers < 5)
	{
         if (constraintChance4 > 0.5)
            rmAddAreaConstraint(settlementIslandID, settlementIslandConstraint);
	}
	else 	if (cNumberNonGaiaPlayers < 7)
	{
         if (constraintChance4 > 0.5)
            rmAddAreaConstraint(settlementIslandID, settlementIslandConstraint); 
	}
	else 	
	{
         if (constraintChance4 > 0.3)
            rmAddAreaConstraint(settlementIslandID, settlementIslandConstraint); 
	}

      chanceSetup = rmRandFloat(0.0,1.0);
	if (cNumberNonGaiaPlayers < 5)
	{
         if (chanceSetup < 0.4)
            rmAddAreaConstraint(settlementIslandID, centerIslandConstraint);
	}
	else if (cNumberNonGaiaPlayers < 7)
	{
         if (chanceSetup < 0.6)
            rmAddAreaConstraint(settlementIslandID, centerIslandConstraint);
	}
	else 
	{	
         if (chanceSetup < 0.7)
            rmAddAreaConstraint(settlementIslandID, centerIslandConstraint);
	}

      rmAddAreaConstraint(settlementIslandID, playerConstraint); 
      rmAddAreaConstraint(settlementIslandID, circleEdgeConstraint);
	if (rmRandInt(1,3) > 1)
         rmAddAreaConstraint(nativeIsland1ID, nativeIslandConstraint);
      rmAddAreaToClass(settlementIslandID, classSettlementIsland);
      rmAddAreaToClass(settlementIslandID, classGoldIsland);
      rmSetAreaCoherence(settlementIslandID, 0.35);
      rmSetAreaSmoothDistance(settlementIslandID, 12);
      rmSetAreaHeightBlend(settlementIslandID, 2);
      rmSetAreaBaseHeight(settlementIslandID, baseHeight);
      rmBuildArea(settlementIslandID);
	
   // Settlement Island Objects placement
	if (cNumberNonGaiaPlayers > 5)
	{
         if (chanceSetup < 0.7)
            rmPlaceGroupingInArea(villageDID, 0, rmAreaID("settlement island"+i), 1);
	   else
	   {
            if (rmRandInt(1,4) == 1)
               rmPlaceGroupingInArea(villageDID, 0, rmAreaID("settlement island"+i), 1);
	   }
	}
      rmSetNuggetDifficulty(3, 3);
      rmPlaceObjectDefInArea(nuggetID, 0, rmAreaID("settlement island"+i), 1);
      rmPlaceObjectDefInArea(randomTreeID, 0, rmAreaID("settlement island"+i), 4);
      if (rmRandInt(1,4) > 1)
         rmPlaceObjectDefInArea(centralHerdID, 0, rmAreaID("settlement island"+i), 1);
   }

// Text
   rmSetStatusText("",0.50);

// Bonus Resource Islands - can merge with other extra islands.
   int bonusCount=cNumberNonGaiaPlayers + 2;  // num players plus some extra
   if (cNumberNonGaiaPlayers > 5)
      bonusCount=cNumberNonGaiaPlayers + 1;
  
   for(i=0; <bonusCount)
   {
      int bonusIslandID=rmCreateArea("bonus island"+i);
      rmSetAreaSize(bonusIslandID, rmAreaTilesToFraction(1800 + cNumberNonGaiaPlayers*150), rmAreaTilesToFraction(2000 + cNumberNonGaiaPlayers*200));
      rmSetAreaMix(bonusIslandID, baseType);
      rmSetAreaWarnFailure(bonusIslandID, false);
      rmAddAreaConstraint(bonusIslandID, circleEdgeConstraint);
      if (rmRandInt(1,3) == 1)
        rmAddAreaConstraint(bonusIslandID, settlementIslandConstraint); 
	if (cNumberNonGaiaPlayers > 5)
	{
         if (rmRandInt(1,10) > 4)
            rmAddAreaConstraint(bonusIslandID, centerIslandConstraint);
	}
	else
	{
         if (rmRandInt(1,2) > 1)
            rmAddAreaConstraint(bonusIslandID, centerIslandConstraint);
	}
      if (rmRandInt(1,2) == 1)
         rmAddAreaConstraint(bonusIslandID, nativeIslandConstraint);
      rmAddAreaConstraint(bonusIslandID, secondPlayerConstraint); 
      rmAddAreaToClass(bonusIslandID, classBonusIsland);
      rmAddAreaToClass(bonusIslandID, classGoldIsland);
      rmSetAreaCoherence(bonusIslandID, 0.55);
      rmSetAreaSmoothDistance(bonusIslandID, 20);
      rmSetAreaHeightBlend(bonusIslandID, 2);
      rmSetAreaBaseHeight(bonusIslandID, baseHeight);

      // Island avoidance determination
      randomIslandChance=rmRandFloat(0.0, 1.0);
      if(randomIslandChance < 0.33)
      {
         rmAddAreaToClass(bonusIslandID, islandsX);
         rmAddAreaConstraint(bonusIslandID, islandsXvsY);
         rmAddAreaConstraint(bonusIslandID, islandsXYvsZ);
      }
      else if(randomIslandChance < 0.66)        
      {
         rmAddAreaToClass(bonusIslandID, islandsY);
         rmAddAreaConstraint(bonusIslandID, islandsYvsX);
         rmAddAreaConstraint(bonusIslandID, islandsXYvsZ);
      }
      else
      {
         rmAddAreaToClass(bonusIslandID, islandsZ);
         rmAddAreaConstraint(bonusIslandID, islandsZvsX);
         rmAddAreaConstraint(bonusIslandID, islandsZvsY); 
      }
      rmBuildArea(bonusIslandID);

	// Bonus Island Objects
      rmPlaceObjectDefInArea(centralHerdID, 0, rmAreaID("bonus island"+i), 1);
      if (rmRandInt(1,3) == 1)
	{
         rmSetNuggetDifficulty(2, 3);
         rmPlaceObjectDefInArea(nuggetID, 0, rmAreaID("bonus island"+i), 1);
	}
      rmPlaceObjectDefInArea(randomTreeID, 0, rmAreaID("bonus island"+i), 3);
   }

// Text
   rmSetStatusText("",0.55);

// Various Island Objects
   rmPlaceObjectDefInRandomAreaOfClass(extraGoldID, 0, classSettlementIsland, 1);
   if (cNumberNonGaiaPlayers > 3)
      rmPlaceObjectDefInRandomAreaOfClass(extraGoldID, 0, classBonusIsland, 1);
   rmPlaceObjectDefInRandomAreaOfClass(extraGoldID, 0, classGoldIsland, 1);
   rmPlaceObjectDefInRandomAreaOfClass(extraSilverID, 0, classGoldIsland, 1);
   rmPlaceObjectDefInRandomAreaOfClass(extraSilverID, 0, classGoldIsland, 1);
   if (cNumberNonGaiaPlayers > 4)
      rmPlaceObjectDefInRandomAreaOfClass(extraSilverID, 0, classGoldIsland, 1);
   if (cNumberNonGaiaPlayers > 6)
      rmPlaceObjectDefInRandomAreaOfClass(extraSilverID, 0, classGoldIsland, 1);

// Forests
// Large player forests.
   int failCount = 0;
   for(i=1; <cNumberPlayers)
   {
      failCount=0;
      int forestID=rmCreateArea("player"+i+"forest", rmAreaID("player"+i));
      rmSetAreaSize(forestID, rmAreaTilesToFraction(270), rmAreaTilesToFraction(290));
      rmSetAreaWarnFailure(forestID, false);
      rmSetAreaForestType(forestID, forestType);
      rmSetAreaForestDensity(forestID, rmRandFloat(0.7, 1.0));
      rmSetAreaForestClumpiness(forestID, rmRandFloat(0.5, 0.9));
      rmSetAreaForestUnderbrush(forestID, rmRandFloat(0.0, 0.5));
      rmSetAreaCoherence(forestID, rmRandFloat(0.5, 0.8));
      rmAddAreaConstraint(forestID, avoidStartingUnits);
      rmAddAreaConstraint(forestID, avoidNativesShort);
      rmAddAreaConstraint(forestID, avoidWater10);
      rmAddAreaConstraint(forestID, avoidAll);
      rmAddAreaConstraint(forestID, forestConstraint);
      rmAddAreaConstraint(forestID, shortAvoidImpassableLand);
      rmAddAreaToClass(forestID, rmClassID("classForest")); 
      rmSetAreaMinBlobs(forestID, 1);
      rmSetAreaMaxBlobs(forestID, 3);
      rmSetAreaMinBlobDistance(forestID, 10.0);
      rmSetAreaMaxBlobDistance(forestID, 15.0);
      rmSetAreaSmoothDistance(forestID, rmRandInt(10,20));
      rmSetAreaBaseHeight(forestID, rmRandFloat(3.0, 4.0));
      rmSetAreaHeightBlend(forestID, 1);
      if(rmBuildArea(forestID)==false)
      {
         // Stop trying once we fail 3 times in a row.
         failCount++;
         if(failCount==3)
            break;
      }
      else
         failCount=0;
   }

   for(j=0; <2)   
   {
      for(k=1; <cNumberPlayers)
      {
         failCount=0;
         forestID=rmCreateArea(("another player"+k+"forest"+j), rmAreaID("player"+k));
         rmSetAreaSize(forestID, rmAreaTilesToFraction(200), rmAreaTilesToFraction(230));
         rmSetAreaWarnFailure(forestID, false);
         rmSetAreaForestType(forestID, forestType);
         rmSetAreaForestDensity(forestID, rmRandFloat(0.7, 1.0));
         rmSetAreaForestClumpiness(forestID, rmRandFloat(0.5, 0.9));
         rmSetAreaForestUnderbrush(forestID, rmRandFloat(0.0, 0.5));
         rmSetAreaCoherence(forestID, rmRandFloat(0.4, 0.7));
         rmAddAreaConstraint(forestID, avoidStartingUnits);
         rmAddAreaConstraint(forestID, avoidNativesShort);
         rmAddAreaConstraint(forestID, avoidWater10);
         rmAddAreaConstraint(forestID, avoidAll);
         rmAddAreaConstraint(forestID, forestConstraint);
         rmAddAreaConstraint(forestID, shortAvoidImpassableLand);
         rmAddAreaToClass(forestID, rmClassID("classForest")); 
         rmSetAreaMinBlobs(forestID, 1);
         rmSetAreaMaxBlobs(forestID, 3);
         rmSetAreaMinBlobDistance(forestID, 12.0);
         rmSetAreaMaxBlobDistance(forestID, 25.0);
         rmSetAreaSmoothDistance(forestID, rmRandInt(10,20));
         rmSetAreaBaseHeight(forestID, rmRandFloat(3.0, 4.0));
         rmSetAreaHeightBlend(forestID, 1);
         if(rmBuildArea(forestID)==false)
         {
            // Stop trying once we fail 3 times in a row.
            failCount++;
            if(failCount==3)
               break;
         }
         else
            failCount=0;
      }
   }

// Text
   rmSetStatusText("",0.60);

// Smaller player forests
   int forestCount=rmRandInt(7, 8);   
   for(i=1; <cNumberPlayers)
   {
      failCount=0;
      for(j=0; <forestCount)
      {
         forestID=rmCreateArea("player"+i+"forest"+j, rmAreaID("player"+i));
         rmSetAreaSize(forestID, rmAreaTilesToFraction(150), rmAreaTilesToFraction(180));
         rmSetAreaWarnFailure(forestID, false);
         rmSetAreaForestType(forestID, forestType);
         rmSetAreaForestDensity(forestID, rmRandFloat(0.7, 1.0));
         rmSetAreaForestClumpiness(forestID, rmRandFloat(0.5, 0.9));
         rmSetAreaForestUnderbrush(forestID, rmRandFloat(0.0, 0.5));
         rmSetAreaCoherence(forestID, rmRandFloat(0.4, 0.7));
         rmAddAreaConstraint(forestID, avoidStartingUnits);
         rmAddAreaConstraint(forestID, avoidNativesShort);
         rmAddAreaConstraint(forestID, avoidAll);
         rmAddAreaConstraint(forestID, avoidWater10);
         rmAddAreaConstraint(forestID, forestConstraint);
         rmAddAreaConstraint(forestID, shortAvoidImpassableLand);
         rmAddAreaToClass(forestID, rmClassID("classForest")); 
         rmSetAreaMinBlobs(forestID, 1);
         rmSetAreaMaxBlobs(forestID, 3);
         rmSetAreaMinBlobDistance(forestID, 8.0);
         rmSetAreaMaxBlobDistance(forestID, 12.0);
	   rmSetAreaSmoothDistance(forestID, rmRandInt(10,20));
         if(rmBuildArea(forestID)==false)
         {
            // Stop trying once we fail 3 times in a row.
            failCount++;
            if(failCount==3)
               break;
         }
         else
            failCount=0;
      }
   }

// Big island forests
   int forestNo = rmRandInt(6,7);
   if (cNumberNonGaiaPlayers > 5)
     forestNo = rmRandInt(9,10);
   else if (cNumberNonGaiaPlayers > 3)
     forestNo = rmRandInt(7,8);

   for(i=0; < forestNo)
   {
         forestID=rmCreateArea("big island forest"+i, rmAreaID("big island"));
         rmAddAreaToClass(forestID, rmClassID("classForest")); 
         rmSetAreaSize(forestID, rmAreaTilesToFraction(145), rmAreaTilesToFraction(175));
         rmSetAreaWarnFailure(forestID, false);
         rmSetAreaForestType(forestID, forestType);
         rmSetAreaForestDensity(forestID, rmRandFloat(0.7, 1.0));
         rmSetAreaForestClumpiness(forestID, rmRandFloat(0.5, 0.9));
         rmSetAreaForestUnderbrush(forestID, rmRandFloat(0.0, 0.5));
         rmSetAreaCoherence(forestID, rmRandFloat(0.4, 0.7));
         rmAddAreaConstraint(forestID, avoidAll);
         rmAddAreaConstraint(forestID, avoidWater10);
         rmAddAreaConstraint(forestID, forestConstraint2);
         rmAddAreaConstraint(forestID, avoidTradeRoute);
         rmAddAreaConstraint(forestID, avoidSocket);
         rmAddAreaConstraint(forestID, avoidNativesShort);
         rmAddAreaConstraint(forestID, shortAvoidImpassableLand); 
         if(rmRandFloat(0.0, 1.0)<0.4)
            rmSetAreaBaseHeight(forestID, rmRandFloat(3.0, 4.0)); 
         rmBuildArea(forestID);
   }

// Text
   rmSetStatusText("",0.65);

// Settlement island forests
   for(i=0; <numIslands)
   {
      forestCount=rmRandInt(3, 4);
      for(j=0; <forestCount)
      {
         forestID=rmCreateArea("settlement island"+i+"forest"+j, rmAreaID("settlement island"+i));
         rmAddAreaToClass(forestID, rmClassID("classForest")); 
         rmSetAreaSize(forestID, rmAreaTilesToFraction(150), rmAreaTilesToFraction(200));
         rmSetAreaWarnFailure(forestID, false);
         rmSetAreaForestType(forestID, forestType);
         rmSetAreaForestDensity(forestID, rmRandFloat(0.7, 1.0));
         rmSetAreaForestClumpiness(forestID, rmRandFloat(0.5, 0.9));
         rmSetAreaForestUnderbrush(forestID, rmRandFloat(0.0, 0.5));
         rmSetAreaCoherence(forestID, rmRandFloat(0.4, 0.7));
         rmAddAreaConstraint(forestID, avoidAll);
         rmAddAreaConstraint(forestID, avoidWater10);
         rmAddAreaConstraint(forestID, forestConstraint2);
         rmAddAreaConstraint(forestID, avoidTradeRoute);
         rmAddAreaConstraint(forestID, avoidSocket);
         rmAddAreaConstraint(forestID, avoidNativesShort);
         rmAddAreaConstraint(forestID, shortAvoidImpassableLand); 
         rmBuildArea(forestID);
      }
   }

// Text
   rmSetStatusText("",0.70);

// Native island forests
   int natForest = rmRandInt(3,4);
      for(i=0; < natForest)
      {
         forestID=rmCreateArea("native island 1 forest"+i, rmAreaID("native island 1"));
         rmAddAreaToClass(forestID, rmClassID("classForest"));  
         rmSetAreaSize(forestID, rmAreaTilesToFraction(150), rmAreaTilesToFraction(180));
         rmSetAreaWarnFailure(forestID, false);
         rmSetAreaForestType(forestID, forestType);
         rmSetAreaForestDensity(forestID, rmRandFloat(0.7, 1.0));
         rmSetAreaForestClumpiness(forestID, rmRandFloat(0.5, 0.9));
         rmSetAreaForestUnderbrush(forestID, rmRandFloat(0.0, 0.5));
         rmSetAreaCoherence(forestID, rmRandFloat(0.4, 0.7));
         rmAddAreaConstraint(forestID, avoidNativesShort);
         rmAddAreaConstraint(forestID, avoidAll);
         rmAddAreaConstraint(forestID, avoidWater10);
         rmAddAreaConstraint(forestID, forestConstraint2);
         rmAddAreaConstraint(forestID, shortAvoidImpassableLand);
         rmBuildArea(forestID);
      }

      for(i=0; < natForest)
      {
         forestID=rmCreateArea("native island 2 forest"+i, rmAreaID("native island 2")); 
         rmAddAreaToClass(forestID, rmClassID("classForest")); 
         rmSetAreaSize(forestID, rmAreaTilesToFraction(150), rmAreaTilesToFraction(180));
         rmSetAreaWarnFailure(forestID, false);
         rmSetAreaForestType(forestID, forestType);
         rmSetAreaForestDensity(forestID, rmRandFloat(0.7, 1.0));
         rmSetAreaForestClumpiness(forestID, rmRandFloat(0.5, 0.9));
         rmSetAreaForestUnderbrush(forestID, rmRandFloat(0.0, 0.5));
         rmSetAreaCoherence(forestID, rmRandFloat(0.4, 0.7));
         rmAddAreaConstraint(forestID, avoidNativesShort);
         rmAddAreaConstraint(forestID, avoidAll);
         rmAddAreaConstraint(forestID, avoidWater10);
         rmAddAreaConstraint(forestID, forestConstraint2);
         rmAddAreaConstraint(forestID, shortAvoidImpassableLand);
         rmBuildArea(forestID);
      }
      rmPlaceObjectDefInArea(randomTreeID, 0, rmAreaID("native island 1"), 3);
      rmPlaceObjectDefInArea(randomTreeID, 0, rmAreaID("native island 2"), 3);

// Text
   rmSetStatusText("",0.75);

// Bonus island forests.
   for(i=0; <bonusCount)
   {
      forestCount=rmRandInt(2, 3);
      for(j=0; <forestCount)
      {
         int bonusForestID=rmCreateArea("bonus"+i+"forest"+j, rmAreaID("bonus island"+i));
         rmAddAreaToClass(bonusForestID, rmClassID("classForest"));  
	   rmSetAreaSize(bonusForestID, rmAreaTilesToFraction(150), rmAreaTilesToFraction(200));
         rmSetAreaWarnFailure(bonusForestID, false);
         rmSetAreaForestType(bonusForestID, forestType);
         rmSetAreaForestDensity(bonusForestID, rmRandFloat(0.7, 1.0));
         rmSetAreaForestClumpiness(bonusForestID, rmRandFloat(0.5, 0.9));
         rmSetAreaForestUnderbrush(bonusForestID, rmRandFloat(0.0, 0.5));
         rmSetAreaCoherence(bonusForestID, rmRandFloat(0.4, 0.7));
         rmAddAreaConstraint(bonusForestID, avoidNativesShort);
         rmAddAreaConstraint(bonusForestID, avoidAll);
         rmAddAreaConstraint(bonusForestID, forestConstraint2);
         rmAddAreaConstraint(bonusForestID, avoidTradeRoute);
         rmAddAreaConstraint(bonusForestID, avoidSocket);
         rmAddAreaConstraint(bonusForestID, shortAvoidImpassableLand);
         rmBuildArea(bonusForestID);
      }
   }

// Text
   rmSetStatusText("",0.80);

// Bonus island trees 
   int bonusIsTreesID=rmCreateObjectDef("bonus island trees");
   rmAddObjectDefItem(bonusIsTreesID, treeType, 7, 10.0);
   rmSetObjectDefMinDistance(bonusIsTreesID, 0);
   rmSetObjectDefMaxDistance(bonusIsTreesID, 35);
   rmAddObjectDefConstraint(bonusIsTreesID, avoidAll);
   rmAddObjectDefConstraint(bonusIsTreesID, avoidWater10);
   rmAddObjectDefConstraint(bonusIsTreesID, avoidCoin);
   rmAddObjectDefConstraint(bonusIsTreesID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(bonusIsTreesID, avoidTradeRoute);

   for(i=0; <bonusCount)
      rmPlaceObjectDefInArea(bonusIsTreesID, 0, rmAreaID("bonus island"+i), 2);

   for(i=0; <extraCount)
   {
      rmPlaceObjectDefInArea(bonusIsTreesID, 0, rmAreaID("extraland"+i), 1);
   }

// Text
   rmSetStatusText("",0.85);

// Water Flag
   int waterFlagID=-1;
   for(i=1; <cNumberPlayers)
   {
      rmClearClosestPointConstraints();
      waterFlagID=rmCreateObjectDef("HC water flag "+i);
      rmAddObjectDefItem(waterFlagID, "HomeCityWaterSpawnFlag", 1, 5.0);
      rmAddClosestPointConstraint(flagEdgeConstraint);
      rmAddClosestPointConstraint(flagVsFlag);
      rmAddClosestPointConstraint(flagLand);
      vector TCLocation = rmGetUnitPosition(rmGetUnitPlacedOfPlayer(startingTCID, i));
      vector closestPoint = rmFindClosestPointVector(TCLocation, rmXFractionToMeters(1.0));
      rmPlaceObjectDefAtLoc(waterFlagID, i, rmXMetersToFraction(xsVectorGetX(closestPoint)), rmZMetersToFraction(xsVectorGetZ(closestPoint)));
      rmClearClosestPointConstraints();
   }

// Text
   rmSetStatusText("",0.90);

// Fish
   int fishVsFishID=rmCreateClassDistanceConstraint("fish v fish", rmClassID("classFish"), 24.0);
   int fishLand = rmCreateTerrainDistanceConstraint("fish land", "land", true, 5.0);
   int fishID=rmCreateObjectDef("fish");
   rmAddObjectDefItem(fishID, fishType, 2, 5.0);
   rmAddObjectDefToClass(fishID, rmClassID("classFish"));
   rmSetObjectDefMinDistance(fishID, 0.0);
   rmSetObjectDefMaxDistance(fishID, rmXFractionToMeters(1.0));
   rmAddObjectDefConstraint(fishID, fishVsFishID);
   rmAddObjectDefConstraint(fishID, fishLand);
   if (cNumberNonGaiaPlayers < 4)
      rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*12);
   else if (cNumberNonGaiaPlayers < 6)
      rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*10);
   else
      rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*9);

   int fish2ID=rmCreateObjectDef("second type fish");
   int fishLand2 = rmCreateTerrainDistanceConstraint("second fish land", "land", true, 3.0);
   rmAddObjectDefItem(fish2ID, fish2Type, 1, 5.0);
   rmAddObjectDefToClass(fish2ID, rmClassID("classFish"));
   rmSetObjectDefMinDistance(fish2ID, 0.0);
   rmSetObjectDefMaxDistance(fish2ID, rmXFractionToMeters(1.0));
   rmAddObjectDefConstraint(fish2ID, fishVsFishID);
   rmAddObjectDefConstraint(fish2ID, fishLand2);
   if (cNumberNonGaiaPlayers < 4)
      rmPlaceObjectDefAtLoc(fish2ID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*16);
   else if (cNumberNonGaiaPlayers < 6)
      rmPlaceObjectDefAtLoc(fish2ID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*14);
   else if (cNumberNonGaiaPlayers == 6)
      rmPlaceObjectDefAtLoc(fish2ID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*13);
   else
      rmPlaceObjectDefAtLoc(fish2ID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*12);

// Text
   rmSetStatusText("",0.95);

// Whales
   int whaleID=rmCreateObjectDef("whale");
   int whaleLand = rmCreateTerrainDistanceConstraint("whale v. land", "land", true, 16.0);
   int whaleVsWhaleID=rmCreateTypeDistanceConstraint("whale v whale", whaleType, 90.0);
   rmAddObjectDefItem(whaleID, whaleType, 1, 5.0);
   rmSetObjectDefMinDistance(whaleID, 0.0);
   rmSetObjectDefMaxDistance(whaleID, rmXFractionToMeters(1.0));
   rmAddObjectDefConstraint(whaleID, whaleVsWhaleID);
   rmAddObjectDefConstraint(whaleID, whaleLand);
   if (cNumberNonGaiaPlayers < 4)
      rmPlaceObjectDefAtLoc(whaleID, 0, 0.5, 0.5, 7*cNumberNonGaiaPlayers);
   else if (cNumberNonGaiaPlayers == 4)
      rmPlaceObjectDefAtLoc(whaleID, 0, 0.5, 0.5, 6*cNumberNonGaiaPlayers);
   else
      rmPlaceObjectDefAtLoc(whaleID, 0, 0.5, 0.5, 5*cNumberNonGaiaPlayers);

// Text
   rmSetStatusText("",0.99);

}  
