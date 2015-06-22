// Gandalf's Giant RLM
// a random map for AOE3
// by RF_Gandalf

include "mercenaries.xs";

void main(void)
{  
   // Text
   rmSetStatusText("",0.01);

// Set up for variables
   string baseType = "";
   string pondType = "";
   string cliffType = "";
   string forestType = "";
   string riverType = "";
   string treeType = "";
   string deerType = "";
   string deer2Type = "";
   string sheepType = "";
   string centerHerdType = "";
   string fishType = "";

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
   int patternChance = rmRandInt(1,20);   
   int variantChance = rmRandInt(1,2);
   int lightingChance = rmRandInt(1,2);
   int axisChance = rmRandInt(1,2);
   int playerSide = rmRandInt(1,2);   
   int positionChance = rmRandInt(1,2);   
   int distChance = rmRandInt(0,9);
   int sectionChance = rmRandInt(1,3);
   int ffaChance = rmRandInt(1,4);
   int trPattern = rmRandInt(0,9);
   int socketPattern = rmRandInt(1,2);   
   int nativeSetup = rmRandInt(0,14);
   if (cNumberNonGaiaPlayers > 5)
   {
	if (nativeSetup == 10)
	{
	   if (rmRandInt(1,4) == 4)
		nativeSetup = rmRandInt(12,15);
	   else
            nativeSetup = rmRandInt(0,9);
	}
	if (nativeSetup == 11)
	{
	   if (rmRandInt(1,4) == 4)
		nativeSetup = rmRandInt(12,15);
	   else
            nativeSetup = rmRandInt(0,9);
	}
	if (trPattern == 2)
	   nativeSetup = rmRandInt(0,9);
	if (trPattern == 3)
	   nativeSetup = rmRandInt(0,9);	   
   }
   else
   {
 	if (trPattern == 2)
	   nativeSetup = rmRandInt(0,11);
	if (trPattern == 3)
	   nativeSetup = rmRandInt(0,11);
   }
   int nativePattern = -1;
   int nativeNumber = rmRandInt(2,6);
   int endPosition = rmRandInt(1,3);
   int sidePosition = rmRandInt(1,3);
   int sheepChance = rmRandInt(1,2);
   int featureChance = rmRandInt(1,10);
   int cliffChance = rmRandInt(1,10);
   int makeCliffs = -1; 
   int cliffVariety = rmRandInt(0,5);
   int makeLake = -1;
   int makePonds = -1;
   int makeIce = -1;
   int makeRiver = -1;
   int centerMt = -1;
   int forestMt = -1;
   int mtForest = -1;
   int makeCentralHighlands = -1;
   int makeCentralCanyon = -1;
   int vultures = -1;
   int eagles = -1;
   int plainsMap = -1;
   int hillTrees = -1;
   int placeBerries = 1;
   int baseHt = -1;
   int reducedForest = -1;
   int mtPattern = rmRandInt(1,4);
   int clearCenter = -1;
   int clearCenterChance = -1;
   int makeCentralForestPatch = -1;
   int forestDist = rmRandInt(15,33);
   if (cNumberNonGaiaPlayers < 4)
	forestDist = rmRandInt(15,30);

// Picks the map size
   int playerTiles=49000;   // size = 626 for 2 pl, 316 for carolina, 2x
   if (cNumberNonGaiaPlayers > 7)
	playerTiles = 36500;  // size = 1080 for 8 pl, 580 for carolina, 1.86x
   else if (cNumberNonGaiaPlayers > 5)
	playerTiles = 40000;  // size = 979 for 6 pl,  525 for carolina, 1.86x
   else if (cNumberNonGaiaPlayers > 3)
	playerTiles = 45000;  // size = 848 for 4 pl,  447 for carolina, 1.9x
   else if (cNumberNonGaiaPlayers == 3)   
	playerTiles = 46000;  // size = 743 for 3 pl

   int size=2.0*sqrt(cNumberNonGaiaPlayers*playerTiles);
   rmEchoInfo("Map size="+size+"m x "+size+"m");
   rmSetMapSize(size, size);

// Elevation
   rmSetMapElevationParameters(cElevTurbulence, 0.4, 6, 0.7, 5.0);
   rmSetMapElevationHeightBlend(1.0);
   rmSetSeaLevel(0.0);
	
// Pick terrain patterns and features 
/*  can use these in single player to select favorite features - 
    but restore map from the zip file for use in multiplayer 
    to ensure files are exactly the same  */ 
//   patternChance = 19;
//   featureChance = 6;
//   variantChance = 1;

   if (patternChance == 1) // NE
   {   
      rmSetSeaType("new england coast");
      rmSetMapType("newEngland");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("paris");
	else
	   rmSetLightingSet("new england");

      baseHt = rmRandFloat(1,3);
      baseType = "newengland_grass";
	forestType = "new england forest";
      cliffType = "New England";
	pondType = "new england lake";
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
         centerHerdType = "turkey";        
	}
      if (sheepChance == 1)
         sheepType = "sheep";
      else
         sheepType = "cow";
      fishType = "FishSalmon";
	nativePattern = 1;
      hillTrees = rmRandInt(0,1);

	makePonds = rmRandInt(1,10);
      if (featureChance == 1)
	   makeLake = 1;
	else if (featureChance == 2)
	   makePonds = 1;	   	
	else if (featureChance < 6)
	{
	   makeCentralHighlands = 1;
	   makeCliffs = 2;
         mtForest = 1;
	}
	else if (featureChance < 7)
	{
	   makeCentralCanyon = 1;
	   makeCliffs = 2;
         mtForest = 1;
	}
      else if (featureChance < 8)
	{
	   forestMt = 1;
	   cliffChance = 0;
	}
	if (cliffChance > 2)
         makeCliffs = 1;
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

      baseHt = 1;
      baseType = "carolina_grass";
	forestType = "carolina pine forest";
	riverType = "Amazon River";
      cliffType = "Carolina Inland";
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
      fishType = "FishBass";
	nativePattern = 3;
      hillTrees = rmRandInt(0,1);

	if (featureChance < 4)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
      else if (featureChance < 6)
	{
	   forestMt = 1;
	   cliffChance = 0;
	}
      else if (featureChance == 10)
	{
	   makeRiver = 1;
	   cliffChance = 2;
	}
	if (cliffChance > 7)
         makeCliffs = 1;
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

      baseHt = 1;
      baseType = "bayou_grass";
	forestType = "bayou swamp forest";
      pondType = "bayou";
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
      fishType = "FishBass";
	nativePattern = 3;
	eagles = 1;
      makeCliffs = 0;
      makeLake = 1;
   }
   else if (patternChance == 4) // great lakes green
   {
      if (variantChance == 1)
         rmSetSeaType("hudson bay");
      else
	   rmSetSeaType("new england coast");
      rmSetMapType("greatlakes");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("constantinople");
	else
         rmSetLightingSet("Great Lakes");

      baseHt = rmRandFloat(1,3);
      baseType = "greatlakes_grass";
	forestType = "great lakes forest";
      cliffType = "New England";
      pondType = "great lakes";
	treeType = "TreeGreatLakes";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "moose";
         centerHerdType = "bison";
	}
      else 
	{     
         deerType = "deer";
         deer2Type = "turkey";
         centerHerdType = "moose";        
	}   
      sheepType = "sheep";
      fishType = "FishBass";
	nativePattern = 4;
      hillTrees = rmRandInt(0,1);

      if (featureChance == 1)
	   makePonds = 1;	
      else if (featureChance < 4)
	   makeLake = 1;
	else if (featureChance < 6)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
	else if (featureChance < 7)
	{
	   makeCentralCanyon = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
      else if (featureChance < 9)
	{
	   forestMt = 1;
	   cliffChance = 0;
	}
	if (cliffChance >6)
         makeCliffs = 1;
   }
   else if (patternChance == 5) // great lakes winter
   {
      rmSetSeaType("great lakes ice");
      rmSetMapType("greatlakes");
      rmSetMapType("snow");
	if (lightingChance == 1)
	   rmSetLightingSet("308b_caribbeanlight");
	else
         rmSetLightingSet("Great Lakes Winter");

      baseHt = 1;
      baseType = "greatlakes_snow";
	forestType = "great lakes forest snow";
	riverType = "Yukon River";
      pondType = "great lakes ice";
	treeType = "TreeGreatLakesSnow";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "moose";
         centerHerdType = "elk";
	}
      else 
	{     
         deerType = "deer";
         deer2Type = "bison";
         centerHerdType = "moose";       
	}      
      sheepType = "sheep";
      fishType = "FishSalmon";
      placeBerries = 0;
	nativePattern = 5;
      hillTrees = rmRandInt(0,1);

      if (featureChance < 4)
	   makeLake = 1;
	else if (featureChance < 7)
	   makeIce = 1;
	else if (featureChance < 9)
	   forestMt = 1;
      else if (featureChance == 9)
	   makeRiver = 1;
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

      baseHt = rmRandFloat(1,3);
      baseType = "saguenay grass";
	forestType = "saguenay forest";
      pondType = "saguenay lake";
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
	nativePattern = 6;	

	makePonds = rmRandInt(1,3);
      if (featureChance < 5)
	   makeLake = 1;
	else if (featureChance <7)
	   makePonds = 1;	
   }
   else if (patternChance == 7) // yukon
   {
      rmSetSeaType("great lakes ice");
      rmSetMapType("yukon");
      rmSetMapType("snow");
	if (lightingChance == 1)
	   rmSetLightingSet("spc14anight");
	else
         rmSetLightingSet("yukon");

      baseHt = 1;
      baseType = "yukon snow";
	forestType = "yukon snow forest";
	riverType = "Yukon River";
      cliffType = "rocky mountain2";
	treeType = "TreeYukonSnow";
      if (variantChance == 1)
	{
         deerType = "caribou";
         deer2Type = "muskOx";
         centerHerdType = "bighornsheep";
	}
      else 
	{     
         deerType = "muskOx";
         deer2Type = "caribou";
         centerHerdType = "caribou";       
	}
      sheepChance = 0;
      fishType = "FishSalmon";
      placeBerries = 0;
	nativePattern = 16;
      hillTrees = rmRandInt(0,1);

	clearCenterChance = 3;
      if (featureChance < 4)
	{
	   centerMt = 1;
	   cliffVariety = rmRandInt(1,5);
	}
	else if (featureChance < 7)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 2;
	}
	else if (featureChance < 9)
	{
	   makeIce = 1;
	   cliffChance = 0;
	}
      else if (featureChance == 9)
	{
	   makeRiver = 1;
	   clearCenterChance = 0;
	}
	if (cliffChance > 2)
         makeCliffs = 1;
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

      baseHt = rmRandFloat(1,3);
      baseType = "rockies_grass";
	forestType = "rockies forest";
      cliffType = "rocky mountain2";
	treeType = "TreeRockies";
      if (variantChance == 1)
	{
         deerType = "deer";
         deer2Type = "elk";
         centerHerdType = "bighornsheep";
	}
      else 
	{     
         deerType = "elk";
         deer2Type = "elk";
         centerHerdType = "bighornsheep";
	}   
      if (sheepChance == 1)
         sheepType = "cow";
      else
         sheepType = "sheep";
      fishType = "FishSalmon";
	nativePattern = 7;
	eagles = 1;
      hillTrees = 1;
      reducedForest = 1;

      if (featureChance < 6)
	   centerMt = 1;
	else 
	   makeCentralHighlands = 1;
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
       
      baseHt = 1;
      baseType = "great plains grass"; 
	forestType = "great plains forest";
	riverType = "Amazon River";
      cliffType = "Great Plains";
      pondType = "great plains pond";
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
         centerHerdType = "elk";
	} 
      if (sheepChance == 1)
         sheepType = "cow";
      else
         sheepType = "sheep";
      fishType = "FishBass";
	nativePattern = 8;
      vultures = 1;
      plainsMap = 1;

	makePonds = rmRandInt(1,10);
	clearCenterChance = 2;
      if (featureChance == 1)
	   makePonds = 1;
      else if (featureChance < 4)
	   makeLake = 1;
	else if (featureChance < 5)
	{
	   makeCentralCanyon = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
	else if (featureChance < 7)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
      else if (featureChance == 7)
	{
	   makeRiver = 1;
	   makePonds = 0;
	   clearCenterChance = 0;
	}
	if (cliffChance > 7)
         makeCliffs = 1;
   }
   else if (patternChance == 10) // great plains 2
   {
      rmSetSeaType("new england coast");
      rmSetMapType("greatPlains");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("spc14abuffalo");
	else
         rmSetLightingSet("great plains");
       
      baseHt = rmRandFloat(1,3);
      baseType = "great plains drygrass";
	forestType = "great plains forest";
      cliffType = "Great Plains";
      pondType = "great plains pond";
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
         centerHerdType = "bison";
	}
      sheepType = "cow";
      fishType = "FishBass";
	nativePattern = 2;
      vultures = 1;
      plainsMap = 1;

	makePonds = rmRandInt(1,10);
	clearCenterChance = 1;
      if (featureChance == 1)
	   makePonds = 1;
      else if (featureChance < 4)
	   makeLake = 1;
	else if (featureChance < 5)
	{
	   makeCentralCanyon = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
	else if (featureChance < 7)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
	if (cliffChance > 7)
         makeCliffs = 1;
   }
   else if (patternChance == 11) // texas grass
   {   
      rmSetSeaType("new england coast");
      rmSetMapType("texas");
	rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("pampas");
	else
         rmSetLightingSet("texas");

      baseHt = rmRandFloat(1,3);
      baseType = "texas_grass";
	forestType = "texas forest";
	riverType = "Amazon River";
      cliffType = "Texas Grass";
	pondType = "texas pond";
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
         centerHerdType = "bison";
	}
      sheepType = "cow";
      fishType = "FishBass";
	nativePattern = 9;
      vultures = 1;

	if (cliffChance > 3)
         makeCliffs = 1;

	makePonds = rmRandInt(1,10);
	clearCenterChance = 2;
      if (featureChance == 1)
	   makePonds = 1;
      else if (featureChance < 4)
	   makeLake = 1;
	else if (featureChance < 7)
	{
	   makeCentralHighlands = 1;
	   makeCliffs = 2;
         mtForest = 1;
	}
	else if (featureChance == 7)
	{
	   makeRiver = 1;
	   makeCliffs = 2;
	   makePonds = 0;
	   clearCenterChance = 0;
	}
   }
   else if (patternChance == 12) // texas desert
   {   
      rmSetSeaType("new england coast");
      rmSetMapType("texas");
	rmSetMapType("grass");
	if (featureChance == 7)
	   rmSetLightingSet("seville");
	else
	{
	   if (lightingChance == 1)
	      rmSetLightingSet("seville");
	   else
            rmSetLightingSet("texas");
	}

      baseHt = rmRandFloat(1,3);
	if (lightingChance == 1)
	   baseType = "texas_dirt";
	else
         baseType = "texas_grass";

	forestType = "texas forest dirt";
	riverType = "Pampas River";
      cliffType = "Texas";
	pondType = "texas pond";
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
      fishType = "FishBass";
	nativePattern = 2;
      vultures = 1;

	makePonds = rmRandInt(1,15);
      clearCenterChance = 1;
      makeCliffs = 1;
      if (featureChance < 4)
	{
	   makeCentralCanyon = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
	else if (featureChance < 7)
	{
	   makeCentralHighlands = 1;
	   makeCliffs = 2;
         mtForest = 1;
	}
	else if (featureChance == 7)
	{
	   makeRiver = 1;
	   makeCliffs = 2;
	   makePonds = 0;
	   clearCenterChance = 0;
	}
   }
   else if (patternChance == 13) // sonora
   {   
      rmSetSeaType("Atlantic Coast");
      rmSetMapType("sonora");
	rmSetMapType("grass");
	if (featureChance == 6)
	   rmSetLightingSet("pampas");
	else
	{
   	   if (lightingChance == 1)
            rmSetLightingSet("sonora");
	   else
            rmSetLightingSet("pampas");
	}

      baseHt = 1;
      baseType = "sonora_dirt";
	forestType = "sonora forest";
	riverType = "Pampas River";
      cliffType = "Sonora";
      cliffVariety = 6;
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
      fishType = "FishMahi";
      if (variantChance == 1)
   	   nativePattern = 10;
      else 
         nativePattern = 11;
      vultures = 1;
      reducedForest = 1;

      if (featureChance < 4)
	{
	   makeCentralCanyon = 1;
         mtForest = 1;
	}
	else if (featureChance < 6)
	{
	   makeCentralHighlands = 1;
         mtForest = 1;
	}
	else if (featureChance == 6)
	{
	   makeRiver = 1;
	}
      makeCliffs = 1;
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
     
      baseHt = 1;
      baseType = "yucatan_grass";
	forestType = "yucatan forest";
	riverType = "Amazon River";
      cliffType = "Amazon";
      pondType = "Amazon River Basin";
	treeType = "TreeYucatan";
      if (variantChance == 1)
      {
         deerType = "tapir";
         deer2Type = "capybara";
         centerHerdType = "turkey";
      }
      else
	{
         deerType = "capybara";
         deer2Type = "turkey";
         centerHerdType = "tapir";
	}
      sheepChance = 0;
      fishType = "FishTarpon";
	nativePattern = 11;
      hillTrees = rmRandInt(0,1);

      if (featureChance == 1)
	   makePonds = 1;
      else if (featureChance == 2)
	   makeLake = 1;
	else if (featureChance < 5)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
      else if (featureChance < 7)
	{
	   forestMt = 1;
	   cliffChance = 0;
	}
      else if (featureChance == 7)
	{
	   makeRiver = 1;
	   cliffChance = 2;
	   makePonds = 0;
	}
	if (cliffChance > 7)
         makeCliffs = 1;
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
     
      baseHt = 1;
      baseType = "caribbean grass";
	forestType = "caribbean palm forest";
      pondType = "Amazon River Basin";
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
      fishType = "FishTarpon";
	nativePattern = 12;

      if (featureChance < 4)
	   makeLake = 1;
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
     
      baseHt = 1;
      baseType = "amazon grass";
	forestType = "amazon rain forest";
	riverType = "Amazon River";
      cliffType = "Amazon";
      pondType = "Amazon River Basin";
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
      fishType = "FishTarpon";
      nativePattern = 13;

      if (featureChance == 1)
	   makeLake = 1;
	else if (featureChance < 4)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
      else if (featureChance < 6)
	{
	   forestMt = 1;
	   cliffChance = 0;
	}
      else if (featureChance < 10)
	{
	   makeRiver = 1;
	   cliffChance = 2;
	}
	if (cliffChance > 7)
         makeCliffs = 1;
   }
   else if (patternChance == 17) // pampas
   {
      rmSetSeaType("Pampas River");
      rmSetMapType("pampas");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("texas");
	else
         rmSetLightingSet("pampas");

      baseHt = 1;
	if (cliffVariety < 3)  // not used for cliffs!
	   baseType = "pampas_grass";
	else
         baseType = "pampas_dirt";
	forestType = "pampas forest";
	treeType = "TreePampas";
	riverType = "Pampas River";
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
      fishType = "FishBass";
	nativePattern = 14;

	clearCenterChance = 2;
      if (featureChance < 6)
	{
	   makeRiver = 1;
	   clearCenterChance = 0;
	}

      vultures = 1;
      eagles = 1;
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

      baseHt = rmRandFloat(1,3);
      baseType = "patagonia_grass";
	forestType = "patagonia forest";
      cliffType = "Patagonia";
      pondType = "hudson bay";
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
	nativePattern = 14;
      hillTrees = rmRandInt(0,1);

	if (cliffChance < 6)
         makeCliffs = 1;

	makePonds = rmRandInt(1,15);
      if (featureChance < 3)
 	   makeLake = 1;
	else if (featureChance < 6)
	{
	   makeCentralHighlands = 1;
	   makeCliffs = 2;
         mtForest = 1;
   	   clearCenterChance = 2;
	}
	else if (featureChance < 8)
	{
	   makeCentralCanyon = 1;
	   makeCliffs = 2;
         mtForest = 1;
	}
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

      baseHt = rmRandFloat(1,3);
      baseType = "patagonia_dirt";
	forestType = "patagonia forest";
      cliffType = "Patagonia";
      pondType = "hudson bay";
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
      if (variantChance == 1)
   	   nativePattern = 15;
      else 
         nativePattern = 17;	
      hillTrees = 1;

      makeCliffs = 1;
	if (featureChance < 5)
	{
	   makeCentralHighlands = 1;
         mtForest = 1;
	   makeCliffs = 2;
	   hillTrees = 0;
	   clearCenterChance = 3;
	}
	else if (featureChance < 6)	
	{
	   makeCentralCanyon = 1;
         mtForest = 1;
	   makeCliffs = 2;
	   hillTrees = 0;
	}
      else
	{
	   centerMt = 1;
	   makeCliffs = 1;
   	   clearCenterChance = 3;
	}
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

      baseHt = 1;
      baseType = "yukon grass";
	forestType = "yukon forest";
	riverType = "Yukon River";
      cliffType = "rocky mountain2";
	if (rmRandInt(1,2) == 1)
         pondType = "hudson bay";
	else  
         pondType = "great lakes ice";
	treeType = "TreeYukon";
      if (variantChance == 1)
	{
	   if (featureChance > 8)
	   {
		makeRiver = 1; 
            deerType = "muskOx";
            deer2Type = "caribou";
            centerHerdType = "caribou";
	   }
	   else
	   {
	      centerMt = 1;
	      clearCenterChance = 3;
            deerType = "muskOx";
            deer2Type = "caribou";
            centerHerdType = "bighornsheep";
	   }
	}
      else 
	{  
         deerType = "caribou"; 
         deer2Type = "muskOx";
         centerHerdType = "caribou";  
	   clearCenterChance = 3;
         if (featureChance < 4)
		makeIce = 1;
	   else if (featureChance < 8)	
	      makeLake = 1;     
	}
      sheepChance = 0;
      fishType = "FishSalmon";
      placeBerries = 0;
	nativePattern = 6;
      hillTrees = 0;  
   }

   if (clearCenterChance == 1)
      clearCenter = rmRandInt(1,2);
   if (clearCenterChance == 2)
      clearCenter = rmRandInt(1,4);
   if (clearCenterChance == 3)
      clearCenter = rmRandInt(1,10);
   if (clearCenter > 1)
	clearCenter = 0;

   rmSetBaseTerrainMix(baseType);
   rmTerrainInitialize("yukon\ground1_yuk", 1);
   rmEnableLocalWater(false);
   rmSetMapType("land");

   rmSetWorldCircleConstraint(true);
   rmSetWindMagnitude(2.0);

// Precipitation
   if (patternChance == 16) // amazon
      if (lightingChance == 2)
         rmSetGlobalRain( 1.0 );
   if (patternChance == 7) // yukon
      rmSetGlobalSnow( 0.8 );
   if (patternChance == 5) // great lakes winter
      rmSetGlobalSnow( 0.7 );
   if (patternChance == 8) // rockies
      if (lightingChance == 2)
         rmSetGlobalSnow( 0.5 );
   if (patternChance == 14) // yucatan
      if (lightingChance == 2)
         rmSetGlobalRain( 0.7 );
   if (patternChance == 20) // yukon tundra
      if (lightingChance == 2)         
         rmSetGlobalSnow( 0.7 );
   
   chooseMercs();

// Define some classes.
   int classPlayer=rmDefineClass("player");
   int lakeClass=rmDefineClass("lake");
   rmDefineClass("classHill");
   rmDefineClass("classPatch");
   rmDefineClass("starting settlement");
   rmDefineClass("startingUnit");
   rmDefineClass("classForest");
   rmDefineClass("importantItem");
   rmDefineClass("natives");
   rmDefineClass("classCliff");
   rmDefineClass("center");
   rmDefineClass("classNugget");
   rmDefineClass("socketClass");
   rmDefineClass("classIce");
   rmDefineClass("classClearing"); 
   int classHuntable=rmDefineClass("huntableFood");   
   int classHerdable=rmDefineClass("herdableFood"); 
   int canyon=rmDefineClass("canyon");

   // Text
   rmSetStatusText("",0.10);

// -------------Define constraints
   // Map edge constraints
   int playerEdgeConstraint=rmCreateBoxConstraint("player edge of map", rmXTilesToFraction(10), rmZTilesToFraction(10), 1.0-rmXTilesToFraction(10), 1.0-rmZTilesToFraction(10), 0.01);
   int secondEdgeConstraint=rmCreateBoxConstraint("bison edge of map", rmXTilesToFraction(20), rmZTilesToFraction(20), 1.0-rmXTilesToFraction(20), 1.0-rmZTilesToFraction(20), 0.01);
   int circleConstraint=rmCreatePieConstraint("circle Constraint", 0.5, 0.5, 0, rmZFractionToMeters(0.47), rmDegreesToRadians(0), rmDegreesToRadians(360));
   int circleConstraintMt=rmCreatePieConstraint("circle Constraint for mts", 0.5, 0.5, 0, rmZFractionToMeters(0.2), rmDegreesToRadians(0), rmDegreesToRadians(360));

   // Center constraints
   int centerConstraint=rmCreateClassDistanceConstraint("stay away from center", rmClassID("center"), 30.0);
   int centerConstraintShort=rmCreateClassDistanceConstraint("stay away from center short", rmClassID("center"), 12.0);
   int centerConstraintFar=rmCreateClassDistanceConstraint("stay away from center far", rmClassID("center"), 70.0);
   int centerConstraintForest=rmCreateClassDistanceConstraint("stay away from center forest", rmClassID("center"), rmZFractionToMeters(0.27));
   int centerConstraintForest2=rmCreateClassDistanceConstraint("stay away from center forest 2", rmClassID("center"), rmZFractionToMeters(0.25));
   int centerConstraintForest3=rmCreateClassDistanceConstraint("stay away from center forest 3", rmClassID("center"), rmZFractionToMeters(0.25));
   int centerConstraintForest4=rmCreateClassDistanceConstraint("stay away from center forest 4", rmClassID("center"), rmZFractionToMeters(0.23));

   // Player constraints
   int playerConstraintForest=rmCreateClassDistanceConstraint("forests kinda stay away from players", classPlayer, 15.0);
   int playerConstraint=rmCreateClassDistanceConstraint("stay away from players", classPlayer, 45.0);
   int mediumPlayerConstraint=rmCreateClassDistanceConstraint("medium stay away from players", classPlayer, 25.0);
   int nuggetPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players a lot", classPlayer, 60.0);
   int farPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players more", classPlayer, 85.0);
   int fartherPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players the most", classPlayer, 105.0);
   int enormousPlayerConstraint=rmCreateClassDistanceConstraint("stay away from players for asymmetric starts", classPlayer, 160.0);
   int longPlayerConstraint=rmCreateClassDistanceConstraint("land stays away from players", classPlayer, 70.0); 

   // Nature avoidance
   int forestObjConstraint=rmCreateTypeDistanceConstraint("forest obj", "all", 6.0);
   int shortForestConstraint=rmCreateClassDistanceConstraint("patch vs. forest", rmClassID("classForest"), 15.0);
   int forestConstraint=rmCreateClassDistanceConstraint("forest vs. forest", rmClassID("classForest"), forestDist);
   int longForestConstraint=rmCreateClassDistanceConstraint("long forest vs. forest", rmClassID("classForest"), 26.0);
   int avoidResource=rmCreateTypeDistanceConstraint("resource avoid resource", "resource", 20.0);
   int avoidCoin=rmCreateTypeDistanceConstraint("avoid coin", "gold", 10.0);
   int shortAvoidSilver=rmCreateTypeDistanceConstraint("short gold avoid gold", "Mine", 20.0);
   int coinAvoidCoin=rmCreateTypeDistanceConstraint("coin avoids coin", "gold", 35.0);
   int avoidStartResource=rmCreateTypeDistanceConstraint("start resource no overlap", "resource", 1.0);
   int avoidSheep=rmCreateClassDistanceConstraint("sheep avoids sheep etc", rmClassID("herdableFood"), 45.0);
   int huntableConstraint=rmCreateClassDistanceConstraint("huntable constraint", rmClassID("huntableFood"), 35.0);
   int longHuntableConstraint=rmCreateClassDistanceConstraint("long huntable constraint", rmClassID("huntableFood"), 55.0);
   int forestsAvoidBison=rmCreateClassDistanceConstraint("forest avoids bison", rmClassID("huntableFood"), 15.0);
   int avoidDucks=rmCreateTypeDistanceConstraint("avoids ducks", "DuckFamily", 50.0);

   // Avoid impassable land, certain features
   int avoidImpassableLand=rmCreateTerrainDistanceConstraint("avoid impassable land", "Land", false, 4.0);
   int shortAvoidImpassableLand=rmCreateTerrainDistanceConstraint("short avoid impassable land", "Land", false, 2.0);
   int longAvoidImpassableLand=rmCreateTerrainDistanceConstraint("long avoid impassable land", "Land", false, 18.0);
   int hillConstraint=rmCreateClassDistanceConstraint("hill vs. hill", rmClassID("classHill"), 15.0);
   int shortHillConstraint=rmCreateClassDistanceConstraint("patches vs. hill", rmClassID("classHill"), 5.0);
   int longHillConstraint=rmCreateClassDistanceConstraint("far from hill", rmClassID("classHill"), 35.0);
   int medHillConstraint=rmCreateClassDistanceConstraint("medium from hill", rmClassID("classHill"), 25.0);
   int patchConstraint=rmCreateClassDistanceConstraint("patch vs. patch", rmClassID("classPatch"), 8.0);
   int avoidCliffs=rmCreateClassDistanceConstraint("stuff vs. cliff", rmClassID("classCliff"), 12.0);
   int cliffsAvoidCliffs=rmCreateClassDistanceConstraint("cliffs vs. cliffs", rmClassID("classCliff"), 30.0);
   int avoidWater10 = rmCreateTerrainDistanceConstraint("avoid water mid-long", "Land", false, 10.0);
   int avoidWater15 = rmCreateTerrainDistanceConstraint("avoid water mid-longer", "Land", false, 15.0);
   int avoidWater20 = rmCreateTerrainDistanceConstraint("avoid water a little more", "Land", false, 20.0);
   int avoidWater30 = rmCreateTerrainDistanceConstraint("avoid water long", "Land", false, 30.0);
   int avoidCanyons=rmCreateClassDistanceConstraint("avoid canyons", rmClassID("canyon"), 35.0);
   int shortAvoidCanyons=rmCreateClassDistanceConstraint("short avoid canyons", rmClassID("canyon"), 15.0);
   int nearShore=rmCreateTerrainMaxDistanceConstraint("tree v. water", "land", true, 14.0);
   int rockVsLand = rmCreateTerrainDistanceConstraint("rock v. land", "land", true, 2.0);
   int avoidLakes=rmCreateClassDistanceConstraint("stuff vs.lakes", rmClassID("lake"), 12.0);
   int avoidLakesFar=rmCreateClassDistanceConstraint("stuff vs.lakes far", rmClassID("lake"), 55.0);
   int avoidIce=rmCreateClassDistanceConstraint("stuff vs.ice", rmClassID("classIce"), 12.0);
   int avoidClearing=rmCreateClassDistanceConstraint("avoid clearings", rmClassID("classClearing"), 18.0);  
  
   // Unit avoidance
   int avoidStartingUnits=rmCreateClassDistanceConstraint("objects avoid starting units", rmClassID("startingUnit"), 30.0);
   int avoidStartingUnitsSmall=rmCreateClassDistanceConstraint("objects avoid starting units small", rmClassID("startingUnit"), 10.0);
   int avoidStartingUnitsLarge=rmCreateClassDistanceConstraint("objects avoid starting units large", rmClassID("startingUnit"), 50.0);
   int avoidImportantItem=rmCreateClassDistanceConstraint("things avoid each other", rmClassID("importantItem"), 10.0);
   int avoidImportantItemSmall=rmCreateClassDistanceConstraint("important item small avoidance", rmClassID("importantItem"), 7.0);
   int avoidNatives=rmCreateClassDistanceConstraint("stuff avoids natives", rmClassID("natives"), 60.0);
   int avoidNativesMed=rmCreateClassDistanceConstraint("stuff avoids natives medium", rmClassID("natives"), 40.0);
   int avoidNativesShort=rmCreateClassDistanceConstraint("stuff avoids natives shorter", rmClassID("natives"), 25.0);
   int avoidNugget=rmCreateClassDistanceConstraint("nugget vs. nugget", rmClassID("classNugget"), 45.0);
   int avoidNuggetMed=rmCreateClassDistanceConstraint("nugget vs. nugget med", rmClassID("classNugget"), 60.0);
   int avoidNuggetLong=rmCreateClassDistanceConstraint("nugget vs. nugget long", rmClassID("classNugget"), 80.0);
   int avoidNuggetSmall=rmCreateTypeDistanceConstraint("avoid nuggets by a little", "AbstractNugget", 10.0);
   int avoidAll=rmCreateTypeDistanceConstraint("avoid all", "all", 6.0);

   // Trade route avoidance.
   int avoidTradeRoute = rmCreateTradeRouteDistanceConstraint("trade route", 8.0);
   int avoidSocket=rmCreateClassDistanceConstraint("avoid sockets", rmClassID("socketClass"), 13.0);

// End of constraints -----------------------------------

// Set up of trade routes for special situations
   if (makeRiver == 1)
   {
	if (trPattern == 0)
	   trPattern = 1;
	if (trPattern == 3)
	   trPattern = 2;
	if (trPattern == 6)
	   trPattern = 4;
	if (trPattern == 7)
	   trPattern = 5;
	if (trPattern == 8)
	   trPattern = 9;
   }

   if (makeLake == 1)
   {
	if (trPattern == 6) 
	{
	   if (rmRandInt(1,3) == 1)
	      trPattern = rmRandInt(7,9);
	   else
	      trPattern = rmRandInt(0,5);
	}
   }

   if (makeIce == 1)
   {
	if (trPattern == 6) 
	{
	   if (rmRandInt(1,3) == 1)
	      trPattern = rmRandInt(7,9);
	   else
	      trPattern = rmRandInt(0,5);
	}
   }

   if (makeCentralCanyon == 1)
   {
	if (trPattern == 6) 
	{
	   if (rmRandInt(1,2) == 1)
	      trPattern = rmRandInt(7,9);
	   else
	      trPattern = rmRandInt(0,5);
	}
   }

   if (makeCentralHighlands == 1)
   {
	if (trPattern == 6) 
	{
	   if (rmRandInt(1,2) == 1)
	      trPattern = rmRandInt(0,5);	      
	   else
		trPattern = rmRandInt(7,9);
	}
   }

   if (centerMt == 1)
   {
      if (mtPattern == 1)
	{
	   if (trPattern == 6) 
	   {
		if (rmRandInt(1,2) == 1)
		   trPattern = rmRandInt(0,5);
		else
		   trPattern = rmRandInt(7,9);
	   }
	}
   }

   if (forestMt == 1)
   {
      if (mtPattern == 1)
	{
	   if (trPattern == 6) 
	   {
		if (rmRandInt(1,2) == 1)
		   trPattern = rmRandInt(7,9);
		else
		   trPattern = rmRandInt(0,5);
	   }
	}
   }

// Set up for axis and player side, player position
/*  can use these in single player to select favorite features - 
    but restore map from the zip file for use in multiplayer 
    to ensure files are exactly the same.
    Caution - some features are incompatable and may not appear together  */ 
//  trPattern = 9;
//  nativeSetup = 14;

   if (trPattern < 2)
   {
	if (rmRandInt(1,8) == 1)
         distChance = 9;
	else
         distChance = rmRandInt(0,6);
   }

   if (trPattern > 7)
	distChance = rmRandInt(2,9);

// Set up player starting locations
if (cNumberNonGaiaPlayers == 2)
{
   sectionChance = rmRandInt(1,13);
   if (trPattern == 4)
      sectionChance = rmRandInt(1,9);
   if (trPattern == 5) 
      sectionChance = rmRandInt(1,9);
   if (axisChance == 1)
   {
      if (playerSide == 1)
      {
	     rmSetPlacementTeam(0);
      }
      else if (playerSide == 2)
      {
		rmSetPlacementTeam(1);
      }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.24, 0.26);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.29, 0.31);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.19, 0.21);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.14, 0.16);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.34, 0.36);
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.34, 0.36);
	    else if (sectionChance == 7)
             rmSetPlacementSection(0.14, 0.16);
	    else if (sectionChance == 8)
             rmSetPlacementSection(0.29, 0.31);
	    else if (sectionChance == 9)
             rmSetPlacementSection(0.19, 0.21);
	    else if (sectionChance == 10)
             rmSetPlacementSection(0.09, 0.11);
	    else if (sectionChance == 11)
             rmSetPlacementSection(0.89, 0.91);
	    else if (sectionChance == 12)
             rmSetPlacementSection(0.09, 0.11);
	    else if (sectionChance == 13)
             rmSetPlacementSection(0.39, 0.41);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);

	    if (playerSide == 1)
          {
		rmSetPlacementTeam(1);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(0);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.74, 0.76);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.79, 0.81);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.69, 0.71);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.64, 0.66);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.84, 0.86);
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.64, 0.66);
	    else if (sectionChance == 7)
             rmSetPlacementSection(0.84, 0.86);
	    else if (sectionChance == 8)
             rmSetPlacementSection(0.69, 0.71);
	    else if (sectionChance == 9)
             rmSetPlacementSection(0.79, 0.81);
	    else if (sectionChance == 10)
             rmSetPlacementSection(0.39, 0.41);
	    else if (sectionChance == 11)
             rmSetPlacementSection(0.59, 0.61);
	    else if (sectionChance == 12)
             rmSetPlacementSection(0.59, 0.61);
	    else if (sectionChance == 13)
             rmSetPlacementSection(0.89, 0.91);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
   }
   else if (axisChance == 2)
   {
	    if (playerSide == 1)
          {
		rmSetPlacementTeam(0);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(1);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.49, 0.51);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.44, 0.46);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.54, 0.56);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.39, 0.41);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.59, 0.61);
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.89, 0.91);
	    else if (sectionChance == 7)
             rmSetPlacementSection(0.09, 0.11);
	    else if (sectionChance == 8)
             rmSetPlacementSection(0.54, 0.56);
	    else if (sectionChance == 9)
             rmSetPlacementSection(0.44, 0.46);
	    else if (sectionChance == 10)
             rmSetPlacementSection(0.14, 0.16);
	    else if (sectionChance == 11)
             rmSetPlacementSection(0.34, 0.36);
	    else if (sectionChance == 12)
             rmSetPlacementSection(0.34, 0.36);
	    else if (sectionChance == 13)
             rmSetPlacementSection(0.64, 0.66);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);

	    if (playerSide == 1)
          {
		rmSetPlacementTeam(1);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(0);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.99, 0.01);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.94, 0.96);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.04, 0.06);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.89, 0.91);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.09, 0.11);
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.59, 0.61);
	    else if (sectionChance == 7)
             rmSetPlacementSection(0.39, 0.41);
	    else if (sectionChance == 8)
             rmSetPlacementSection(0.94, 0.96);
	    else if (sectionChance == 9)
             rmSetPlacementSection(0.04, 0.06);
	    else if (sectionChance == 10)
             rmSetPlacementSection(0.84, 0.86);
	    else if (sectionChance == 11)
             rmSetPlacementSection(0.64, 0.66);
	    else if (sectionChance == 12)
             rmSetPlacementSection(0.84, 0.86);
	    else if (sectionChance == 13)
             rmSetPlacementSection(0.14, 0.16);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
   }
}   
else 
{ 
   if (cNumberTeams == 2)
   {
      if (cNumberNonGaiaPlayers == 4) // 2 teams, 4 players 
      {
	  sectionChance = rmRandInt(1,6);
        if (axisChance == 1)
        {
          if (playerSide == 1)
          {
	  	rmSetPlacementTeam(0);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(1);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.21, 0.29);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.19, 0.31);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.18, 0.32);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.17, 0.33);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.16, 0.26);
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.24, 0.34);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);

	    if (playerSide == 1)
          {
		rmSetPlacementTeam(1);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(0);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.71, 0.79);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.69, 0.81);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.68, 0.82);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.67, 0.83);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.66, 0.76);
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.74, 0.84);          

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
        }
        else if (axisChance == 2)
        {
	    if (playerSide == 1)
          {
		rmSetPlacementTeam(0);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(1);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.46, 0.54);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.44, 0.56);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.43, 0.57);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.42, 0.58);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.41, 0.51);
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.49, 0.59);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);

	    if (playerSide == 1)
          {
		rmSetPlacementTeam(1);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(0);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.96, 0.04);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.94, 0.06);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.93, 0.07);
	    else if (sectionChance == 4)
             rmSetPlacementSection(0.92, 0.08);
	    else if (sectionChance == 5)
             rmSetPlacementSection(0.91, 0.01);
	    else if (sectionChance == 6)
             rmSetPlacementSection(0.99, 0.09);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
        } 
      }
      else if (cNumberNonGaiaPlayers <7) // for 2 teams, for 3 or 5-6 players
      {
        if (axisChance == 1)
        {
          if (playerSide == 1)
          {
	  	rmSetPlacementTeam(0);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(1);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.17, 0.33);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.15, 0.35);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.13, 0.37);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);

	    if (playerSide == 1)
          {
		rmSetPlacementTeam(1);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(0);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.67, 0.83);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.65, 0.85);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.63, 0.87);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
        }
        else if (axisChance == 2)
        {
	    if (playerSide == 1)
          {
		rmSetPlacementTeam(0);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(1);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.42, 0.58);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.40, 0.60);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.38, 0.62);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);

	    if (playerSide == 1)
          {
		rmSetPlacementTeam(1);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(0);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.92, 0.08);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.90, 0.10);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.88, 0.12);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
        }
      }
      else  // for 2 teams, for over 6 players
      {
        if (axisChance == 1)
        {
          if (playerSide == 1)
          {
	  	rmSetPlacementTeam(0);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(1);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.15, 0.35);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.13, 0.37);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.11, 0.39);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);

	    if (playerSide == 1)
          {
		rmSetPlacementTeam(1);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(0);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.65, 0.85);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.63, 0.87);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.61, 0.89);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
        }
        else if (axisChance == 2)
        {
	    if (playerSide == 1)
          {
		rmSetPlacementTeam(0);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(1);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.40, 0.60);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.38, 0.62);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.36, 0.64);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);

	    if (playerSide == 1)
          {
		rmSetPlacementTeam(1);
	    }
          else if (playerSide == 2)
	    {
		rmSetPlacementTeam(0);
	    }
	    if (sectionChance == 1)
             rmSetPlacementSection(0.90, 0.10);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.88, 0.12);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.86, 0.14);

 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
        }
      }
   }
   else  // for FFA or over 2 teams
   {
      if (cNumberNonGaiaPlayers == 3) 
      {
		if (ffaChance == 1)
		{
   		   rmPlacePlayer(1, 0.31, 0.71);
		   rmPlacePlayer(2, 0.69, 0.71);
		   rmPlacePlayer(3, 0.69, 0.29);
		}
		else if (ffaChance == 2)
		{
   		   rmPlacePlayer(2, 0.31, 0.71);
		   rmPlacePlayer(3, 0.69, 0.71);
		   rmPlacePlayer(1, 0.69, 0.29);
		}		
		else if (ffaChance == 3)
		{
   		   rmPlacePlayer(3, 0.31, 0.71);
		   rmPlacePlayer(1, 0.69, 0.71);
		   rmPlacePlayer(2, 0.69, 0.29);
		}
		else
            { 
	       if (distChance == 0)
	          rmPlacePlayersCircular(0.45, 0.46, 0.0);
	       else if (distChance == 1)
	          rmPlacePlayersCircular(0.44, 0.45, 0.0);
	       else if (distChance == 2)
	          rmPlacePlayersCircular(0.42, 0.43, 0.0);
	       else if (distChance == 3)
	          rmPlacePlayersCircular(0.40, 0.41, 0.0);
	       else if (distChance == 4)
	          rmPlacePlayersCircular(0.38, 0.39, 0.0);
	       else if (distChance == 5)
	          rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 6)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.32, 0.33, 0.0);
	       else if (distChance == 8)
	          rmPlacePlayersCircular(0.29, 0.31, 0.0);
	       else if (distChance == 9)
	          rmPlacePlayersCircular(0.26, 0.28, 0.0);
            }
      }
      else if (cNumberNonGaiaPlayers == 4) 
      {
		if (ffaChance == 1)
		{
   		   rmPlacePlayer(1, 0.31, 0.71);
		   rmPlacePlayer(2, 0.69, 0.71);
		   rmPlacePlayer(3, 0.69, 0.29);
		   rmPlacePlayer(4, 0.31, 0.29);
		}
		else if (ffaChance == 2)
		{
   		   rmPlacePlayer(2, 0.31, 0.71);
		   rmPlacePlayer(3, 0.69, 0.71);
		   rmPlacePlayer(4, 0.69, 0.29);
		   rmPlacePlayer(1, 0.31, 0.29);
		}		
		else if (ffaChance == 3) 
		{
   		   rmPlacePlayer(3, 0.31, 0.71);
		   rmPlacePlayer(4, 0.69, 0.71);
		   rmPlacePlayer(1, 0.69, 0.29);
		   rmPlacePlayer(2, 0.31, 0.29);
		}
		else
            { 
	       if (distChance == 0)
	          rmPlacePlayersCircular(0.45, 0.46, 0.0);
	       else if (distChance == 1)
	          rmPlacePlayersCircular(0.44, 0.45, 0.0);
	       else if (distChance == 2)
	          rmPlacePlayersCircular(0.42, 0.43, 0.0);
	       else if (distChance == 3)
	          rmPlacePlayersCircular(0.40, 0.41, 0.0);
	       else if (distChance == 4)
	          rmPlacePlayersCircular(0.38, 0.39, 0.0);
	       else if (distChance == 5)
	          rmPlacePlayersCircular(0.36, 0.37, 0.0);
	       else if (distChance == 6)
	          rmPlacePlayersCircular(0.34, 0.35, 0.0);
	       else if (distChance == 7)
	          rmPlacePlayersCircular(0.32, 0.33, 0.0);
	       else if (distChance == 8)
	          rmPlacePlayersCircular(0.29, 0.31, 0.0);
	       else if (distChance == 9)
	          rmPlacePlayersCircular(0.26, 0.28, 0.0);
            }
	}
      else  // over 4 FFA 
      { 
 	    if (distChance == 0)
	       rmPlacePlayersCircular(0.45, 0.46, 0.0);
	    else if (distChance == 1)
	       rmPlacePlayersCircular(0.44, 0.45, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.42, 0.43, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.40, 0.41, 0.0);
	    else if (distChance == 4)
	       rmPlacePlayersCircular(0.38, 0.39, 0.0);
	    else if (distChance == 5)
	       rmPlacePlayersCircular(0.36, 0.37, 0.0);
	    else if (distChance == 6)
	       rmPlacePlayersCircular(0.34, 0.35, 0.0);
	    else if (distChance == 7)
	       rmPlacePlayersCircular(0.32, 0.33, 0.0);
	    else if (distChance == 8)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
	    else if (distChance == 9)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
      }
   }
}

   // Text
   rmSetStatusText("",0.20);
	
// Set up player areas.
   float playerFraction=rmAreaTilesToFraction(300);
   for(i=1; <cNumberPlayers)
   {
      int id=rmCreateArea("Player"+i);
      rmSetPlayerArea(i, id);
      rmSetAreaSize(id, playerFraction, playerFraction);
      rmAddAreaToClass(id, classPlayer);
      rmSetAreaMinBlobs(id, 1);
      rmSetAreaMaxBlobs(id, 1);
      rmAddAreaConstraint(id, longAvoidImpassableLand);
      rmAddAreaConstraint(id, playerEdgeConstraint); 
      rmSetAreaLocPlayer(id, i);
      rmSetAreaMix(id, baseType);
      rmSetAreaWarnFailure(id, false);
   }
   rmBuildAllAreas();

   // Text
   rmSetStatusText("",0.30);

// Rivers
   int riverWidthChance = rmRandInt(1,3);
   int rivermin = -1;
   int rivermax = -1;
   int shallowPattern = rmRandInt(1,5);

   if (riverWidthChance == 1)
   {
	rivermin = 5;
	rivermax = 6;
   }
   else if (riverWidthChance == 2)
   {
      rivermin = 6;
	rivermax = 8;
   }
   else
   {
      rivermin = 8;
	rivermax = 10;
   }

   if (makeRiver == 1)  
   {
	int singleRiver = rmRiverCreate(-1, riverType, 30, 10, rivermin, rivermax); 
	if (axisChance == 1)
	   rmRiverSetConnections(singleRiver, 0.5, 0.0, 0.5, 1.0);
	else
	   rmRiverSetConnections(singleRiver, 0.0, 0.5, 1.0, 0.5);

	if (shallowPattern < 3)
	{	
	   rmRiverSetShallowRadius(singleRiver, rmRandInt(9, 12));
	   rmRiverAddShallow(singleRiver, rmRandFloat(0.34, 0.42)); 

	   rmRiverSetShallowRadius(singleRiver, rmRandInt(9, 12));
	   rmRiverAddShallow(singleRiver, rmRandFloat(0.58, 0.66));
	}

	if (shallowPattern < 4)
	{
	   if (shallowPattern >1)
	   {	
	      rmRiverSetShallowRadius(singleRiver, rmRandInt(9, 12));
	      rmRiverAddShallow(singleRiver, rmRandFloat(0.05, 0.2)); 

	      rmRiverSetShallowRadius(singleRiver, rmRandInt(9, 12));
	      rmRiverAddShallow(singleRiver, rmRandFloat(0.8, 0.95));
	   }
	}

	if (shallowPattern > 3)
	{	
	   rmRiverSetShallowRadius(singleRiver, rmRandInt(9, 12));
	   rmRiverAddShallow(singleRiver, rmRandFloat(0.05, 0.2)); 

	   rmRiverSetShallowRadius(singleRiver, rmRandInt(9, 12));
	   rmRiverAddShallow(singleRiver, rmRandFloat(0.8, 0.95));
	}

	if (shallowPattern > 2)
	{
	   if (shallowPattern < 5)
	   {	
	      rmRiverSetShallowRadius(singleRiver, rmRandInt(9, 12));
	      rmRiverAddShallow(singleRiver, 0.5);
	   }
	}

	rmRiverSetBankNoiseParams(singleRiver, 0.07, 2, 1.5, 10.0, 0.667, 3.0);
	rmRiverBuild(singleRiver);
   }


// Trade Routes
if (trPattern == 2) // 2 opposite inner semicircular routes
{
   // first route
   int tradeRouteID = rmCreateTradeRoute();
   if (axisChance == 1) 
   {	
	rmAddTradeRouteWaypoint(tradeRouteID, 0.54, 0.81);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.67, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.69, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.67, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.54, 0.19);
   }
   else 
   {	
	rmAddTradeRouteWaypoint(tradeRouteID, 0.19, 0.54);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.40, 0.67);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.5, 0.69);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.60, 0.69);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.81, 0.54);
   }
   rmBuildTradeRoute(tradeRouteID, "dirt");

   // second route
   int tradeRouteID2 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.46, 0.19);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.33, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.31, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.33, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.46, 0.81);
   }
   else
   {
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.19, 0.46);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.40, 0.33);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.5, 0.31);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.60, 0.33);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.81, 0.46);
   }
   rmBuildTradeRoute(tradeRouteID2, "carolinas\trade_route");	
}
else if (trPattern == 3)  // one 'circular' inner route
{
   int tradeRouteID3 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {	
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.51, 0.8);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.66, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.68, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.66, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.5, 0.2);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.34, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.32, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.34, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.495, 0.8);
   }
   else 
   {	
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.2, 0.51);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.40, 0.66);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.5, 0.68);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.60, 0.66);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.8, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.60, 0.34);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.5, 0.32);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.40, 0.34);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.2, 0.49);
   }
   rmBuildTradeRoute(tradeRouteID3, "dirt");
}
else if (trPattern == 4)  // two 'diagonal'
{
   int tradeRouteID4 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.67, 1.0);
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.6, 0.62);
	if(variantChance == 1)
	{
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.67, 0.55);
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.67, 0.45);
	}
	else
	{
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.62, 0.55);
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.62, 0.45);
	}
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.6, 0.38);
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.67, 0.0);
   }
   else if (axisChance == 2) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID4, 1.0, 0.67);
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.62, 0.6);
	if(variantChance == 1)
	{
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.55, 0.67);
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.45, 0.67);
	}
	else
	{
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.55, 0.62);
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.45, 0.62);
	}
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.38, 0.6);
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.0, 0.67);
   }
   rmBuildTradeRoute(tradeRouteID4, "carolinas\trade_route");

   int tradeRouteID4A = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
     rmAddTradeRouteWaypoint(tradeRouteID4A, 0.33, 1.0);
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.4, 0.62);
	if(variantChance == 1)
	{
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.33, 0.55);
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.33, 0.45);
	}
	else
	{
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.38, 0.55);
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.38, 0.45);
	}
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.4, 0.38);
      rmAddTradeRouteWaypoint(tradeRouteID4A, 0.33, 0.0);
   }
   else if (axisChance == 2) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID4A, 1.0, 0.33);
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.62, 0.4);
	if(variantChance == 1)
	{
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.55, 0.33);
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.45, 0.33);
	}
	else
	{
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.55, 0.38);
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.45, 0.38);
	}
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.38, 0.4);
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.0, 0.33);
   }
   rmBuildTradeRoute(tradeRouteID4A, "dirt");
}
else if (trPattern == 5)  // two 'parabolas'
{
   int tradeRouteID5 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.68, 0.85);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.6, 0.62);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.54, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.6, 0.38);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.68, 0.15);
   }
   else if (axisChance == 2) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.85, 0.68);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.62, 0.6);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.5, 0.54);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.38, 0.6);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.15, 0.68);
   }
   rmBuildTradeRoute(tradeRouteID5, "carolinas\trade_route");

   int tradeRouteID5A = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
      rmAddTradeRouteWaypoint(tradeRouteID5A, 0.32, 0.85);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.4, 0.62);
      rmAddTradeRouteWaypoint(tradeRouteID5A, 0.46, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.4, 0.38);
      rmAddTradeRouteWaypoint(tradeRouteID5A, 0.32, 0.15);
   }
   else if (axisChance == 2) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.85, 0.32);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.62, 0.4);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.5, 0.46);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.38, 0.4);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.15, 0.32);
   }
   rmBuildTradeRoute(tradeRouteID5A, "dirt");
}
else if (trPattern == 6)  // one diagonal
{
   int tradeRouteID6 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.5, 0.0);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.48, 0.2);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.52, 0.35);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.5, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.48, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.52, 0.8);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.5, 1.0);
   }
   else
   {
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.0, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.2, 0.48);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.35, 0.52);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.5, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.65, 0.48);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.8, 0.52);
	rmAddTradeRouteWaypoint(tradeRouteID6, 1.0, 0.5);
   }
   rmBuildTradeRoute(tradeRouteID6, "carolinas\trade_route");	
}
else if (trPattern == 7) // 2 intersecting 'parabolas'
{
   // first route
   int tradeRouteID7 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.4, 1.0);	
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.58, 0.82);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.66, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.68, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.66, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.58, 0.18);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.4, 0.0);
   }
   else 
   {	
	rmAddTradeRouteWaypoint(tradeRouteID7, 1.0, 0.4);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.82, 0.58);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.60, 0.66);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.5, 0.68);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.40, 0.66);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.18, 0.58);
	rmAddTradeRouteWaypoint(tradeRouteID7, 0.0, 0.4);
   }
   rmBuildTradeRoute(tradeRouteID7, "dirt");

   // second route
   int tradeRouteID7A = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.6, 0.0);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.42, 0.18);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.34, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.32, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.34, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.42, 0.82);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.6, 1.0);
   }
   else
   {
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.0, 0.6);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.18, 0.42);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.40, 0.34);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.5, 0.32);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.60, 0.34);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 0.82, 0.42);
	rmAddTradeRouteWaypoint(tradeRouteID7A, 1.0, 0.6);
   }
   rmBuildTradeRoute(tradeRouteID7A, "carolinas\trade_route");	
}
else if (trPattern == 8)  // one 'circular' outside route
{
   int tradeRouteID8 = rmCreateTradeRoute();
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.0, 0.51); 
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.06, 0.6); 
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.10, 0.68); 
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.18, 0.82);  
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.32, 0.90);
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.5, 0.95); 
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.68, 0.90);
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.82, 0.82);  
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.9, 0.7);
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.95, 0.5); 
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.9, 0.3);
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.82, 0.18);   
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.68, 0.10);
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.5, 0.05);  
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.32, 0.10);
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.17, 0.17);  
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.10, 0.32); 
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.06, 0.4); 
   rmAddTradeRouteWaypoint(tradeRouteID8, 0.0, 0.49); 
   rmBuildTradeRoute(tradeRouteID8, "dirt");
}
else if (trPattern == 9)  // 2 'semi-circular' outside routes
{
   int tradeRouteID9 = rmCreateTradeRoute();
   if (axisChance == 2)
   {  
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.0, 0.525); 
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.06, 0.58); 
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.10, 0.68); 
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.18, 0.82);  
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.32, 0.90);
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.5, 0.95); 
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.68, 0.90);
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.82, 0.82); 
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.9, 0.7);
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.94, 0.58); 
      rmAddTradeRouteWaypoint(tradeRouteID9, 1.0, 0.525);
   }
   else
   {  
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.525, 1.0); 
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.58, 0.94); 
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.68, 0.90);
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.82, 0.82);  
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.9, 0.7);
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.97, 0.5);
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.9, 0.3);
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.82, 0.18);
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.68, 0.10);
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.58, 0.06); 
      rmAddTradeRouteWaypoint(tradeRouteID9, 0.525, 0.0); 
   }
   rmBuildTradeRoute(tradeRouteID9, "carolinas\trade_route");

   // second route
   int tradeRouteID9A = rmCreateTradeRoute();
   if (axisChance == 2)
   { 
      rmAddTradeRouteWaypoint(tradeRouteID9A, 1.0, 0.475);
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.94, 0.42);  
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.9, 0.3);
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.82, 0.18);   
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.68, 0.10);
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.5, 0.05);  
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.32, 0.10);
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.17, 0.17);  
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.10, 0.32); 
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.06, 0.42);  
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.0, 0.475); 
   }
   else
   {
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.475, 0.0);
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.42, 0.06);   
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.32, 0.10);
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.17, 0.17);  
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.10, 0.32);  
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.03, 0.5); 
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.10, 0.68); 
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.18, 0.82);  
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.32, 0.90);
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.42, 0.94); 
      rmAddTradeRouteWaypoint(tradeRouteID9A, 0.475, 1.0);  
   }
   rmBuildTradeRoute(tradeRouteID9A, "dirt");
}
else if (trPattern == 0)  // one 'circular' middle route
{
   int tradeRouteID0 = rmCreateTradeRoute();
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.16, 0.508);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.24, 0.75);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.5, 0.84);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.76, 0.76);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.84, 0.5);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.76, 0.26);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.5, 0.16);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.24, 0.24);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.16, 0.492);
   rmBuildTradeRoute(tradeRouteID0, "dirt");
}
else if (trPattern == 1)  // 2 'semicircular' middle routes
{
   int tradeRouteID1 = rmCreateTradeRoute();
   int tradeRouteID1A = rmCreateTradeRoute();
   if (axisChance == 2)
   {
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.165, 0.54);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.25, 0.74);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.5, 0.835);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.74, 0.75);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.835, 0.54);
      rmBuildTradeRoute(tradeRouteID1, "carolinas\trade_route");	

      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.835, 0.46);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.74, 0.25);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.5, 0.165);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.25, 0.26);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.165, 0.46);
      rmBuildTradeRoute(tradeRouteID1A, "dirt");
   }
   else if (axisChance == 1)
   {
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.54, 0.835);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.74, 0.75);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.835, 0.5);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.75, 0.26);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.54, 0.165);
      rmBuildTradeRoute(tradeRouteID1, "carolinas\trade_route");	

      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.46, 0.165);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.26, 0.25);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.165, 0.5);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.25, 0.74);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.46, 0.835);
      rmBuildTradeRoute(tradeRouteID1A, "dirt");
   }
}

// Trade sockets
   int socketID=rmCreateObjectDef("sockets to dock Trade Posts");
   rmAddObjectDefItem(socketID, "SocketTradeRoute", 1, 0.0);
   rmSetObjectDefAllowOverlap(socketID, true);
   rmAddObjectDefToClass(socketID, rmClassID("importantItem"));
   rmSetObjectDefMinDistance(socketID, 0.0);
   rmSetObjectDefMaxDistance(socketID, 6.0);

if (trPattern == 2) // 2 opposite inner semicircular routes
{
   // add the meeting poles along the trade route.
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID);
   vector socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.17);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   if (socketPattern == 1)
   { 
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID, 0.83);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   // change the trade route for the new sockets
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID2);
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID2, 0.83);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   if (socketPattern == 1)
   { 
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID2, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID2, 0.17);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
}
else if (trPattern == 3) // inner circle
{
   if (socketPattern == 1)
   {
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID3);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.09);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.25);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.41);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.59);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.75);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.91);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
   else if (socketPattern == 2)
   {
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID3);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.15);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.35);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.65);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID3, 0.85);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
}
else if (trPattern == 4) //  2 diagonal
{
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID4);

   if (socketPattern == 1)
   { 
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4, 0.12);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4, 0.88);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
   else
   {
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4, 0.17);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4, 0.83);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }

   // change the trade route for the new sockets
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID4A);
   if (socketPattern == 1)
   {
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4A, 0.88);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
 
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4A, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
  
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4A, 0.12);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
   else
   {
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4A, 0.83);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID4A, 0.17);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
}
else if (trPattern == 5) //  2 parabolas
{
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID5);
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID5, 0.17);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   if (socketPattern == 1)
   { 
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID5, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID5, 0.83);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   // change the trade route for the new sockets
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID5A);
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID5A, 0.83);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   if (socketPattern == 1)
   { 
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID5A, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID5A, 0.17);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
}
else if(trPattern == 6) // one diagonal
{
   if (socketPattern == 1)
   {
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID6);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.09);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.25);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.41);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.59);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.75);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.91);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
   else if (socketPattern == 2)
   {
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID6);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.12);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
 
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.31);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.69);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID6, 0.88);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
}
else if (trPattern == 7) // 2 intersecting parabolas
{
   // add the meeting poles along the trade route.
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID7);
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID7, 0.21);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   if (socketPattern == 1)
   { 
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID7, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID7, 0.79);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   // change the trade route for the new sockets
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID7A);
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID7A, 0.79);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   if (socketPattern == 1)
   { 
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID7A, 0.5);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID7A, 0.21);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
}
else if (trPattern == 8) // outer ring
{ 
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID8);
   if (socketPattern == 1) // 6 or 10 sockets
   {
      if (cNumberNonGaiaPlayers < 6)  // 6 sockets    
      {
 	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.005);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.167);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.333);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.505);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.667);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.833);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
      }
      else // over 5 players, 10 sockets 
      {
	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.05);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.15);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.25);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.35);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.45);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	
	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.55);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.65);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.75);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.85);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.95);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
      }	
   }
   else if (socketPattern == 2) // 8 sockets or 12 sockets    
   {
      if (cNumberNonGaiaPlayers < 6)  // 8 sockets 
      { 
	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.063);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.188);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.313);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.438);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.563);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	
	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.688);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.813);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.938);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	}
	else // over 5 players, 12 sockets
	{
	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.025);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.11);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.191);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.272);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.353);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.434);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.525);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.606);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.687);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.768);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.849);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

	    socketLoc = rmGetTradeRouteWayPoint(tradeRouteID8, 0.930);
	    rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
      }
   }
}
else if (trPattern == 9) //  2 outer semicircles
{
   if (socketPattern == 1) // 6 sockets
   { 
      if (variantChance == 1)
	{
          rmSetObjectDefTradeRouteID(socketID, tradeRouteID9);
          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.1);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.43);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.76);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

          // change the trade route for the new sockets
          rmSetObjectDefTradeRouteID(socketID, tradeRouteID9A);
          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.1);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.43);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
 
          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.76);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	 }
	 else
	 {
          rmSetObjectDefTradeRouteID(socketID, tradeRouteID9);
          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.25);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.5);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.75);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

          // change the trade route for the new sockets
          rmSetObjectDefTradeRouteID(socketID, tradeRouteID9A);
          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.25);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.5);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

          socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.75);
          rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
	 }
   }
   else if (socketPattern == 2) // 8 sockets
   { 
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID9);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.12);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.37);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.62);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9, 0.87);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      // change the trade route for the new sockets
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID9A);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.12);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.37);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.62);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID9A, 0.87);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
}
else if(trPattern == 0) // middle ring
{
   if (socketPattern == 1) // 6 sockets
   {
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID0);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.01);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.172);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
  
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.338);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.51);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.672);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.835);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
   else if (socketPattern == 2) // 8 sockets
   {
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID0);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.063);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.188);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.313);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.438);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.563);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.688);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.813);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.938);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
}
else if (trPattern == 1) //  2 middle semicircles
{
   if (socketPattern == 1) // 3 each
   { 
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID1);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.1);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.43);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.77);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      // change the trade route for the new sockets
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID1A);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.1);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.43);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.77);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
   if (socketPattern == 2) // 4 each
   { 
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID1);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.07);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.32);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.57);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.82);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      // change the trade route for the new sockets
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID1A);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.07);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.32);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.57);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.82);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
}

   //Text
   rmSetStatusText("",0.35);

// Starting TCs and units 		
   int startingUnits = rmCreateStartingUnitsObjectDef(5.0);
   rmSetObjectDefMinDistance(startingUnits, 5.0);
   rmSetObjectDefMaxDistance(startingUnits, 10.0);
   rmAddObjectDefConstraint(startingUnits, avoidAll);

   int startingTCID= rmCreateObjectDef("startingTC");
   rmSetObjectDefMaxDistance(startingTCID, 18.0);
   rmAddObjectDefConstraint(startingTCID, avoidAll);
   rmAddObjectDefConstraint(startingTCID, avoidTradeRoute);
   rmAddObjectDefConstraint(startingTCID, longAvoidImpassableLand );                
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

// Central features & patches, per map or variant
   // Center area
   int centerArea=rmCreateArea("TheCenter");
   rmSetAreaSize(centerArea, 0.2, 0.2);
   rmSetAreaLocation(centerArea, 0.5, 0.5);
   rmAddAreaToClass(centerArea, rmClassID("center")); 

   // Texas desert
   if (patternChance == 12)
   {
      if (lightingChance == 2)
 	{
         int desertID = rmCreateArea("desert");
         rmSetAreaLocation(desertID, 0.5, 0.5); 
         rmSetAreaWarnFailure(desertID, false);
         rmSetAreaSize(desertID, 0.7, 0.95);
         rmSetAreaCoherence(desertID, rmRandFloat(0.2, 0.5));
         rmSetAreaTerrainType(desertID, "texas\ground4_tex");
         rmAddAreaTerrainLayer(desertID, "texas\ground1_tex", 0, 4);
         rmAddAreaTerrainLayer(desertID, "texas\ground2_tex", 4, 8);
         rmAddAreaTerrainLayer(desertID, "texas\ground3_tex", 8, 12);
         rmSetAreaMix(desertID, "texas_dirt");
         rmBuildArea(desertID);
	}
   }

   // Center Highland or Canyon
   int makeCentralCliffArea = -1;
   if (makeCentralHighlands == 1)
	makeCentralCliffArea = 1;
   if (makeCentralCanyon == 1)
 	makeCentralCliffArea = 1;

   if (makeCentralCliffArea == 1)
   {
      int edgeChance = rmRandInt(1,3);
      reducedForest = 1;
      int centerHighlandsID=rmCreateArea("center highlands");
      rmSetAreaLocation(centerHighlandsID, 0.5, 0.5);
      rmSetAreaSize(centerHighlandsID, 0.028, 0.035);
	if (clearCenter == 1)
	{
	   if (rmRandInt(0,1) == 1)
            rmAddAreaToClass(centerHighlandsID, rmClassID("center"));
	}	
      rmAddAreaToClass(centerHighlandsID, rmClassID("classCliff"));
      if (patternChance == 12)
         rmSetAreaMix(centerHighlandsID, "texas_dirt");
      else if (patternChance == 8)
	   rmSetAreaTerrainType(centerHighlandsID, "rockies\groundsnow1_roc");
	else 
         rmSetAreaMix(centerHighlandsID, baseType);
      rmSetAreaCliffType(centerHighlandsID, cliffType);
      rmSetAreaCliffPainting(centerHighlandsID, false, true, true, 1.5, true);
	if (edgeChance == 1)
         rmSetAreaCliffEdge(centerHighlandsID, 3, 0.29, 0.1, 0.5, 0);
	else if (edgeChance == 2)
         rmSetAreaCliffEdge(centerHighlandsID, 4, 0.21, 0.1, 0.5, 0);
	else if (edgeChance == 3)
         rmSetAreaCliffEdge(centerHighlandsID, 2, 0.45, 0.1, 0.5, 0);
	if (makeCentralHighlands == 1)
	   rmSetAreaCliffHeight(centerHighlandsID, rmRandInt(6,8), 1.0, 0.5);
	else if (makeCentralCanyon == 1)
	   rmSetAreaCliffHeight(centerHighlandsID, -8, 1.0, 0.5);
      rmSetAreaSmoothDistance(centerHighlandsID, 12);
      rmSetAreaCoherence(centerHighlandsID, 0.5);
	rmSetAreaHeightBlend(centerHighlandsID, 1.0);
      rmAddAreaConstraint(centerHighlandsID, avoidTradeRoute);
      rmAddAreaConstraint(centerHighlandsID, avoidSocket);
      rmBuildArea(centerHighlandsID);
      makeLake = 0;
   }

   // Center mountains
   int numMt = -1;
   if (mtPattern == 1)
 	numMt = 1;
   else if (mtPattern == 2)
 	numMt = 2;	   
   else
 	numMt = rmRandInt(4,7);

   if (centerMt == 1)
   {
      reducedForest = 1;
	for (i=0; <numMt)   
      { 
         int mtPatchID = rmCreateArea("mt patch"+i); 
         rmAddAreaToClass(mtPatchID, rmClassID("classHill"));
         rmAddAreaToClass(mtPatchID, rmClassID("classPatch"));
	   if (clearCenter == 1)
	   {
	      if (rmRandInt(0,1) == 1)
	         rmAddAreaToClass(mtPatchID, rmClassID("center"));
	   }
 	   if (patternChance == 8) // Rockies
	   {
            rmSetAreaTerrainType(mtPatchID, "rockies\groundsnow1_roc");
            rmAddAreaTerrainLayer(mtPatchID, "rockies\groundsnow8_roc", 0, 3);
            rmAddAreaTerrainLayer(mtPatchID, "rockies\groundsnow7_roc", 3, 5);
            rmAddAreaTerrainLayer(mtPatchID, "rockies\groundsnow6_roc", 5, 7);
	   }
	   if (patternChance == 20)  // Yukon Tundra
	   {
            rmSetAreaTerrainType(mtPatchID, "yukon\ground1_yuk");
            rmAddAreaTerrainLayer(mtPatchID, "yukon\ground5_yuk", 0, 2);
            rmAddAreaTerrainLayer(mtPatchID, "yukon\ground4_yuk", 2, 4);
            rmAddAreaTerrainLayer(mtPatchID, "yukon\ground8_yuk", 4, 6);
	   }
	   if (patternChance == 19) // Andes
	   {
            rmSetAreaTerrainType(mtPatchID, "rockies\groundsnow1_roc");
            rmAddAreaTerrainLayer(mtPatchID, "patagonia\ground_snow1_pat", 0, 4);
            rmAddAreaTerrainLayer(mtPatchID, "patagonia\ground_snow2_pat", 4, 7);
            rmAddAreaTerrainLayer(mtPatchID, "patagonia\ground_snow2_pat", 7, 10);
	   }
 	   if (patternChance == 7) // Yukon
	   {
            rmSetAreaTerrainType(mtPatchID, "rockies\groundsnow1_roc");
	   }
         rmSetAreaWarnFailure(mtPatchID, false);
 	   if (mtPattern == 1)
	   {
            rmSetAreaSize(mtPatchID, 0.032, 0.039);
            rmSetAreaLocation(mtPatchID, 0.5, 0.5);
		if (variantChance == 1)
		{
               rmSetAreaMinBlobs(mtPatchID, 6);
               rmSetAreaMaxBlobs(mtPatchID, 14);
               rmSetAreaMinBlobDistance(mtPatchID, 30.0);
               rmSetAreaMaxBlobDistance(mtPatchID, 45.0);
		}
	   }
 	   else if (mtPattern == 2)
	   {
            rmSetAreaSize(mtPatchID, 0.015, 0.02);
		if (variantChance == 1)
		{
               rmSetAreaMinBlobs(mtPatchID, 6);
               rmSetAreaMaxBlobs(mtPatchID, 12);
               rmSetAreaMinBlobDistance(mtPatchID, 26.0);
               rmSetAreaMaxBlobDistance(mtPatchID, 40.0);
		}
	   }
	   else if (mtPattern == 3)
	   {
            rmSetAreaMinBlobs(mtPatchID, 4);
            rmSetAreaMaxBlobs(mtPatchID, 6);
            rmSetAreaMinBlobDistance(mtPatchID, 15.0);
            rmSetAreaMaxBlobDistance(mtPatchID, 20.0);
            rmSetAreaSize(mtPatchID, rmAreaTilesToFraction(500), rmAreaTilesToFraction(1050));
	   }
	   else if (mtPattern == 4)
	   {
            rmSetAreaMinBlobs(mtPatchID, 1);
            rmSetAreaMaxBlobs(mtPatchID, 3);
            rmSetAreaMinBlobDistance(mtPatchID, 30.0);
            rmSetAreaMaxBlobDistance(mtPatchID, 40.0);
            rmSetAreaSize(mtPatchID, rmAreaTilesToFraction(600), rmAreaTilesToFraction(1100));
	   }
         rmSetAreaElevationType(mtPatchID, cElevTurbulence);
	   rmSetAreaElevationVariation(mtPatchID, rmRandInt(2, 3));
	   rmSetAreaCoherence(mtPatchID, rmRandFloat(0.4, 0.8));
	   rmSetAreaBaseHeight(mtPatchID, rmRandInt(8, 10));
	   rmSetAreaElevationPersistence(mtPatchID, rmRandFloat(0.5, 0.8));
	   if (rmRandInt(1,3) == 3)
            rmSetAreaSmoothDistance(mtPatchID, rmRandInt(8, 20));
         rmAddAreaConstraint(mtPatchID, avoidTradeRoute);
         rmAddAreaConstraint(mtPatchID, avoidSocket);
         rmAddAreaConstraint(mtPatchID, medHillConstraint);
         rmAddAreaConstraint(mtPatchID, circleConstraintMt);
         rmAddAreaConstraint(mtPatchID, farPlayerConstraint);
         rmBuildArea(mtPatchID);
      }
   }
  
   if (forestMt == 1) // green hill forest
   {
      reducedForest = 1;
	for (i=0; <numMt)   
      { 	
         int hillPatchID = rmCreateArea("green hill"+i); 
         rmAddAreaToClass(hillPatchID, rmClassID("classHill"));
         rmAddAreaToClass(hillPatchID, rmClassID("classPatch"));
         rmSetAreaWarnFailure(hillPatchID, false);
         rmSetAreaForestType(hillPatchID, forestType);
         rmSetAreaForestDensity(hillPatchID, rmRandFloat(0.3, 0.5));
         rmSetAreaForestClumpiness(hillPatchID, rmRandFloat(0.5, 0.8));
         rmSetAreaForestUnderbrush(hillPatchID, rmRandFloat(0.0, 0.3));
 	   if (mtPattern == 1)
	   {
            rmSetAreaSize(hillPatchID, 0.032, 0.039);
            rmSetAreaLocation(hillPatchID, 0.5, 0.5);
		if (variantChance == 1)
		{
               rmSetAreaMinBlobs(hillPatchID, 6);
               rmSetAreaMaxBlobs(hillPatchID, 12);
               rmSetAreaMinBlobDistance(hillPatchID, 32.0);
               rmSetAreaMaxBlobDistance(hillPatchID, 45.0);
		}
	   }
 	   else if (mtPattern == 2)
	   {
            rmSetAreaSize(hillPatchID, 0.014, 0.018);
		if (variantChance == 1)
		{
               rmSetAreaMinBlobs(hillPatchID, 6);
               rmSetAreaMaxBlobs(hillPatchID, 14);
               rmSetAreaMinBlobDistance(hillPatchID, 26.0);
               rmSetAreaMaxBlobDistance(hillPatchID, 40.0);
		}
	   }
	   else if (mtPattern == 3)
	   {
            rmSetAreaMinBlobs(hillPatchID, 4);
            rmSetAreaMaxBlobs(hillPatchID, 6);
            rmSetAreaMinBlobDistance(hillPatchID, 15.0);
            rmSetAreaMaxBlobDistance(hillPatchID, 20.0);
            rmSetAreaSize(hillPatchID, rmAreaTilesToFraction(400), rmAreaTilesToFraction(950));
	   }
	   else if (mtPattern == 4)
	   {
            rmSetAreaMinBlobs(hillPatchID, 1);
            rmSetAreaMaxBlobs(hillPatchID, 3);
            rmSetAreaMinBlobDistance(hillPatchID, 30.0);
            rmSetAreaMaxBlobDistance(hillPatchID, 40.0);
            rmSetAreaSize(hillPatchID, rmAreaTilesToFraction(400), rmAreaTilesToFraction(950));
	   }
         rmSetAreaElevationType(hillPatchID, cElevTurbulence);
         rmSetAreaElevationVariation(hillPatchID, rmRandInt(2, 3));
	   rmSetAreaElevationPersistence(hillPatchID, rmRandFloat(0.5, 0.8));
         rmSetAreaCoherence(hillPatchID, rmRandFloat(0.4, 0.8));
         rmSetAreaBaseHeight(hillPatchID, rmRandInt(8,10));
	   if (rmRandInt(1,3) == 3)
            rmSetAreaSmoothDistance(hillPatchID, rmRandInt(10, 20));
         rmAddAreaConstraint(hillPatchID, avoidTradeRoute);
         rmAddAreaConstraint(hillPatchID, avoidSocket);
         rmAddAreaConstraint(hillPatchID, longHillConstraint);
         rmAddAreaConstraint(hillPatchID, circleConstraintMt);
         rmAddAreaConstraint(hillPatchID, farPlayerConstraint);
         rmBuildArea(hillPatchID);
	}  
   }

   // Snow patch for Rockies, central highlands
   if (patternChance == 8)  // Rockies
   {
	if (makeCentralCliffArea == 1)
	{
         int snowPatch2ID = rmCreateArea("snow patch 2"); 
         rmAddAreaToClass(snowPatch2ID, rmClassID("classHill"));
         rmAddAreaToClass(snowPatch2ID, rmClassID("classPatch"));
         rmSetAreaLocation(snowPatch2ID, 0.5, 0.5); 
         rmSetAreaWarnFailure(snowPatch2ID, false);
         rmSetAreaSize(snowPatch2ID, 0.047, 0.048);
         rmSetAreaElevationType(snowPatch2ID, cElevTurbulence);
	   rmSetAreaElevationVariation(snowPatch2ID, rmRandInt(2, 3));
	   rmSetAreaCoherence(snowPatch2ID, rmRandFloat(0.4, 0.8));
	   if (rmRandInt(1,3) == 3)
            rmSetAreaSmoothDistance(snowPatch2ID, rmRandInt(8, 20));
         rmSetAreaTerrainType(snowPatch2ID, "rockies\groundsnow1_roc");
         rmAddAreaTerrainLayer(snowPatch2ID, "rockies\groundsnow8_roc", 0, 5);
         rmAddAreaTerrainLayer(snowPatch2ID, "rockies\groundsnow7_roc", 5, 9);
         rmAddAreaTerrainLayer(snowPatch2ID, "rockies\groundsnow6_roc", 9, 13);
         rmAddAreaConstraint(snowPatch2ID, avoidTradeRoute);
         rmAddAreaConstraint(snowPatch2ID, avoidSocket);
         rmBuildArea(snowPatch2ID); 
	}
   }

   // Ice patch - Great Lakes Winter, Yukon or Yukon Tundra
   if (makeIce == 1)
   {
      nativeNumber = 2;
      int icePatchID = rmCreateArea("ice patch"); 
      rmAddAreaToClass(icePatchID, rmClassID("classIce"));
      rmAddAreaToClass(icePatchID, rmClassID("center"));
	if (variantChance == 2)
	   rmAddAreaToClass(icePatchID, rmClassID("classHill"));
      rmSetAreaLocation(icePatchID, 0.5, 0.5); 
      rmSetAreaWarnFailure(icePatchID, false);
      rmSetAreaSize(icePatchID, 0.03, 0.045);
      rmSetAreaCoherence(icePatchID, rmRandFloat(0.6,0.9));
      rmSetAreaMix(icePatchID, "great_lakes_ice");
      rmSetAreaBaseHeight(icePatchID, 1.0);
      rmSetAreaElevationVariation(icePatchID, 0.0);
      rmAddAreaConstraint(icePatchID, avoidTradeRoute);
      rmAddAreaConstraint(icePatchID, avoidSocket);
      rmBuildArea(icePatchID); 
	
	int iceHole = rmRandInt(1,2); 
	if (iceHole == 1)
	{
         int waterPatchID = rmCreateArea("water patch", rmAreaID("ice patch")); 
         rmAddAreaToClass(waterPatchID, rmClassID("classPatch"));
         rmSetAreaWarnFailure(waterPatchID, false);
         rmSetAreaSize(waterPatchID, 0.005, 0.02);
         rmSetAreaCoherence(waterPatchID, rmRandFloat(0.2,0.8));
         rmSetAreaWaterType(waterPatchID, "great lakes ice");
         rmSetAreaBaseHeight(waterPatchID, 1.0);
         rmBuildArea(waterPatchID); 
	}
   }

   // Center lake      
   if (makeLake == 1)
   {
	int lakePattern = rmRandInt(1,3);
      nativeNumber = 2;
	int smalllakeID=rmCreateArea("small lake");
      rmSetAreaWaterType(smalllakeID, pondType);
      rmSetAreaBaseHeight(smalllakeID, baseHt);
	if (lakePattern == 1)
	{
	   if (patternChance == 3)
            rmSetAreaSize(smalllakeID, rmAreaTilesToFraction(2000), rmAreaTilesToFraction(3000));
	   else
            rmSetAreaSize(smalllakeID, rmAreaTilesToFraction(1200), rmAreaTilesToFraction(2200));
         rmSetAreaMinBlobs(smalllakeID, 1);
         rmSetAreaMaxBlobs(smalllakeID, 3);
         rmSetAreaMinBlobDistance(smalllakeID, 12.0);
         rmSetAreaMaxBlobDistance(smalllakeID, 18.0);
         rmSetAreaCoherence(smalllakeID, rmRandFloat(0.4,0.8));
	}
	else if (lakePattern == 2)
	{
	   if (patternChance == 3)
            rmSetAreaSize(smalllakeID, rmAreaTilesToFraction(2500), rmAreaTilesToFraction(4000));
	   else
            rmSetAreaSize(smalllakeID, rmAreaTilesToFraction(1200), rmAreaTilesToFraction(2500));
         rmSetAreaMinBlobs(smalllakeID, 5);
         rmSetAreaMaxBlobs(smalllakeID, 12);
         rmSetAreaMinBlobDistance(smalllakeID, 25.0);
         rmSetAreaMaxBlobDistance(smalllakeID, 40.0);
         rmSetAreaCoherence(smalllakeID, rmRandFloat(0.2,0.5));
	}
	else if (lakePattern == 3)
	{
	   if (patternChance == 3)
            rmSetAreaSize(smalllakeID, rmAreaTilesToFraction(2500), rmAreaTilesToFraction(4000));
	   else
            rmSetAreaSize(smalllakeID, rmAreaTilesToFraction(1200), rmAreaTilesToFraction(2500));
         rmSetAreaMinBlobs(smalllakeID, 3);
         rmSetAreaMaxBlobs(smalllakeID, 8);
         rmSetAreaMinBlobDistance(smalllakeID, 32.0);
         rmSetAreaMaxBlobDistance(smalllakeID, 45.0);
         rmSetAreaCoherence(smalllakeID, rmRandFloat(0.2,0.3));
	}
      rmAddAreaToClass(smalllakeID, lakeClass);
      rmAddAreaConstraint(smalllakeID, farPlayerConstraint);
      rmAddAreaConstraint(smalllakeID, avoidTradeRoute);
      rmAddAreaConstraint(smalllakeID, avoidSocket);
      rmSetAreaLocation(smalllakeID, 0.5, 0.5);
      rmSetAreaWarnFailure(smalllakeID, false);
      rmBuildArea(smalllakeID);
   }

   // Dirt patches for Sonora
   if (patternChance == 13)
   {
	for (i=0; <cNumberNonGaiaPlayers*6)   
      {
	   int dirtPatch=rmCreateArea("open dirt patch "+i);
         rmSetAreaWarnFailure(dirtPatch, false);
	   rmSetAreaSize(dirtPatch, rmAreaTilesToFraction(150), rmAreaTilesToFraction(230));
	   rmSetAreaTerrainType(dirtPatch, "sonora\ground7_son");
	   rmAddAreaToClass(dirtPatch, rmClassID("classPatch"));
	   rmSetAreaMinBlobs(dirtPatch, 1);
	   rmSetAreaMaxBlobs(dirtPatch, 5);
	   rmSetAreaMinBlobDistance(dirtPatch, 16.0);
	   rmSetAreaMaxBlobDistance(dirtPatch, 40.0);
	   rmSetAreaCoherence(dirtPatch, 0.0);
	   rmSetAreaSmoothDistance(dirtPatch, 10);
	   rmAddAreaConstraint(dirtPatch, shortAvoidImpassableLand);
	   rmAddAreaConstraint(dirtPatch, patchConstraint);
	   rmBuildArea(dirtPatch); 
      }
   }

   // Snow patches for Yukon Tundra
   if (patternChance == 20)
   { 
      for(i=1; <cNumberPlayers*4)
      {
         int patchAID=rmCreateArea("PatchA"+i);
         rmSetAreaSize(patchAID, rmAreaTilesToFraction(175), rmAreaTilesToFraction(250));
         rmAddAreaToClass(patchAID, rmClassID("classPatch"));
         rmSetAreaTerrainType(patchAID, "yukon\ground1_yuk");
         rmAddAreaTerrainLayer(patchAID, "yukon\ground5_yuk", 0, 2);
         rmAddAreaTerrainLayer(patchAID, "yukon\ground4_yuk", 2, 3);
         rmAddAreaTerrainLayer(patchAID, "yukon\ground8_yuk", 3, 4);
         rmSetAreaWarnFailure(patchAID, false);
         rmSetAreaMinBlobs(patchAID, 2);
         rmSetAreaMaxBlobs(patchAID, 3);
         rmSetAreaMinBlobDistance(patchAID, 12.0);
         rmSetAreaMaxBlobDistance(patchAID, 22.0);
         rmSetAreaCoherence(patchAID, 0.3);
         rmAddAreaConstraint(patchAID, playerConstraint);
         rmAddAreaConstraint(patchAID, shortAvoidImpassableLand);
         rmAddAreaConstraint(patchAID, patchConstraint);
         rmSetAreaWarnFailure(patchAID, false);
         rmBuildArea(patchAID);
      }
   }
 
   // Text
   rmSetStatusText("",0.40);

// NATIVE AMERICANS
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
   rmSetGroupingMinDistance(villageAID, 0.0);
   rmSetGroupingMaxDistance(villageAID, rmXFractionToMeters(0.09));
   rmAddGroupingConstraint(villageAID, avoidImpassableLand);
   rmAddGroupingConstraint(villageAID, avoidTradeRoute);
   rmAddGroupingConstraint(villageAID, avoidWater15);
   rmAddGroupingConstraint(villageAID, avoidNativesMed);
   rmAddGroupingConstraint(villageAID, playerConstraint);
   rmAddGroupingConstraint(villageAID, avoidIce);

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
   rmSetGroupingMaxDistance(villageDID, rmXFractionToMeters(0.09));
   rmAddGroupingConstraint(villageDID, avoidImpassableLand);
   rmAddGroupingConstraint(villageDID, avoidTradeRoute);
   rmAddGroupingConstraint(villageDID, avoidWater15);
   rmAddGroupingConstraint(villageDID, avoidNativesMed);
   rmAddGroupingConstraint(villageDID, playerConstraint);
   rmAddGroupingConstraint(villageDID, avoidIce);
   if (mtPattern > 2)
      rmAddGroupingConstraint(villageDID, shortHillConstraint);

   // Village B - randomly same or opposite village A
   int villageBID = -1;	
   villageType = rmRandInt(1,5);
   whichNative = rmRandInt(1,2);

   if (nativePattern == 1)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native cherokee village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native iroquois village "+villageType);
   }

   if (nativePattern == 2)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native comanche village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native lakota village "+villageType);
   }

   if (nativePattern == 3)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native cherokee village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native seminole village "+villageType);
   }

   if (nativePattern == 4)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native iroquois village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native lakota village "+villageType);
   }

   if (nativePattern == 5)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native iroquois village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native cree village "+villageType);
   }

   if (nativePattern == 6)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native nootka village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native cree village "+villageType);
   }

   if (nativePattern == 7)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native nootka village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native comanche village "+villageType);
   }

   if (nativePattern == 8)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native cree village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native lakota village "+villageType);
   }

   if (nativePattern == 9)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native comanche village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native seminole village "+villageType);
   }

   if (nativePattern == 10)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native aztec village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native comanche village "+villageType);
   }

   if (nativePattern == 11)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native maya village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native aztec village "+villageType);
   }

   if (nativePattern == 12)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native maya village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native carib village "+villageType);
   }

   if (nativePattern == 13)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native carib village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native tupi village "+villageType);
   }

   if (nativePattern == 14)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native inca village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native tupi village "+villageType);
   }

   if (nativePattern == 15)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native maya village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native inca village "+villageType);
   }

   if (nativePattern == 16)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native nootka village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native iroquois village "+villageType);
   }

   if (nativePattern == 17)
   {
      if (whichNative == 1)
	   villageBID = rmCreateGrouping("village B", "native aztec village "+villageType);
      else if (whichNative == 2)
	   villageBID = rmCreateGrouping("village B", "native inca village "+villageType);
   }
   rmAddGroupingToClass(villageBID, rmClassID("importantItem"));
   rmAddGroupingToClass(villageBID, rmClassID("natives"));
   rmSetGroupingMinDistance(villageBID, 0.0);
   rmSetGroupingMaxDistance(villageBID, rmXFractionToMeters(0.09));
   rmAddGroupingConstraint(villageBID, avoidImpassableLand);
   rmAddGroupingConstraint(villageBID, avoidTradeRoute);
   rmAddGroupingConstraint(villageBID, avoidWater15);
   rmAddGroupingConstraint(villageBID, avoidNatives);
   rmAddGroupingConstraint(villageBID, playerConstraint);

   // Village C // appears in center, variable, randomly same or opposite A and B
   int villageCID = -1;	
   villageType = rmRandInt(1,5);
   whichNative = rmRandInt(1,2);

   if (nativePattern == 1)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native cherokee village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native iroquois village "+villageType);
   }

   if (nativePattern == 2)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native comanche village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native lakota village "+villageType);
   }

   if (nativePattern == 3)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native cherokee village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native seminole village "+villageType);
   }

   if (nativePattern == 4)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native iroquois village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native lakota village "+villageType);
   }

   if (nativePattern == 5)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native iroquois village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native cree village "+villageType);
   }

   if (nativePattern == 6)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native nootka village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native cree village "+villageType);
   }

   if (nativePattern == 7)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native nootka village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native comanche village "+villageType);
   }

   if (nativePattern == 8)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native cree village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native lakota village "+villageType);
   }

   if (nativePattern == 9)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native comanche village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native seminole village "+villageType);
   }

   if (nativePattern == 10)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native comanche village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native aztec village "+villageType);
   }

   if (nativePattern == 11)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native maya village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native aztec village "+villageType);
   }

   if (nativePattern == 12)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native maya village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native carib village "+villageType);
   }

   if (nativePattern == 13)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native tupi village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native carib village "+villageType);
   }

   if (nativePattern == 14)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native tupi village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native inca village "+villageType);
   }

   if (nativePattern == 15)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native maya village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native inca village "+villageType);
   }

   if (nativePattern == 16)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native nootka village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native iroquois village "+villageType);
   }

   if (nativePattern == 17)
   {
      if (whichNative == 1)
	   villageCID = rmCreateGrouping("village C", "native aztec village "+villageType);
      else if (whichNative == 2)
	   villageCID = rmCreateGrouping("village C", "native inca village "+villageType);
   }
   rmAddGroupingToClass(villageCID, rmClassID("importantItem"));
   rmAddGroupingToClass(villageCID, rmClassID("natives"));
   rmSetGroupingMinDistance(villageCID, 0.0);
   rmSetGroupingMaxDistance(villageCID, rmXFractionToMeters(0.07));
   rmAddGroupingConstraint(villageCID, avoidImpassableLand);
   rmAddGroupingConstraint(villageCID, avoidWater10);
   rmAddGroupingConstraint(villageCID, avoidTradeRoute);
   rmAddGroupingConstraint(villageCID, avoidNatives);
   rmAddGroupingConstraint(villageCID, playerConstraint);
   if (mtPattern > 2)
      rmAddGroupingConstraint(villageCID, shortHillConstraint);

   // Placement of Native Americans
   if (trPattern > 7)
	endPosition = rmRandInt(1,2);
   if (trPattern == 2)
	endPosition = rmRandInt(2,3);
   if (trPattern == 3)
	endPosition = rmRandInt(2,3);
   if (trPattern == 0)
   {
	if (rmRandInt(1,2) == 1)
	   endPosition = 3;
	else
	   endPosition = 1;
   }
   if (trPattern == 1)
   {
	if (rmRandInt(1,2) == 1)
	   endPosition = 3;
	else
	   endPosition = 1;
   }

   if (nativeSetup < 4) 
   {
      if (axisChance == 1)
	{
	   if (endPosition == 1)
            rmPlaceGroupingAtLoc(villageAID, 0, 0.505, 0.73);
	   else if (endPosition == 2)
            rmPlaceGroupingAtLoc(villageAID, 0, 0.495, 0.82);
	   else
            rmPlaceGroupingAtLoc(villageAID, 0, 0.505, 0.91);
	}	 
      else
	{
	   if (endPosition == 1)
            rmPlaceGroupingAtLoc(villageAID, 0, 0.73, 0.505);
	   else if (endPosition == 2)
            rmPlaceGroupingAtLoc(villageAID, 0, 0.82, 0.495);
	   else
            rmPlaceGroupingAtLoc(villageAID, 0, 0.91, 0.505);
	}
         
      if (axisChance == 1)
	{
	   if (endPosition == 1)
            rmPlaceGroupingAtLoc(villageBID, 0, 0.495, 0.27);
	   else if (endPosition == 2)
            rmPlaceGroupingAtLoc(villageBID, 0, 0.505, 0.18);
	   else
            rmPlaceGroupingAtLoc(villageBID, 0, 0.495, 0.09);
	}
      else
	{
	   if (endPosition == 1)
            rmPlaceGroupingAtLoc(villageBID, 0, 0.27, 0.495);
	   else if (endPosition == 2)
            rmPlaceGroupingAtLoc(villageBID, 0, 0.18, 0.505);
	   else
            rmPlaceGroupingAtLoc(villageBID, 0, 0.09, 0.495);
	}
         
	if (nativeSetup < 2)
	{
         if (nativeNumber > 2)
            rmPlaceGroupingAtLoc(villageCID, 0, 0.5, 0.5);
	}
	else 
	{
	   rmSetGroupingMaxDistance(villageCID, rmXFractionToMeters(0.085));
         if (nativeNumber > 2)
	   {
		if (axisChance == 1)
		{
               rmPlaceGroupingAtLoc(villageCID, 0, 0.485, 0.51);
               rmPlaceGroupingAtLoc(villageCID, 0, 0.515, 0.49);
	      }
		else
		{
               rmPlaceGroupingAtLoc(villageCID, 0, 0.51, 0.515);
               rmPlaceGroupingAtLoc(villageCID, 0, 0.49, 0.485);
	      }
	   }
	}
   }
   else if (nativeSetup > 5)
   {
	if (nativeSetup == 7)
	{
         if (axisChance == 1)
	   {
	      if (endPosition == 1)
               rmPlaceGroupingAtLoc(villageDID, 0, 0.495, 0.75); 
	      else if (endPosition == 2)
               rmPlaceGroupingAtLoc(villageDID, 0, 0.505, 0.84); 
	      else
               rmPlaceGroupingAtLoc(villageDID, 0, 0.495, 0.93); 
	   }
         else
	   {
	      if (endPosition == 1)
               rmPlaceGroupingAtLoc(villageDID, 0, 0.745, 0.495);
	      else if (endPosition == 2)
               rmPlaceGroupingAtLoc(villageDID, 0, 0.84, 0.505);
	      else
              rmPlaceGroupingAtLoc(villageDID, 0, 0.93, 0.495);
	   }
            

         if (axisChance == 1)
	   {
	      if (endPosition == 1)
               rmPlaceGroupingAtLoc(villageDID, 0, 0.505, 0.25);
	      else if (endPosition == 2)
               rmPlaceGroupingAtLoc(villageDID, 0, 0.495, 0.16);
	      else
               rmPlaceGroupingAtLoc(villageDID, 0, 0.505, 0.07);
	   }            
         else
	   {
	      if (endPosition == 1)
               rmPlaceGroupingAtLoc(villageDID, 0, 0.25, 0.505);
	      else if (endPosition == 2)
               rmPlaceGroupingAtLoc(villageDID, 0, 0.16, 0.495);
	      else
               rmPlaceGroupingAtLoc(villageDID, 0, 0.07, 0.505);
	   }
            
	}
	if (nativeSetup == 8)
	{
	   rmSetGroupingMaxDistance(villageDID, rmXFractionToMeters(0.065));
         if (nativeNumber > 2)
	   {
		if (axisChance == 1)
		{
               rmPlaceGroupingAtLoc(villageDID, 0, 0.485, 0.49);
               rmPlaceGroupingAtLoc(villageDID, 0, 0.515, 0.51);
	      }
		else
		{
               rmPlaceGroupingAtLoc(villageDID, 0, 0.49, 0.515);
               rmPlaceGroupingAtLoc(villageDID, 0, 0.51, 0.485);
	      }
	   }
	}
	if (nativeSetup == 9)
	{
	   rmSetGroupingMaxDistance(villageDID, rmXFractionToMeters(0.065));
         if (nativeNumber > 2)
	   {
               rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.5);
	   }
	}
	if (nativeSetup < 12)
	{
         for(i=1; <cNumberPlayers) 
         {
            rmSetGroupingMinDistance(villageAID, 55.0);
            rmSetGroupingMaxDistance(villageAID, 80.0);           
   	      rmPlaceGroupingAtLoc(villageAID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	      if (nativeSetup == 10)
 	      {
               rmSetGroupingMinDistance(villageDID, 55.0);
               rmSetGroupingMaxDistance(villageDID, 80.0);      
		   rmPlaceGroupingAtLoc(villageDID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	      }
	      if (nativeSetup == 11)
		   rmPlaceGroupingAtLoc(villageAID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	   }
	}
      if (nativeSetup > 11) // setup 12 to 14
      {
         rmSetGroupingMaxDistance(villageAID, rmXFractionToMeters(0.065));
         rmAddGroupingConstraint(villageAID, nuggetPlayerConstraint);
         if (axisChance == 1)
	   {
		if (distChance < 6)
		{
               rmPlaceGroupingAtLoc(villageAID, 0, 0.33, 0.4);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.33, 0.6);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.67, 0.4);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.67, 0.6);
		}
		else
		{
               rmPlaceGroupingAtLoc(villageAID, 0, 0.13, 0.31);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.13, 0.69);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.87, 0.31);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.87, 0.69);
		}
	   }
	   else
	   {
		if (distChance < 6)
		{
               rmPlaceGroupingAtLoc(villageAID, 0, 0.4, 0.33);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.6, 0.33);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.4, 0.67);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.6, 0.67);
		}
		else
		{
               rmPlaceGroupingAtLoc(villageAID, 0, 0.31, 0.13);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.69, 0.13);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.31, 0.87);
               rmPlaceGroupingAtLoc(villageAID, 0, 0.69, 0.87);
		}
	   }
	   if (nativeSetup == 13) 
	   {
	      rmSetGroupingMaxDistance(villageDID, rmXFractionToMeters(0.065));
            if (nativeNumber > 2)
	      {
		   if (rmRandInt(1,2) == 1)
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.5);
		   else
		   {
		      if (axisChance == 1)
		      {
               	   rmPlaceGroupingAtLoc(villageDID, 0, 0.485, 0.49);
               	   rmPlaceGroupingAtLoc(villageDID, 0, 0.515, 0.51);
	      	}
			else
			{
           		   rmPlaceGroupingAtLoc(villageDID, 0, 0.49, 0.515);
           	         rmPlaceGroupingAtLoc(villageDID, 0, 0.51, 0.485);
	      	}
	         }
		}
	   }
	   if (nativeSetup == 14) 
	   {
            if (axisChance == 1)
	      {
	         if (endPosition == 1)
		   {
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.495, 0.75);
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.505, 0.25);
		   } 
   	         else if (endPosition == 2)
		   {
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.505, 0.84);
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.495, 0.16);
		   } 
	         else
		   {
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.505, 0.07);
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.495, 0.93);
		   } 
	      }
            else
	      {
	         if (endPosition == 1)
		   {
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.745, 0.495);
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.25, 0.505);
		   }
	         else if (endPosition == 2)
		   {
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.84, 0.505);
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.16, 0.495);
		   }
	         else
		   {
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.93, 0.495);
                  rmPlaceGroupingAtLoc(villageDID, 0, 0.07, 0.505);
		   }
	      }                
	   }
      }
   }
   else if (nativeSetup > 3) // setup 4 and 5
   {
      if (axisChance == 1)
	{
	   if (endPosition == 1)
	   {
            rmPlaceGroupingAtLoc(villageAID, 0, 0.5, 0.75);
		rmPlaceGroupingAtLoc(villageAID, 0, 0.5, 0.25);
	   }
	   else if (endPosition == 2)
	   {
            rmPlaceGroupingAtLoc(villageAID, 0, 0.5, 0.84);
            rmPlaceGroupingAtLoc(villageAID, 0, 0.5, 0.16);
	   }
	   else
	   {
            rmPlaceGroupingAtLoc(villageAID, 0, 0.5, 0.93);
		rmPlaceGroupingAtLoc(villageAID, 0, 0.5, 0.08);
	   }
	}          
      else
	{
	   if (endPosition == 1)
	   {
            rmPlaceGroupingAtLoc(villageAID, 0, 0.745, 0.5);
	      rmPlaceGroupingAtLoc(villageAID, 0, 0.25, 0.5);
	   }
	   else if (endPosition == 2)
	   {
            rmPlaceGroupingAtLoc(villageAID, 0, 0.84, 0.5);
		rmPlaceGroupingAtLoc(villageAID, 0, 0.16, 0.5);
	   }
	   else
	   {
            rmPlaceGroupingAtLoc(villageAID, 0, 0.93, 0.5);
		rmPlaceGroupingAtLoc(villageAID, 0, 0.07, 0.5);
	   }
	}       
         
	if (nativeSetup == 4)
	{
	   if (axisChance == 1)
	   {

            rmPlaceGroupingAtLoc(villageDID, 0, 0.485, 0.51);
            rmPlaceGroupingAtLoc(villageDID, 0, 0.515, 0.49);
         }
   	   else
	   {
            rmPlaceGroupingAtLoc(villageDID, 0, 0.51, 0.515);
            rmPlaceGroupingAtLoc(villageDID, 0, 0.49, 0.485);
	   }
	}
   	rmSetGroupingMaxDistance(villageDID, rmXFractionToMeters(0.085));
      if (axisChance == 1)
	{
         if (sidePosition == 1)
	   {
            rmPlaceGroupingAtLoc(villageDID, 0, 0.74, 0.5);
            rmPlaceGroupingAtLoc(villageDID, 0, 0.24, 0.5);
	   }
	   else if (sidePosition == 2)
	   {
            rmPlaceGroupingAtLoc(villageDID, 0, 0.84, 0.5);
            rmPlaceGroupingAtLoc(villageDID, 0, 0.16, 0.5);
	   }
	   else
	   {
            rmPlaceGroupingAtLoc(villageDID, 0, 0.93, 0.5);
            rmPlaceGroupingAtLoc(villageDID, 0, 0.08, 0.5);
	   }
      }
	else
	{
         if (sidePosition == 1)
	   {
            rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.75);
		rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.25);
	   }	   
	   else if (sidePosition == 2)
	   {
            rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.84);
		rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.16);
	   }
	   else
	   {
            rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.93);
		rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.08); 
         }
	}  
   }

   // Text
   rmSetStatusText("",0.50);

// Player Nuggets
   int playerNuggetID=rmCreateObjectDef("player nugget");
   rmAddObjectDefItem(playerNuggetID, "nugget", 1, 0.0);
   rmAddObjectDefToClass(playerNuggetID, rmClassID("classNugget"));
   rmSetObjectDefMinDistance(playerNuggetID, 35.0);
   rmSetObjectDefMaxDistance(playerNuggetID, 45.0);
   rmAddObjectDefConstraint(playerNuggetID, avoidStartingUnitsSmall);
   rmAddObjectDefConstraint(playerNuggetID, avoidTradeRoute);
   rmAddObjectDefConstraint(playerNuggetID, avoidSocket);
   rmAddObjectDefConstraint(playerNuggetID, avoidNugget);
   rmAddObjectDefConstraint(playerNuggetID, avoidWater10);

   for(i=1; <cNumberPlayers)
   {
 	rmSetNuggetDifficulty(1, 1);
	rmPlaceObjectDefAtLoc(playerNuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(playerNuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
   }

// Small Ponds for Bayou      
   if (patternChance == 3)
   {
	for (i=0; <cNumberNonGaiaPlayers*4)   
      {
	   int smallPond2ID=rmCreateArea("bigger small pond"+i);
	   rmSetAreaSize(smallPond2ID, rmAreaTilesToFraction(380), rmAreaTilesToFraction(500));
         rmSetAreaWaterType(smallPond2ID, pondType);
         rmSetAreaBaseHeight(smallPond2ID, baseHt);
         rmSetAreaMinBlobs(smallPond2ID, 5);
         rmSetAreaMaxBlobs(smallPond2ID, 7);
         rmSetAreaMinBlobDistance(smallPond2ID, 28.0);
         rmSetAreaMaxBlobDistance(smallPond2ID, 40.0);
         rmAddAreaToClass(smallPond2ID, lakeClass);
         rmAddAreaConstraint(smallPond2ID, avoidLakes);
         rmAddAreaConstraint(smallPond2ID, playerConstraint);
         rmAddAreaConstraint(smallPond2ID, avoidTradeRoute);
         rmAddAreaConstraint(smallPond2ID, avoidSocket);
         rmAddAreaConstraint(smallPond2ID, avoidAll);
         rmAddAreaConstraint(smallPond2ID, avoidNativesShort);
         rmAddAreaConstraint(smallPond2ID, centerConstraintFar);
         rmSetAreaCoherence(smallPond2ID, 0.1);
         rmSetAreaWarnFailure(smallPond2ID, false);
         rmBuildArea(smallPond2ID);
      }
	for (i=0; <cNumberNonGaiaPlayers*7)   
      {
	   int smallPondID=rmCreateArea("small pond"+i);
	   rmSetAreaSize(smallPondID, rmAreaTilesToFraction(190), rmAreaTilesToFraction(250));
         rmSetAreaWaterType(smallPondID, pondType);
         rmSetAreaBaseHeight(smallPondID, baseHt);
         rmSetAreaMinBlobs(smallPondID, 2);
         rmSetAreaMaxBlobs(smallPondID, 4);
         rmSetAreaMinBlobDistance(smallPondID, 6.0);
         rmSetAreaMaxBlobDistance(smallPondID, 12.0);
         rmAddAreaToClass(smallPondID, lakeClass);
         rmAddAreaConstraint(smallPondID, avoidLakes);
         rmAddAreaConstraint(smallPondID, playerConstraint);
         rmAddAreaConstraint(smallPondID, avoidTradeRoute);
         rmAddAreaConstraint(smallPondID, avoidSocket);
         rmAddAreaConstraint(smallPondID, avoidAll);
         rmAddAreaConstraint(smallPondID, avoidNativesShort);
         rmAddAreaConstraint(smallPondID, centerConstraintFar);
         rmSetAreaCoherence(smallPondID, rmRandFloat(0.2,0.8));
         rmSetAreaWarnFailure(smallPondID, false);
         rmBuildArea(smallPondID);
      }
   }

// Cliffs
   int cliffHt = -1;
   int failCount=0;
   int numTries=cNumberNonGaiaPlayers*14;

   int anotherChance = -1;
   anotherChance = rmRandInt(0,1);

   if (makeCliffs == 2)
   {
     if (anotherChance == 1)
        makeCliffs = 1;
     else
        makeCliffs = 0;
   } 

   if (makeCentralCliffArea == 1)
   {
	numTries=cNumberNonGaiaPlayers*10;
	cliffVariety = rmRandInt(1,5);
   }

   if (makeCliffs == 1)
   { 
	if (patternChance == 13) // for Sonora only
	{
	   // bigger mesas
	   for(i=0; <numTries)
	   {
		int cliffHeight=rmRandInt(0,10);
		int mesaID=rmCreateArea("mesa"+i);
		rmSetAreaSize(mesaID, rmAreaTilesToFraction(25), rmAreaTilesToFraction(160)); 
		rmSetAreaWarnFailure(mesaID, false);
		rmSetAreaCliffType(mesaID, "Sonora");
		rmAddAreaToClass(mesaID, rmClassID("canyon"));
		rmAddAreaToClass(mesaID, rmClassID("classCliff"));	
		rmSetAreaCliffEdge(mesaID, 1, 1.0, 0.1, 1.0, 0);
		if (cliffHeight <= 7)
		  rmSetAreaCliffHeight(mesaID, rmRandInt(5,9), 1.0, 1.0);
		else
		  rmSetAreaCliffHeight(mesaID, -10, 1.0, 1.0);
		rmAddAreaConstraint(mesaID, avoidCanyons);
		rmSetAreaMinBlobs(mesaID, 3);
		rmSetAreaMaxBlobs(mesaID, 5);
		rmSetAreaMinBlobDistance(mesaID, 3.0);
		rmSetAreaMaxBlobDistance(mesaID, 5.0);
		rmSetAreaCoherence(mesaID, 0.5);
		rmAddAreaConstraint(mesaID, playerConstraint); 
		rmAddAreaConstraint(mesaID, avoidSocket);
		rmAddAreaConstraint(mesaID, avoidNativesShort);
		rmAddAreaConstraint(mesaID, avoidWater20);
		rmAddAreaConstraint(mesaID, avoidTradeRoute);
		rmAddAreaConstraint(mesaID, shortAvoidSilver);
		if(rmBuildArea(mesaID)==false)
		{
			// Stop trying once we fail 3 times in a row.
			failCount++;
			if(failCount==2)
				break;
		}
		else
			failCount=0;
	   }
	// smaller mesas
      if (makeCentralCliffArea == 1)
	   numTries=cNumberNonGaiaPlayers*17;
      else
	   numTries=cNumberNonGaiaPlayers*21;

	   for(i=0; <numTries)
	   {
		int smallCliffHeight=rmRandInt(0,10);
		int smallMesaID=rmCreateArea("small mesa"+i);
		rmSetAreaSize(smallMesaID, rmAreaTilesToFraction(4), rmAreaTilesToFraction(8));  
		rmSetAreaWarnFailure(smallMesaID, false);
		rmSetAreaCliffType(smallMesaID, "Sonora");
		rmAddAreaToClass(smallMesaID, rmClassID("canyon"));
		rmAddAreaToClass(smallMesaID, rmClassID("classCliff"));	
		rmSetAreaCliffEdge(smallMesaID, 1, 1.0, 0.1, 1.0, 0);
		rmSetAreaCliffHeight(smallMesaID, rmRandInt(5,8), 1.0, 1.0);
		rmAddAreaConstraint(smallMesaID, shortAvoidCanyons);
		rmSetAreaMinBlobs(smallMesaID, 3);
		rmSetAreaMaxBlobs(smallMesaID, 5);
		rmSetAreaMinBlobDistance(smallMesaID, 3.0);
		rmSetAreaMaxBlobDistance(smallMesaID, 5.0);
		rmSetAreaCoherence(smallMesaID, 0.3);
		rmAddAreaConstraint(smallMesaID, mediumPlayerConstraint); 
		rmAddAreaConstraint(smallMesaID, avoidNativesShort); 
		rmAddAreaConstraint(smallMesaID, avoidSocket);
		rmAddAreaConstraint(smallMesaID, avoidWater10);
		rmAddAreaConstraint(smallMesaID, avoidTradeRoute);
		rmAddAreaConstraint(smallMesaID, shortAvoidSilver);
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
	else if (cliffVariety == 0) // a little like AOM Anatolia
	{
	   int gorgeHt=rmRandInt(-7,-4);
	   numTries = 3;
	   if (cNumberNonGaiaPlayers < 4)
	      numTries = 2;
	   if (cNumberNonGaiaPlayers > 5)
	      numTries = 4;

	   for(i=0; <numTries)
	   {
	   int gorgeID=rmCreateArea("gorge"+i);
         rmSetAreaWarnFailure(gorgeID, false); 
	   rmSetAreaSize(gorgeID, rmAreaTilesToFraction(1800), rmAreaTilesToFraction(2000));
	   rmSetAreaCliffType(gorgeID, cliffType);
	   rmAddAreaToClass(gorgeID, rmClassID("classCliff"));
	   rmSetAreaMinBlobs(gorgeID, 4);
	   rmSetAreaMaxBlobs(gorgeID, 6);
	   if (rmRandInt(1,3) == 1)
	      rmSetAreaCliffEdge(gorgeID, 6, 0.10, 0.2, 1.0, 0);
	   else
	   {
		if (rmRandInt(1,2) == 1) 
	         rmSetAreaCliffEdge(gorgeID, 5, 0.15, 0.15, 1.0, 0);
		else
	         rmSetAreaCliffEdge(gorgeID, 4, 0.17, 0.15, 1.0, 0);
	   }		
	   rmSetAreaCliffPainting(gorgeID, false, true, true, 1.5);
	   rmSetAreaMinBlobDistance(gorgeID, 20.0);
	   rmSetAreaMaxBlobDistance(gorgeID, 20.0);
	   rmSetAreaCoherence(gorgeID, rmRandFloat(0.0,0.2));
	   rmSetAreaSmoothDistance(gorgeID, rmRandInt(10,20));
	   rmSetAreaCliffHeight(gorgeID, gorgeHt, 1.0, 1.0);
	   rmSetAreaHeightBlend(gorgeID, 2);
	   rmAddAreaConstraint(gorgeID, cliffsAvoidCliffs);
         rmAddAreaConstraint(gorgeID, avoidImportantItem);
	   rmAddAreaConstraint(gorgeID, avoidTradeRoute);
         rmAddAreaConstraint(gorgeID, avoidNatives);
	   rmAddAreaConstraint(gorgeID, avoidWater20);
	   rmAddAreaConstraint(gorgeID, avoidSocket);
	   rmAddAreaConstraint(gorgeID, avoidStartingUnits);
	   rmAddAreaConstraint(gorgeID, fartherPlayerConstraint);
	   rmAddAreaConstraint(gorgeID, secondEdgeConstraint);
	   rmAddAreaConstraint(gorgeID, longHillConstraint);
 	   rmBuildArea(gorgeID);
	   }
      }
      else // all other maps with cliffs
      {
         int numCliffs = rmRandInt(7,9);
	   if (cliffVariety == 2)
		if (makeCentralCliffArea == 1)
		   numCliffs = rmRandInt(6,8);
		else
		   numCliffs = rmRandInt(8,10);
	   else
 		if (makeCentralCliffArea == 1)
		   numCliffs = rmRandInt(4,6);

         for (i=0; <numCliffs)
         {
		cliffHt = rmRandInt(5,7);    
		int bigCliffID=rmCreateArea("big cliff" +i);
		rmSetAreaWarnFailure(bigCliffID, false);
		rmSetAreaCliffType(bigCliffID, cliffType);
		rmAddAreaToClass(bigCliffID, rmClassID("classCliff"));
		if (cliffVariety == 1) // like Patagonia
		{
   	         rmSetAreaSize(bigCliffID, rmAreaTilesToFraction(600), rmAreaTilesToFraction(800));
      	   rmSetAreaCliffEdge(bigCliffID, 2, 0.35, 0.1, 1.0, 0);
      	   rmSetAreaCliffPainting(bigCliffID, false, true, true, 1.5, true);
		   rmSetAreaCliffHeight(bigCliffID, 7, 2.0, 0.5);
		   rmSetAreaCoherence(bigCliffID, 0.5);
		   rmSetAreaSmoothDistance(bigCliffID, 5);
		   rmSetAreaHeightBlend(bigCliffID, 1.0);
		}
		else if (cliffVariety == 2) // smaller, kinda like in Sudden Death from AOM
		{
   	         rmSetAreaSize(bigCliffID, rmAreaTilesToFraction(280), rmAreaTilesToFraction(400));
		   rmSetAreaCliffEdge(bigCliffID, 1, 0.6, 0.1, 1.0, 0);
		   rmSetAreaCliffPainting(bigCliffID, true, true, true, 1.5, true);
		   rmSetAreaCliffHeight(bigCliffID, cliffHt, 1.0, 1.0);
		   rmSetAreaCoherence(bigCliffID, rmRandFloat(0.4, 0.9));
		   rmSetAreaSmoothDistance(bigCliffID, 10);
		   rmSetAreaHeightBlend(bigCliffID, 2.0);
		}
		else  // kinda random, kinda like Texas or NE
		{
   	         rmSetAreaSize(bigCliffID, rmAreaTilesToFraction(400), rmAreaTilesToFraction(800));
		   rmSetAreaCliffEdge(bigCliffID, 1, 0.6, 0.1, 1.0, 0);
		   rmSetAreaCliffPainting(bigCliffID, true, true, true, 1.5, true);
		   rmSetAreaCliffHeight(bigCliffID, cliffHt, 2.0, 1.0);
		   rmSetAreaCoherence(bigCliffID, rmRandFloat(0.4, 0.9));
		   rmSetAreaSmoothDistance(bigCliffID, 15);
		   rmSetAreaHeightBlend(bigCliffID, 1.0);
		}
		rmSetAreaMinBlobs(bigCliffID, 3);
		rmSetAreaMaxBlobs(bigCliffID, 5);
		rmSetAreaMinBlobDistance(bigCliffID, 5.0);
		rmSetAreaMaxBlobDistance(bigCliffID, 20.0);
		rmAddAreaConstraint(bigCliffID, avoidImportantItem);
		rmAddAreaConstraint(bigCliffID, avoidTradeRoute);
            rmAddAreaConstraint(bigCliffID, avoidNatives);
	      rmAddAreaConstraint(bigCliffID, avoidWater20);
	      rmAddAreaConstraint(bigCliffID, cliffsAvoidCliffs);
	      rmAddAreaConstraint(bigCliffID, avoidSocket);
	      rmAddAreaConstraint(bigCliffID, avoidStartingUnits);
	      rmAddAreaConstraint(bigCliffID, longPlayerConstraint);
	      rmAddAreaConstraint(bigCliffID, longHillConstraint);
		rmBuildArea(bigCliffID);
         }
      }
   }

// Random ponds
   if (makePonds == 1)
   {
	for (i=0; <cNumberNonGaiaPlayers*2)   
      {
	   int pondID=rmCreateArea("random pond"+i);
	   rmSetAreaSize(pondID, rmAreaTilesToFraction(450), rmAreaTilesToFraction(750));
         rmSetAreaWaterType(pondID, pondType);
         rmSetAreaBaseHeight(pondID, baseHt);
         rmSetAreaMinBlobs(pondID, 1);
         rmSetAreaMaxBlobs(pondID, 6);
         rmSetAreaMinBlobDistance(pondID, 12.0);
         rmSetAreaMaxBlobDistance(pondID, 35.0);
         rmAddAreaToClass(pondID, lakeClass);
         rmAddAreaConstraint(pondID, avoidLakesFar);
         rmAddAreaConstraint(pondID, longPlayerConstraint);
         rmAddAreaConstraint(pondID, circleConstraint);
         rmAddAreaConstraint(pondID, avoidTradeRoute);
         rmAddAreaConstraint(pondID, avoidSocket);
         rmAddAreaConstraint(pondID, avoidCliffs);
         rmAddAreaConstraint(pondID, avoidAll);
         rmAddAreaConstraint(pondID, avoidNativesShort);
         rmAddAreaConstraint(pondID, medHillConstraint);
         rmSetAreaCoherence(pondID, rmRandFloat(0.1,0.7));
         rmSetAreaWarnFailure(pondID, false);
         rmBuildArea(pondID);
      }
   }

   // Text
   rmSetStatusText("",0.60);

// Random Nuggets
   int nugget2= rmCreateObjectDef("nugget medium"); 
   rmAddObjectDefItem(nugget2, "Nugget", 1, 0.0);
   rmSetNuggetDifficulty(2, 2);
   rmAddObjectDefToClass(nugget2, rmClassID("classNugget"));
   rmSetObjectDefMinDistance(nugget2, 60.0);
   rmSetObjectDefMaxDistance(nugget2, 110.0);
   rmAddObjectDefConstraint(nugget2, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(nugget2, avoidSocket);
   rmAddObjectDefConstraint(nugget2, avoidTradeRoute);
   rmAddObjectDefConstraint(nugget2, nuggetPlayerConstraint);
   rmAddObjectDefConstraint(nugget2, avoidNuggetMed);
   rmAddObjectDefConstraint(nugget2, avoidWater10);
   rmAddObjectDefConstraint(nugget2, avoidAll);
   rmAddObjectDefConstraint(nugget2, avoidIce);
   rmPlaceObjectDefPerPlayer(nugget2, false, 1);

   int nugget3= rmCreateObjectDef("nugget hard"); 
   rmAddObjectDefItem(nugget3, "Nugget", 1, 0.0);
   rmSetNuggetDifficulty(3, 3);
   rmAddObjectDefToClass(nugget3, rmClassID("classNugget"));
   rmSetObjectDefMinDistance(nugget3, 80.0);
   rmSetObjectDefMaxDistance(nugget3, rmXFractionToMeters(0.6));
   rmAddObjectDefConstraint(nugget3, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(nugget3, avoidSocket);
   rmAddObjectDefConstraint(nugget3, avoidTradeRoute);
   rmAddObjectDefConstraint(nugget3, farPlayerConstraint);
   rmAddObjectDefConstraint(nugget3, avoidNuggetLong);
   rmAddObjectDefConstraint(nugget3, avoidWater10);
   rmAddObjectDefConstraint(nugget3, avoidAll);
   rmAddObjectDefConstraint(nugget3, avoidIce);
   rmPlaceObjectDefPerPlayer(nugget3, false, 1);

   rmAddObjectDefConstraint(nugget3, fartherPlayerConstraint);
   rmSetNuggetDifficulty(2, 3);
   rmPlaceObjectDefPerPlayer(nugget3, false, 1);

   int nugget4= rmCreateObjectDef("nugget nuts"); 
   rmAddObjectDefItem(nugget4, "Nugget", 1, 0.0);
   rmSetNuggetDifficulty(4, 4);
   rmAddObjectDefToClass(nugget4, rmClassID("classNugget"));
   rmSetObjectDefMinDistance(nugget4, 85.0);
   rmSetObjectDefMaxDistance(nugget4, rmXFractionToMeters(0.4));
   rmAddObjectDefConstraint(nugget4, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(nugget4, avoidSocket);
   rmAddObjectDefConstraint(nugget4, avoidTradeRoute);
   rmAddObjectDefConstraint(nugget4, fartherPlayerConstraint);
   rmAddObjectDefConstraint(nugget4, avoidNuggetLong);
   rmAddObjectDefConstraint(nugget4, avoidWater10);
   rmAddObjectDefConstraint(nugget4, avoidAll);
   rmAddObjectDefConstraint(nugget4, avoidIce);
   rmPlaceObjectDefPerPlayer(nugget4, false, 1);

   // Text
   rmSetStatusText("",0.65);

// more resources
   // start area trees 
   int StartAreaTreeID=rmCreateObjectDef("starting trees");
   rmAddObjectDefItem(StartAreaTreeID, treeType, 1, 0.0);
   rmSetObjectDefMinDistance(StartAreaTreeID, 8);
   rmSetObjectDefMaxDistance(StartAreaTreeID, 12);
   rmAddObjectDefConstraint(StartAreaTreeID, avoidStartingUnitsSmall);
   rmAddObjectDefConstraint(StartAreaTreeID, avoidTradeRoute);
   rmAddObjectDefConstraint(StartAreaTreeID, avoidAll);
   rmPlaceObjectDefPerPlayer(StartAreaTreeID, false, 3);

   // berry bushes
   int berryNum = rmRandInt(2,5);
   int StartBerryBushID=rmCreateObjectDef("starting berry bush");
   rmAddObjectDefItem(StartBerryBushID, "BerryBush", rmRandInt(2,4), 4.0);
   rmSetObjectDefMinDistance(StartBerryBushID, 10.0);
   rmSetObjectDefMaxDistance(StartBerryBushID, 16.0);
   rmAddObjectDefConstraint(StartBerryBushID, avoidStartingUnitsSmall);
   if (placeBerries == 1)
      rmPlaceObjectDefPerPlayer(StartBerryBushID, false, 1);

   // start area huntable
   int deerNum = rmRandInt(5, 8);
   int startPronghornID=rmCreateObjectDef("starting pronghorn");
   rmAddObjectDefItem(startPronghornID, deerType, deerNum, 5.0);
   rmAddObjectDefToClass(startPronghornID, rmClassID("huntableFood"));
   rmSetObjectDefMinDistance(startPronghornID, 16);
   rmSetObjectDefMaxDistance(startPronghornID, 22);
   rmAddObjectDefConstraint(startPronghornID, avoidStartResource);
   rmAddObjectDefConstraint(startPronghornID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(startPronghornID, avoidAll);
   rmSetObjectDefCreateHerd(startPronghornID, true);
   rmPlaceObjectDefPerPlayer(startPronghornID, false, 1);

   // second huntable
   int deer2Num = rmRandInt(4, 8);
   int farPronghornID=rmCreateObjectDef("far pronghorn");
   rmAddObjectDefItem(farPronghornID, deer2Type, deer2Num, 5.0);
   rmAddObjectDefToClass(farPronghornID, rmClassID("huntableFood"));
   rmSetObjectDefMinDistance(farPronghornID, 42.0);
   rmSetObjectDefMaxDistance(farPronghornID, 65.0);
   rmAddObjectDefConstraint(farPronghornID, avoidStartResource);
   rmAddObjectDefConstraint(farPronghornID, mediumPlayerConstraint);
   rmAddObjectDefConstraint(farPronghornID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(farPronghornID, avoidNativesShort);
   rmAddObjectDefConstraint(farPronghornID, huntableConstraint);
   rmAddObjectDefConstraint(farPronghornID, avoidAll);
   rmSetObjectDefCreateHerd(farPronghornID, true);
   if (sheepChance == 0)
      rmPlaceObjectDefPerPlayer(farPronghornID, false, 2);
   else
      rmPlaceObjectDefPerPlayer(farPronghornID, false, 1);

   // additional second huntable for low player numbers
   if (cNumberNonGaiaPlayers < 4)
   {
      rmAddObjectDefConstraint(farPronghornID, fartherPlayerConstraint);
      rmSetObjectDefMinDistance(farPronghornID, rmXFractionToMeters(0.25));
      rmSetObjectDefMaxDistance(farPronghornID, rmXFractionToMeters(0.35));
      rmPlaceObjectDefPerPlayer(farPronghornID, false, 1);
   }

// Silver mines - players
   int silverType = -1;
   silverType = rmRandInt(1,10);
   int playerGoldID=rmCreateObjectDef("player silver closer");
   rmAddObjectDefItem(playerGoldID, "mine", 1, 0.0);
   rmAddObjectDefConstraint(playerGoldID, avoidTradeRoute);
   rmAddObjectDefConstraint(playerGoldID, avoidSocket);
   rmAddObjectDefConstraint(playerGoldID, coinAvoidCoin);
   rmAddObjectDefConstraint(playerGoldID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(playerGoldID, circleConstraint);
   rmAddObjectDefConstraint(playerGoldID, avoidAll);
   rmAddObjectDefConstraint(playerGoldID, avoidWater20);
   rmSetObjectDefMinDistance(playerGoldID, 18.0);
   rmSetObjectDefMaxDistance(playerGoldID, 23.0);
   rmPlaceObjectDefPerPlayer(playerGoldID, false, 1);
   if (rmRandInt(1,4) == 1)
      rmPlaceObjectDefPerPlayer(playerGoldID, false, 1);

   silverType = rmRandInt(1,10);
   int GoldMediumID=rmCreateObjectDef("player silver med");
   rmAddObjectDefItem(GoldMediumID, "mine", 1, 0.0);
   rmAddObjectDefConstraint(GoldMediumID, avoidTradeRoute);
   rmAddObjectDefConstraint(GoldMediumID, avoidSocket);
   rmAddObjectDefConstraint(GoldMediumID, coinAvoidCoin);
   rmAddObjectDefConstraint(GoldMediumID, shortAvoidCanyons);
   rmAddObjectDefConstraint(GoldMediumID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(GoldMediumID, playerConstraint);
   rmAddObjectDefConstraint(GoldMediumID, circleConstraint);
   rmAddObjectDefConstraint(GoldMediumID, avoidAll);
   rmAddObjectDefConstraint(GoldMediumID, avoidWater10);
   rmSetObjectDefMinDistance(GoldMediumID, 40.0);
   rmSetObjectDefMaxDistance(GoldMediumID, 55.0);
   rmPlaceObjectDefPerPlayer(GoldMediumID, false, 1);

// Extra silver mines - distant, in the middle and near ends of axis.
   silverType = rmRandInt(1,10);
   int extraGoldID = rmCreateObjectDef("extra silver "+i);
   rmAddObjectDefItem(extraGoldID, "mine", 1, 0.0);
   rmAddObjectDefToClass(extraGoldID, rmClassID("importantItem"));
   rmAddObjectDefConstraint(extraGoldID, avoidTradeRoute);
   rmAddObjectDefConstraint(extraGoldID, avoidSocket);
   rmAddObjectDefConstraint(extraGoldID, coinAvoidCoin);
   rmAddObjectDefConstraint(extraGoldID, shortAvoidCanyons);
   rmAddObjectDefConstraint(extraGoldID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(extraGoldID, avoidWater10);
   rmAddObjectDefConstraint(extraGoldID, avoidAll);
   rmAddObjectDefConstraint(extraGoldID, avoidIce);
   rmSetObjectDefMinDistance(extraGoldID, 0.0);
   if (makeIce == 1)
   {
      rmSetObjectDefMaxDistance(extraGoldID, 100.0);
      rmAddObjectDefConstraint(extraGoldID, avoidIce);
      rmAddObjectDefConstraint(extraGoldID, centerConstraintFar);
   }
   else if (makeLake == 1)
   {
      rmSetObjectDefMaxDistance(extraGoldID, 100.0);
	rmAddObjectDefConstraint(extraGoldID, centerConstraintFar);
   }
   else
      rmSetObjectDefMaxDistance(extraGoldID, 60.0);
   rmPlaceObjectDefAtLoc(extraGoldID, 0, 0.5, 0.5, rmRandInt(1, 3));
   if (cNumberNonGaiaPlayers > 4)
      rmPlaceObjectDefAtLoc(extraGoldID, 0, 0.5, 0.5, 1);
   if (cNumberNonGaiaPlayers > 6)
      rmPlaceObjectDefAtLoc(extraGoldID, 0, 0.5, 0.5, 1);
   if (axisChance == 1)
   {
      rmPlaceObjectDefAtLoc(extraGoldID, 0, 0.49, 0.78, 1);
      rmPlaceObjectDefAtLoc(extraGoldID, 0, 0.51, 0.22, 1);
   }
   else
   {
      rmPlaceObjectDefAtLoc(extraGoldID, 0, 0.78, 0.51, 1);
      rmPlaceObjectDefAtLoc(extraGoldID, 0, 0.22, 0.49, 1);
   }

   silverType = rmRandInt(1,10);
   int GoldFarID=rmCreateObjectDef("player silver far");
   rmAddObjectDefItem(GoldFarID, "mine", 1, 0.0);
   rmAddObjectDefConstraint(GoldFarID, avoidTradeRoute);
   rmAddObjectDefConstraint(GoldFarID, avoidSocket);
   rmAddObjectDefConstraint(GoldFarID, coinAvoidCoin);
   rmAddObjectDefConstraint(GoldFarID, shortAvoidCanyons);
   rmAddObjectDefConstraint(GoldFarID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(GoldFarID, circleConstraint);
   rmAddObjectDefConstraint(GoldFarID, avoidAll);
   rmAddObjectDefConstraint(GoldFarID, farPlayerConstraint);
   rmAddObjectDefConstraint(GoldFarID, avoidWater10);
   rmAddObjectDefConstraint(GoldFarID, avoidIce);
   rmSetObjectDefMinDistance(GoldFarID, 75.0);
   rmSetObjectDefMaxDistance(GoldFarID, 100.0);
   rmPlaceObjectDefPerPlayer(GoldFarID, false, rmRandInt(1, 2));

   silverType = rmRandInt(1,10);
   int GoldFartherID=rmCreateObjectDef("player silver farther");
   rmAddObjectDefItem(GoldFartherID, "mine", 1, 0.0);
   rmAddObjectDefConstraint(GoldFartherID, avoidTradeRoute);
   rmAddObjectDefConstraint(GoldFartherID, avoidSocket);
   rmAddObjectDefConstraint(GoldFartherID, coinAvoidCoin);
   rmAddObjectDefConstraint(GoldFartherID, shortAvoidCanyons);
   rmAddObjectDefConstraint(GoldFartherID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(GoldFartherID, circleConstraint);
   rmAddObjectDefConstraint(GoldFartherID, avoidAll);
   rmAddObjectDefConstraint(GoldFartherID, avoidIce);
   rmAddObjectDefConstraint(GoldFartherID, avoidWater10);
   if (sectionChance > 9)
   {
      rmSetObjectDefMinDistance(GoldFartherID, 160.0);
      rmSetObjectDefMaxDistance(GoldFartherID, 300.0);
      rmAddObjectDefConstraint(GoldFartherID, enormousPlayerConstraint);
   }
   else
   {
      rmSetObjectDefMinDistance(GoldFartherID, 110.0);
      rmSetObjectDefMaxDistance(GoldFartherID, 300.0);
      rmAddObjectDefConstraint(GoldFartherID, fartherPlayerConstraint);
   }
   if (cNumberNonGaiaPlayers < 4)
   {
	rmPlaceObjectDefPerPlayer(GoldFartherID, false, 3);
   }
   else if (cNumberNonGaiaPlayers < 6)
   {
      if (makeLake == 1)
	   rmPlaceObjectDefPerPlayer(GoldFartherID, false, 3);
      else
	   rmPlaceObjectDefPerPlayer(GoldFartherID, false, 2);
   }
   else
   {
      if (makeLake == 1)
	   rmPlaceObjectDefPerPlayer(GoldFartherID, false, 2);
      else
	   rmPlaceObjectDefPerPlayer(GoldFartherID, false, 1);
   }

// Extra tree clumps near players - to ensure fair access to wood
   int extraTreesID=rmCreateObjectDef("extra trees");
   rmAddObjectDefItem(extraTreesID, treeType, 5, 5.0);
   rmSetObjectDefMinDistance(extraTreesID, 14);
   rmSetObjectDefMaxDistance(extraTreesID, 18);
   rmAddObjectDefConstraint(extraTreesID, avoidAll);
   rmAddObjectDefConstraint(extraTreesID, avoidCoin);
   rmAddObjectDefConstraint(extraTreesID, avoidSocket);
   rmAddObjectDefConstraint(extraTreesID, avoidTradeRoute);
   for(i=1; <cNumberPlayers)
      rmPlaceObjectDefInArea(extraTreesID, 0, rmAreaID("player"+i), 2);

   int extraTrees2ID=rmCreateObjectDef("more extra trees");
   rmAddObjectDefItem(extraTrees2ID, treeType, 6, 6.0);
   rmSetObjectDefMinDistance(extraTrees2ID, 19);
   rmSetObjectDefMaxDistance(extraTrees2ID, 30);
   rmAddObjectDefConstraint(extraTrees2ID, avoidAll);
   rmAddObjectDefConstraint(extraTrees2ID, avoidCoin);
   rmAddObjectDefConstraint(extraTrees2ID, avoidSocket);
   rmAddObjectDefConstraint(extraTrees2ID, avoidTradeRoute);
   for(i=1; <cNumberPlayers)
      rmPlaceObjectDefInArea(extraTrees2ID, 0, rmAreaID("player"+i), 2);


   // Text
   rmSetStatusText("",0.70);

// sheep etc
   if (sheepChance > 0)
   {
      int sheepID=rmCreateObjectDef("herdable animal");
      rmAddObjectDefItem(sheepID, sheepType, 2, 4.0);
      rmAddObjectDefToClass(sheepID, rmClassID("herdableFood"));
      rmSetObjectDefMinDistance(sheepID, 35.0);
      rmSetObjectDefMaxDistance(sheepID, rmXFractionToMeters(0.3));
      rmAddObjectDefConstraint(sheepID, avoidSheep);
      rmAddObjectDefConstraint(sheepID, avoidAll);
      rmAddObjectDefConstraint(sheepID, playerConstraint);
      rmAddObjectDefConstraint(sheepID, avoidCliffs);
      rmAddObjectDefConstraint(sheepID, avoidImpassableLand);
      if (rmRandInt(1,2) == 1)
         rmPlaceObjectDefAtLoc(sheepID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*2);
      else 
         rmPlaceObjectDefAtLoc(sheepID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*3); 

      rmAddObjectDefConstraint(sheepID, farPlayerConstraint);
      rmSetObjectDefMaxDistance(sheepID, rmXFractionToMeters(0.45));
      rmPlaceObjectDefAtLoc(sheepID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*3); 
   }

// Central herds
   int centralHerdID=rmCreateObjectDef("central herd");  
   rmAddObjectDefItem(centralHerdID, centerHerdType, rmRandInt(7,9), 6.0);
   rmAddObjectDefToClass(centralHerdID, rmClassID("huntableFood"));
   rmSetObjectDefMinDistance(centralHerdID, rmXFractionToMeters(0.05));
   rmSetObjectDefMaxDistance(centralHerdID, rmXFractionToMeters(0.1));
   rmAddObjectDefConstraint(centralHerdID, avoidTradeRoute);
   rmAddObjectDefConstraint(centralHerdID, avoidImportantItem);
   rmAddObjectDefConstraint(centralHerdID, avoidWater10);
   rmAddObjectDefConstraint(centralHerdID, avoidIce);
   rmAddObjectDefConstraint(centralHerdID, farPlayerConstraint);
   rmAddObjectDefConstraint(centralHerdID, longHuntableConstraint);
   rmSetObjectDefCreateHerd(centralHerdID, true);
   rmPlaceObjectDefAtLoc(centralHerdID, 0, 0.5, 0.5, 2);
   // additional of central herd type
   rmAddObjectDefConstraint(centralHerdID, fartherPlayerConstraint);
   rmSetObjectDefMinDistance(centralHerdID, rmXFractionToMeters(0.3));
   rmSetObjectDefMaxDistance(centralHerdID, rmXFractionToMeters(0.38));
   rmPlaceObjectDefPerPlayer(centralHerdID, false, 1);

// far huntable
   int farHuntableID=rmCreateObjectDef("far huntable");
   rmAddObjectDefItem(farHuntableID, deerType, rmRandInt(5,9), 6.0);
   rmAddObjectDefToClass(farHuntableID, rmClassID("huntableFood"));
   rmSetObjectDefMinDistance(farHuntableID, rmXFractionToMeters(0.33));
   rmSetObjectDefMaxDistance(farHuntableID, rmXFractionToMeters(0.4));
   rmAddObjectDefConstraint(farHuntableID, avoidTradeRoute);
   rmAddObjectDefConstraint(farHuntableID, avoidImportantItem);
   rmAddObjectDefConstraint(farHuntableID, avoidWater10);
   rmAddObjectDefConstraint(farHuntableID, fartherPlayerConstraint);
   rmAddObjectDefConstraint(farHuntableID, longHuntableConstraint);
   rmAddObjectDefConstraint(farHuntableID, avoidAll);
   rmAddObjectDefConstraint(farHuntableID, avoidIce);
   rmSetObjectDefCreateHerd(farHuntableID, true);
   rmPlaceObjectDefPerPlayer(farHuntableID, false, 1);

// Central forests for highlands, canyons
   if (clearCenter < 1)
	makeCentralForestPatch = 1; 
   if (clearCenter == 1)
   {
	if (makeCentralCanyon == 1)
	   makeCentralForestPatch = 1; 
   }
  
   if (makeCentralCliffArea == 1) // forest for central highlands or canyons
   {
      if (makeCentralForestPatch == 1)
      {  
         numTries=2*cNumberNonGaiaPlayers;
         for (i=0; <numTries)
         { 
             int forestPatchID = rmCreateArea("forest patch"+i, rmAreaID("center highlands"));
             rmAddAreaToClass(forestPatchID, rmClassID("classForest"));
             rmSetAreaWarnFailure(forestPatchID, false);
             rmSetAreaSize(forestPatchID, rmAreaTilesToFraction(120), rmAreaTilesToFraction(200));
             rmSetAreaCoherence(forestPatchID, 0.6);
        	 if (patternChance == 8)
	          rmSetAreaForestType(forestPatchID, "rockies snow forest");
		 else 
      	    rmSetAreaForestType(forestPatchID, forestType);
             rmSetAreaForestDensity(forestPatchID, 0.6);
             rmSetAreaForestClumpiness(forestPatchID, 0.9);
             rmSetAreaForestUnderbrush(forestPatchID, 0.2);
             rmSetAreaCoherence(forestPatchID, 0.4);
             rmSetAreaSmoothDistance(forestPatchID, 10);
             rmAddAreaConstraint(forestPatchID, avoidAll);
             rmAddAreaConstraint(forestPatchID, avoidTradeRoute);
	       rmAddAreaConstraint(forestPatchID, avoidSocket);
	       rmAddAreaConstraint(forestPatchID, avoidNativesShort);
             rmBuildArea(forestPatchID);
	   }   
      }       
   }
   else if (patternChance == 8) // for 1 central mt on Rockies
   {
	if (numMt == 1)
	{
         numTries=3*cNumberNonGaiaPlayers;
    	   if (cNumberNonGaiaPlayers > 4)
	      numTries=2*cNumberNonGaiaPlayers;
         for (i=0; <numTries)
         { 
            int snowForestPatchID = rmCreateArea("snow forest patch"+i, rmAreaID("mt patch"+0));
            rmAddAreaToClass(snowForestPatchID, rmClassID("classForest"));
            rmSetAreaWarnFailure(snowForestPatchID, false);
            rmSetAreaSize(snowForestPatchID, rmAreaTilesToFraction(170), rmAreaTilesToFraction(220));
            rmSetAreaCoherence(snowForestPatchID, 0.6);
            rmSetAreaForestType(snowForestPatchID, "rockies snow forest");
            rmSetAreaForestDensity(snowForestPatchID, 1.0);
            rmSetAreaForestClumpiness(snowForestPatchID, 0.9);
            rmSetAreaForestUnderbrush(snowForestPatchID, 0.0);
            rmSetAreaCoherence(snowForestPatchID, 0.4);
            rmSetAreaSmoothDistance(snowForestPatchID, 10);
            rmAddAreaConstraint(snowForestPatchID, avoidAll);
            rmAddAreaConstraint(snowForestPatchID, avoidTradeRoute);
            rmAddAreaConstraint(snowForestPatchID, avoidSocket);
            rmAddAreaConstraint(snowForestPatchID, avoidNativesShort);
            rmBuildArea(snowForestPatchID);
         }
	}
   }

   // Text
   rmSetStatusText("",0.75);

   // Clearings
   if (clearCenter < 1)
   {
      for (i=0; <cNumberNonGaiaPlayers*3)   
      {
	   int forestClearing=rmCreateArea("forest clearing "+i);
	   rmSetAreaWarnFailure(forestClearing, false);
	   rmSetAreaSize(forestClearing, rmAreaTilesToFraction(325), rmAreaTilesToFraction(550));
	   rmSetAreaMix(forestClearing, baseType);
	   rmAddAreaToClass(forestClearing, rmClassID("classClearing"));
	   rmSetAreaMinBlobs(forestClearing, 1);
	   rmSetAreaMaxBlobs(forestClearing, 3);
	   rmSetAreaMinBlobDistance(forestClearing, 6.0);
	   rmSetAreaMaxBlobDistance(forestClearing, 16.0);
	   rmSetAreaCoherence(forestClearing, 0.5);
	   rmSetAreaSmoothDistance(forestClearing, 10);
	   rmAddAreaConstraint(forestClearing, shortAvoidImpassableLand);
	   rmAddAreaConstraint(forestClearing, avoidClearing);
	   rmAddAreaConstraint(forestClearing, farPlayerConstraint);
	   rmAddAreaConstraint(forestClearing, hillConstraint);
	   rmAddAreaConstraint(forestClearing, avoidCliffs);
	   rmBuildArea(forestClearing);

         int clearingTreesID=rmCreateObjectDef("clearing trees "+i);
         rmAddObjectDefItem(clearingTreesID, treeType, rmRandInt(3,5), 9.0);
	   rmPlaceObjectDefInArea(clearingTreesID, 0, rmAreaID("forest clearing "+i), rmRandInt(1,2));
      }
   }

// Main forests
   int forestChance = -1;
   numTries=36*cNumberNonGaiaPlayers;
   if (cNumberNonGaiaPlayers == 3)
      numTries=34*cNumberNonGaiaPlayers;  
   if (cNumberNonGaiaPlayers > 3)
      numTries=31*cNumberNonGaiaPlayers;  
   if (cNumberNonGaiaPlayers > 5)
      numTries=28*cNumberNonGaiaPlayers;  

   if (reducedForest == 1)
   {
      numTries=33*cNumberNonGaiaPlayers;
      if (cNumberNonGaiaPlayers == 3)
         numTries=30*cNumberNonGaiaPlayers;  
      if (cNumberNonGaiaPlayers > 3)
         numTries=28*cNumberNonGaiaPlayers;  
      if (cNumberNonGaiaPlayers > 5)
         numTries=25*cNumberNonGaiaPlayers;    
   }

   if (clearCenter == 1)
   {
      numTries=30*cNumberNonGaiaPlayers;
      if (cNumberNonGaiaPlayers == 3)
         numTries=26*cNumberNonGaiaPlayers;  
      if (cNumberNonGaiaPlayers > 3)
         numTries=24*cNumberNonGaiaPlayers;  
      if (cNumberNonGaiaPlayers > 5)
         numTries=20*cNumberNonGaiaPlayers;    
   }

   failCount=0;

   for (i=0; <numTries)
   {
      forestChance = rmRandInt(1,4);
      int forest=rmCreateArea("forest "+i);
      rmSetAreaWarnFailure(forest, false);
      rmSetAreaSize(forest, rmAreaTilesToFraction(175), rmAreaTilesToFraction(350));
      rmSetAreaForestType(forest, forestType);
      rmSetAreaForestDensity(forest, rmRandFloat(0.7, 1.0));
      rmSetAreaForestClumpiness(forest, rmRandFloat(0.5, 0.9));
      rmSetAreaForestUnderbrush(forest, rmRandFloat(0.0, 0.5));
      rmSetAreaCoherence(forest, rmRandFloat(0.4, 0.7));
      rmSetAreaSmoothDistance(forest, rmRandInt(10,20));
      if (forestChance == 3)
      {
	   rmSetAreaMinBlobs(forest, 1);
	   rmSetAreaMaxBlobs(forest, 3);					
	   rmSetAreaMinBlobDistance(forest, 12.0);
	   rmSetAreaMaxBlobDistance(forest, 24.0);
	}
      if (forestChance == 4)
      {
	   rmSetAreaMinBlobs(forest, 3);
	   rmSetAreaMaxBlobs(forest, 5);					
	   rmSetAreaMinBlobDistance(forest, 16.0);
	   rmSetAreaMaxBlobDistance(forest, 28.0);
	   rmSetAreaSmoothDistance(forest, 120);
	}
      rmAddAreaToClass(forest, rmClassID("classForest")); 
	rmAddAreaConstraint(forest, mediumPlayerConstraint);
      rmAddAreaConstraint(forest, forestConstraint);
      rmAddAreaConstraint(forest, avoidAll); 
	rmAddAreaConstraint(forest, avoidCoin);  
      rmAddAreaConstraint(forest, avoidImpassableLand); 
      rmAddAreaConstraint(forest, avoidTradeRoute);
	rmAddAreaConstraint(forest, avoidStartingUnits);
	rmAddAreaConstraint(forest, avoidSocket);
	rmAddAreaConstraint(forest, avoidNativesShort);
      rmAddAreaConstraint(forest, forestsAvoidBison); 
	rmAddAreaConstraint(forest, hillConstraint);
	rmAddAreaConstraint(forest, avoidClearing);
      if (clearCenter == 1)
	{
	   if (cNumberNonGaiaPlayers > 3)
	   {
		if (rmRandInt(1,2) == 1) 
	         rmAddAreaConstraint(forest, centerConstraintForest);
		else
		   rmAddAreaConstraint(forest, centerConstraintForest2);
	   }
	   else
	   {
		if (rmRandInt(1,2) == 1) 
	         rmAddAreaConstraint(forest, centerConstraintForest3);
		else
		   rmAddAreaConstraint(forest, centerConstraintForest4);
	   }
	}
      else
	{
	   if (makeCentralCliffArea == 1)
   	      rmAddAreaConstraint(forest, centerConstraintShort);
	}
	if (hillTrees == 1)
	{
	   if (rmRandInt(1,3) > 1)
            rmSetAreaBaseHeight(forest, rmRandFloat(3.5, 5.0));
	}
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
   rmSetStatusText("",0.80);

// Random trees
   int StragglerTreeID=rmCreateObjectDef("stragglers");
   rmAddObjectDefItem(StragglerTreeID, treeType, 1, 0.0);
   rmAddObjectDefConstraint(StragglerTreeID, avoidAll);
   rmAddObjectDefConstraint(StragglerTreeID, avoidStartingUnitsSmall);
   rmAddObjectDefConstraint(StragglerTreeID, hillConstraint);
   rmAddObjectDefConstraint(StragglerTreeID, avoidCoin);
   rmAddObjectDefConstraint(StragglerTreeID, patchConstraint);
   rmAddObjectDefConstraint(StragglerTreeID, avoidWater10);
   rmSetObjectDefMinDistance(StragglerTreeID, 10.0);
   rmSetObjectDefMaxDistance(StragglerTreeID, rmXFractionToMeters(0.5));
   for(i=0; <cNumberNonGaiaPlayers*25)
      rmPlaceObjectDefAtLoc(StragglerTreeID, 0, 0.5, 0.5);
   

// Fish
   int fishID=rmCreateObjectDef("fish");
   int fishVsFishID=rmCreateTypeDistanceConstraint("fish v fish", "fish", 26.0);
   int fishLand = rmCreateTerrainDistanceConstraint("fish land", "land", true, 7.0);
   rmAddObjectDefItem(fishID, fishType, 1, 0.0);
   rmSetObjectDefMinDistance(fishID, 0.0);
   rmSetObjectDefMaxDistance(fishID, rmXFractionToMeters(0.5));
   rmAddObjectDefConstraint(fishID, fishVsFishID);
   rmAddObjectDefConstraint(fishID, fishLand);
   if (cNumberNonGaiaPlayers < 4)
      rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, rmRandInt(3,5));
   else
	rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, rmRandInt(4,6));

   // Text
   rmSetStatusText("",0.90);

// Deco
   // Dirt patches for Carolina
   if (patternChance == 2)
   {
	if (variantChance == 2)
	{
	   for (i=0; <cNumberNonGaiaPlayers*9)   
         {
		int dirtPatchC=rmCreateArea("carolina dirt patch "+i);
		rmSetAreaWarnFailure(dirtPatchC, false);
		rmSetAreaSize(dirtPatchC, rmAreaTilesToFraction(190), rmAreaTilesToFraction(260));
		rmSetAreaTerrainType(dirtPatchC, "carolina\ground_grass4_car");
		rmAddAreaToClass(dirtPatchC, rmClassID("classPatch"));
		rmSetAreaMinBlobs(dirtPatchC, 3);
		rmSetAreaMaxBlobs(dirtPatchC, 5);
		rmSetAreaMinBlobDistance(dirtPatchC, 16.0);
		rmSetAreaMaxBlobDistance(dirtPatchC, 36.0);
		rmSetAreaCoherence(dirtPatchC, 0.0);
		rmSetAreaSmoothDistance(dirtPatchC, 10);
		rmAddAreaConstraint(dirtPatchC, shortAvoidImpassableLand);
		rmAddAreaConstraint(dirtPatchC, patchConstraint);
	      rmAddAreaConstraint(dirtPatchC, shortForestConstraint);
		rmBuildArea(dirtPatchC); 
	   }
      }
   }

   // Patches for Great Plains 1
   if (patternChance == 9)
   {
      for (i=0; <cNumberNonGaiaPlayers*12)   
      {
	   int gpPatch=rmCreateArea("GP patch "+i);
	   rmSetAreaWarnFailure(gpPatch, false);
	   rmSetAreaSize(gpPatch, rmAreaTilesToFraction(180), rmAreaTilesToFraction(260));
	   rmSetAreaTerrainType(gpPatch, "great_plains\ground6_gp");
	   rmAddAreaToClass(gpPatch, rmClassID("classPatch"));
	   rmSetAreaMinBlobs(gpPatch, 1);
	   rmSetAreaMaxBlobs(gpPatch, 3);
	   rmSetAreaMinBlobDistance(gpPatch, 16.0);
	   rmSetAreaMaxBlobDistance(gpPatch, 36.0);
	   rmSetAreaCoherence(gpPatch, 0.0);
	   rmSetAreaSmoothDistance(gpPatch, 10);
	   rmAddAreaConstraint(gpPatch, shortAvoidImpassableLand);
	   rmAddAreaConstraint(gpPatch, patchConstraint);
	   rmBuildArea(gpPatch); 
      }
   }
   
   if (patternChance == 3) // Bayou
   {	
	int treeClumps = rmRandInt(8,12);
	for(i=1; < treeClumps)
	{
	   int randomWaterTreeID=rmCreateObjectDef("random tree in water"+i);	
   	   rmAddObjectDefItem(randomWaterTreeID, "treeBayouMarsh", rmRandInt(3,7), 3.0);
	   rmSetObjectDefMinDistance(randomWaterTreeID, 0.0);
	   rmSetObjectDefMaxDistance(randomWaterTreeID, rmXFractionToMeters(0.1));
	   rmPlaceObjectDefInArea(randomWaterTreeID, 0, smalllakeID, rmRandInt(1,2));
	} 

	int randomTurtlesID=rmCreateObjectDef("random turtles in water");
	rmAddObjectDefItem(randomTurtlesID, "propTurtles", 1, 3.0);
	rmSetObjectDefMinDistance(randomTurtlesID, 0.0);
	rmSetObjectDefMaxDistance(randomTurtlesID, rmXFractionToMeters(0.1));
	rmAddObjectDefConstraint(randomTurtlesID, nearShore);

	int randomWaterRocksID=rmCreateObjectDef("random rocks in water");
	rmAddObjectDefItem(randomWaterRocksID, "underbrushLake", rmRandInt(1,3), 3.0);
	rmSetObjectDefMinDistance(randomWaterRocksID, 0.0);
	rmSetObjectDefMaxDistance(randomWaterRocksID, rmXFractionToMeters(0.1));

	int randomDucksID=rmCreateObjectDef("random ducks in water");
	rmAddObjectDefItem(randomDucksID, "DuckFamily", 1, 0.0);
	rmSetObjectDefMinDistance(randomDucksID, 0.0);
	rmSetObjectDefMaxDistance(randomDucksID, rmXFractionToMeters(0.1));
	rmAddObjectDefConstraint(randomDucksID, avoidDucks);

	rmPlaceObjectDefInArea(randomTurtlesID, 0, smalllakeID, rmRandInt(1,2)); 
	rmPlaceObjectDefInArea(randomWaterRocksID, 0, smalllakeID, rmRandInt(1,2)); 
	rmPlaceObjectDefInArea(randomDucksID, 0, smalllakeID, rmRandInt(1,2)); 
   }

   if (patternChance == 12) // Texas desert
   {
	int bigDecorationID=rmCreateObjectDef("Big Texas Things");
	int avoidBigDecoration=rmCreateTypeDistanceConstraint("avoid big decorations", "BigPropTexas", 45.0);
	rmAddObjectDefItem(bigDecorationID, "BigPropTexas", 1, 0.0);
	rmSetObjectDefMinDistance(bigDecorationID, 0.0);
	rmSetObjectDefMaxDistance(bigDecorationID, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(bigDecorationID, avoidAll);
	rmAddObjectDefConstraint(bigDecorationID, avoidImportantItem);
	rmAddObjectDefConstraint(bigDecorationID, avoidCoin);
	rmAddObjectDefConstraint(bigDecorationID, avoidImpassableLand);
	rmAddObjectDefConstraint(bigDecorationID, avoidBigDecoration);
	rmAddObjectDefConstraint(bigDecorationID, avoidCliffs);
	rmAddObjectDefConstraint(bigDecorationID, longPlayerConstraint);
	rmPlaceObjectDefAtLoc(bigDecorationID, 0, 0.5, 0.5, rmRandInt(2,4));
   }

   if (plainsMap == 1)
   {
	int areThereBuffalo=rmRandInt(1, 2);
	int howManyBuffalo=rmRandInt(2, 3);
	if ( areThereBuffalo == 1 )
	{
		int bisonCarcass=rmCreateGrouping("Bison Carcass", "gp_carcass_bison");
		rmSetGroupingMinDistance(bisonCarcass, 0.0);
		rmSetGroupingMaxDistance(bisonCarcass, rmXFractionToMeters(0.5));
		rmAddGroupingConstraint(bisonCarcass, avoidImpassableLand);
		rmAddGroupingConstraint(bisonCarcass, playerConstraint);
		rmAddGroupingConstraint(bisonCarcass, avoidTradeRoute);
		rmAddGroupingConstraint(bisonCarcass, avoidSocket);
		rmAddGroupingConstraint(bisonCarcass, avoidStartingUnits);
		rmAddGroupingConstraint(bisonCarcass, avoidAll);
		rmAddGroupingConstraint(bisonCarcass, avoidNuggetSmall);
		rmPlaceGroupingAtLoc(bisonCarcass, 0, 0.5, 0.5, howManyBuffalo);
	}

	int grassPatchGroupType=-1;
	int grassPatchGroup=-1;

	for(i=1; <20*cNumberNonGaiaPlayers)
      {
		grassPatchGroupType=rmRandInt(1, 7);
		grassPatchGroup=rmCreateGrouping("Grass Patch Group"+i, "gp_grasspatch0"+grassPatchGroupType);
		rmSetGroupingMinDistance(grassPatchGroup, 0.0);
		rmSetGroupingMaxDistance(grassPatchGroup, rmXFractionToMeters(0.5));
		rmAddGroupingConstraint(grassPatchGroup, avoidImpassableLand);
		rmAddGroupingConstraint(grassPatchGroup, playerConstraint);
		rmAddGroupingConstraint(grassPatchGroup, avoidTradeRoute);
		rmAddGroupingConstraint(grassPatchGroup, avoidSocket);
		rmAddGroupingConstraint(grassPatchGroup, avoidNatives);
		rmAddGroupingConstraint(grassPatchGroup, avoidNuggetSmall);
		rmAddGroupingConstraint(grassPatchGroup, circleConstraint);
		rmAddGroupingConstraint(grassPatchGroup, avoidStartingUnits);
		rmAddGroupingConstraint(grassPatchGroup, avoidAll);
		rmAddGroupingConstraint(grassPatchGroup, avoidCliffs);
		rmPlaceGroupingAtLoc(grassPatchGroup, 0, 0.5, 0.5, 1);
	}

	int flowerPatchGroupType=-1;
	int flowerPatchGroup=-1;

	for(i=1; <17*cNumberNonGaiaPlayers)
      {
		flowerPatchGroupType=rmRandInt(1, 8);
		flowerPatchGroup=rmCreateGrouping("Flower Patch Group"+i, "gp_flower0"+flowerPatchGroupType);
		rmSetGroupingMinDistance(flowerPatchGroup, 0.0);
		rmSetGroupingMaxDistance(flowerPatchGroup, rmXFractionToMeters(0.5));
		rmAddGroupingConstraint(flowerPatchGroup, avoidImpassableLand);
		rmAddGroupingConstraint(flowerPatchGroup, playerConstraint);
		rmAddGroupingConstraint(flowerPatchGroup, avoidTradeRoute);
		rmAddGroupingConstraint(flowerPatchGroup, avoidSocket);
		rmAddGroupingConstraint(flowerPatchGroup, avoidNatives);
		rmAddGroupingConstraint(flowerPatchGroup, avoidNuggetSmall);
		rmAddGroupingConstraint(flowerPatchGroup, avoidAll);
		rmAddGroupingConstraint(flowerPatchGroup, avoidCliffs);
		rmAddGroupingConstraint(flowerPatchGroup, circleConstraint);
		rmAddGroupingConstraint(flowerPatchGroup, avoidStartingUnits);
		rmPlaceGroupingAtLoc(flowerPatchGroup, 0, 0.5, 0.5, 1);
	}
   }

   if (vultures == 1)
   { 
	int vultureID=rmCreateObjectDef("perching vultures");
	int avoidVultures=rmCreateTypeDistanceConstraint("avoid other vultures", "PropVulturePerching", 30.0);
	rmAddObjectDefItem(vultureID, "PropVulturePerching", 1, 0.0);
	rmSetObjectDefMinDistance(vultureID, 0.0);
	rmSetObjectDefMaxDistance(vultureID, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(vultureID, avoidAll);
	rmAddObjectDefConstraint(vultureID, avoidImportantItem);
	rmAddObjectDefConstraint(vultureID, avoidCoin);
	rmAddObjectDefConstraint(vultureID, avoidImpassableLand);
	rmAddObjectDefConstraint(vultureID, avoidTradeRoute);
	rmAddObjectDefConstraint(vultureID, avoidCliffs);
	rmAddObjectDefConstraint(vultureID, avoidVultures);
	rmAddObjectDefConstraint(vultureID, avoidWater20);
	rmAddObjectDefConstraint(vultureID, longPlayerConstraint);
	rmPlaceObjectDefAtLoc(vultureID, 0, 0.5, 0.5, 2);
   }

   if (eagles == 1)
   {
	int avoidEagles=rmCreateTypeDistanceConstraint("avoids Eagles", "EaglesNest", 40.0);
	int randomEagleTreeID=rmCreateObjectDef("random eagle tree");
	rmAddObjectDefItem(randomEagleTreeID, "EaglesNest", 1, 0.0);
	rmSetObjectDefMinDistance(randomEagleTreeID, 0.0);
	rmSetObjectDefMaxDistance(randomEagleTreeID, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(randomEagleTreeID, avoidAll);
	rmAddObjectDefConstraint(randomEagleTreeID, shortAvoidImpassableLand);
	rmAddObjectDefConstraint(randomEagleTreeID, avoidEagles);
	rmPlaceObjectDefAtLoc(randomEagleTreeID, 0, 0.5, 0.5, 3);
   }

   if (patternChance == 13) // Sonora
   {
	int buzzardFlockID=rmCreateObjectDef("buzzards");
	int avoidBuzzards=rmCreateTypeDistanceConstraint("buzzard avoid buzzard", "BuzzardFlock", 70.0);
	rmAddObjectDefItem(buzzardFlockID, "BuzzardFlock", 1, 3.0);
	rmSetObjectDefMinDistance(buzzardFlockID, 0.0);
	rmSetObjectDefMaxDistance(buzzardFlockID, rmXFractionToMeters(0.3));
	rmAddObjectDefConstraint(buzzardFlockID, avoidBuzzards);
	rmAddObjectDefConstraint(buzzardFlockID, avoidSocket);
	rmAddObjectDefConstraint(buzzardFlockID, shortAvoidImpassableLand);
	rmAddObjectDefConstraint(buzzardFlockID, playerConstraint);
	rmPlaceObjectDefAtLoc(buzzardFlockID, 0, 0.5, 0.5, 2*cNumberNonGaiaPlayers);
   }

   if (patternChance == 4) // GL
   {
	int avoidGrass=rmCreateTypeDistanceConstraint("avoids grass", "underbrushTexasGrass", 30.0);
   	int Grass=rmCreateObjectDef("grass");
	rmAddObjectDefItem(Grass, "underbrushTexasGrass", 1, 0.0);
	rmSetObjectDefMinDistance(Grass, 0.0);
	rmSetObjectDefMaxDistance(Grass, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(Grass, avoidAll);
	rmAddObjectDefConstraint(Grass, avoidImpassableLand);
	rmAddObjectDefConstraint(Grass, playerConstraint);
	rmPlaceObjectDefAtLoc(Grass, 0, 0.5, 0.5, 14*cNumberNonGaiaPlayers);
   }
   
   if (patternChance == 17) // Pampas
   {
      for (i=0; <12*cNumberNonGaiaPlayers)
      {
         int pampasPatch=rmCreateArea("pampas patch "+i);
         rmSetAreaWarnFailure(pampasPatch, false);
         rmAddAreaToClass(pampasPatch, rmClassID("classPatch"));
	   if (cliffVariety < 3) // not used for cliffs!
	   {
		rmSetAreaSize(pampasPatch, rmAreaTilesToFraction(200), rmAreaTilesToFraction(300));
		rmSetAreaTerrainType(pampasPatch, "pampas\ground6_pam");
	   }
	   else
	   {
		rmSetAreaSize(pampasPatch, rmAreaTilesToFraction(300), rmAreaTilesToFraction(400));
		rmSetAreaMix(pampasPatch, "pampas_grass");
	      rmAddAreaConstraint(pampasPatch, shortForestConstraint);
	   }
         rmSetAreaMinBlobs(pampasPatch, 1);
         rmSetAreaMaxBlobs(pampasPatch, 5);
         rmSetAreaMinBlobDistance(pampasPatch, 14.0);
         rmSetAreaMaxBlobDistance(pampasPatch, 38.0);
         rmSetAreaCoherence(pampasPatch, 0.1);
	   rmSetAreaSmoothDistance(pampasPatch, 10);
	   rmAddAreaConstraint(pampasPatch, shortAvoidImpassableLand);
	   rmAddAreaConstraint(pampasPatch, patchConstraint);
         rmBuildArea(pampasPatch); 
      }

	int avoidBrush=rmCreateTypeDistanceConstraint("avoids brush", "UnderbrushPampas", 30.0);
	int decoUnderbrushID=rmCreateObjectDef("underbrush");
	rmAddObjectDefItem(decoUnderbrushID, "UnderbrushPampas", rmRandInt(4,6), 3.0);
	rmSetObjectDefMinDistance(decoUnderbrushID, 20.0);
	rmSetObjectDefMaxDistance(decoUnderbrushID, rmXFractionToMeters(0.5));
      rmAddObjectDefConstraint(decoUnderbrushID, avoidAll);
	rmAddObjectDefConstraint(decoUnderbrushID, avoidImpassableLand);
	rmAddObjectDefConstraint(decoUnderbrushID, playerConstraint);
	rmAddObjectDefConstraint(decoUnderbrushID, avoidBrush);
	rmAddObjectDefConstraint(decoUnderbrushID, avoidTradeRoute);
      rmPlaceObjectDefAtLoc(decoUnderbrushID, 0, 0.5, 0.5, 14*cNumberNonGaiaPlayers);
   }
}  

  
