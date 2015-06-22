// Big Continent
// a random map for AOE3
// by RF_Gandalf

include "mercenaries.xs";

void main(void)
{  
   // Text
   rmSetStatusText("",0.01);

// Set up for variables
   string baseType = "";
   string centerTerrain = "";
   string pondType = "";
   string cliffType = "";
   string forestType = "";
   string treeType = "";
   string deerType = "";
   string deer2Type = "";
   string sheepType = "";
   string centerHerdType = "";
   string fishType = "";
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
   int trPattern = rmRandInt(0,6);
   int socketPattern = rmRandInt(1,2);   
   int nativeSetup = rmRandInt(0, 8);
   if (cNumberNonGaiaPlayers < 6)
      nativeSetup = rmRandInt(0, 10); 
   int nativePattern = -1;
   int nativeNumber = rmRandInt(2, 6);
   int sheepChance = rmRandInt(1, 2);
   int featureChance = rmRandInt(1, 10);
   int cliffChance = rmRandInt(1, 10);
   int makeCliffs = -1; 
   int cliffVariety= rmRandInt(1, 5);
   int makePond = -1;
   int makeIce = -1;
   int centerMt = -1;
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

// Picks the map size
   int playerTiles=49000;  // size = 626 for 2 , 316 for carolina, 2x
   if (cNumberNonGaiaPlayers > 7)
	playerTiles = 36500;  // size = 1080 for 8 , 580 for carolina, 1.86x
   else if (cNumberNonGaiaPlayers > 5)
	playerTiles = 40000;  // size = 979 for 6 ,  525 for carolina, 1.86x
   else if (cNumberNonGaiaPlayers > 3)
	playerTiles = 43500; // size = 834 for 4 ,  447 for carolina, 1.87x

   int size=2.0*sqrt(cNumberNonGaiaPlayers*playerTiles);
   rmEchoInfo("Map size="+size+"m x "+size+"m");
   rmSetMapSize(size, size);

// Elevation
   rmSetMapElevationParameters(cElevTurbulence, 0.4, 6, 0.7, 5.0);
   rmSetMapElevationHeightBlend(0.8);
   rmSetSeaLevel(0.0);
	
// Pick terrain patterns and features 
  
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
      fishType = "FishCod";
      whaleType = "minkeWhale";
	nativePattern = 1;
      hillTrees = rmRandInt(0,1);

      if (featureChance < 3)
	   makePond = 1;
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
	   centerMt = 1;
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
      fishType = "FishSardine";
      whaleType = "humpbackWhale";
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
	   centerMt = 1;
	   cliffChance = 0;
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
      fishType = "FishSardine";
      whaleType = "humpbackWhale";
	nativePattern = 3;
	eagles = 1;
      makeCliffs = 0;
      makePond = 1;
   }
   else if (patternChance == 4) // great lakes
   {
      if (variantChance == 1)
         rmSetSeaType("hudson bay");
      else
	   rmSetSeaType("new england coast");
      rmSetMapType("greatlakes");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("309a_summoned");
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
      fishType = "FishCod";
      whaleType = "minkeWhale";
	nativePattern = 4;
      hillTrees = rmRandInt(0,1);

      if (featureChance < 4)
	   makePond = 1;
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
	   centerMt = 1;
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
      whaleType = "minkeWhale";
      placeBerries = 0;
	nativePattern = 5;
      hillTrees = rmRandInt(0,1);

      if (featureChance < 4)
	   makePond = 1;
	else if (featureChance < 7)
	   makeIce = 1;
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
      whaleType = "beluga";
	nativePattern = 6;

      if (featureChance < 6)
	   makePond = 1;
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
      cliffType = "rocky mountain2";
      centerTerrain = "yukon snow";
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
      whaleType = "beluga";
      placeBerries = 0;
	nativePattern = 16;
      hillTrees = rmRandInt(0,1);

      if (featureChance < 5)
	   centerMt = 1;
	else if (featureChance < 8)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 0;
	}
	else if (featureChance < 10)
	{
	   makeIce = 1;
	   cliffChance = 0;
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
      centerTerrain = "rockies_snow";
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
      whaleType = "beluga";
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
      fishType = "FishCod";
      whaleType = "minkeWhale";
	nativePattern = 8;
      vultures = 1;
      plainsMap = 1;

      if (featureChance < 4)
	   makePond = 1;
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
      fishType = "FishCod";
      whaleType = "humpbackWhale";
	nativePattern = 2;
      vultures = 1;
      plainsMap = 1;

      if (featureChance < 4)
	   makePond = 1;
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
      fishType = "FishSardine";
      whaleType = "humpbackWhale";
	nativePattern = 9;
      vultures = 1;

	if (cliffChance > 3)
         makeCliffs = 1;
      if (featureChance < 4)
	   makePond = 1;
	else if (featureChance < 7)
	{
	   makeCentralHighlands = 1;
	   makeCliffs = 2;
         mtForest = 1;
	}
   }
   else if (patternChance == 12) // texas desert
   {   
      rmSetSeaType("new england coast");
      rmSetMapType("texas");
	rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("seville");
	else
         rmSetLightingSet("texas");

      baseHt = rmRandFloat(1,3);
      baseType = "texas_grass";
	centerTerrain = "texas\ground4_tex";
	forestType = "texas forest dirt";
      cliffType = "Texas";
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
      whaleType = "humpbackWhale";
	nativePattern = 2;
      vultures = 1;

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
   }
   else if (patternChance == 13) // sonora
   {   
      rmSetSeaType("Atlantic Coast");
      rmSetMapType("sonora");
	rmSetMapType("grass");
	if (lightingChance == 1)
         rmSetLightingSet("sonora");
	else
         rmSetLightingSet("pampas");

      baseHt = 1;
      baseType = "sonora_dirt";
	forestType = "sonora forest";
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
      whaleType = "humpbackWhale";
      placeBerries = 0;
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
      whaleType = "humpbackWhale";
	nativePattern = 11;
      hillTrees = rmRandInt(0,1);

      if (featureChance < 3)
	   makePond = 1;
	else if (featureChance < 5)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
      else if (featureChance < 7)
	{
	   centerMt = 1;
	   cliffChance = 0;
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
      fishType = "FishMahi";
      whaleType = "humpbackWhale";
	nativePattern = 12;

      if (featureChance < 4)
	   makePond = 1;
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
      whaleType = "humpbackWhale";
      nativePattern = 13;

      if (featureChance < 3)
	   makePond = 1;
	else if (featureChance < 5)
	{
	   makeCentralHighlands = 1;
	   cliffChance = 0;
         mtForest = 1;
	}
      else if (featureChance < 7)
	{
	   centerMt = 1;
	   cliffChance = 0;
	}
	if (cliffChance > 7)
         makeCliffs = 1;
   }
   else if (patternChance == 17) // pampas
   {
      rmSetSeaType("yucatan coast");
      rmSetMapType("pampas");
      rmSetMapType("grass");
	if (lightingChance == 1)
	   rmSetLightingSet("texas");
	else
         rmSetLightingSet("pampas");

      baseHt = 1;
      baseType = "pampas_dirt";
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
      whaleType = "humpbackWhale";
	nativePattern = 14;
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
      fishType = "FishSardine";
      whaleType = "minkeWhale";
	nativePattern = 14;
      hillTrees = rmRandInt(0,1);

	if (cliffChance < 6)
         makeCliffs = 1;
      if (featureChance < 4)
	   makePond = 1;
	else if (featureChance < 7)
	{
	   makeCentralHighlands = 1;
	   makeCliffs = 2;
         mtForest = 1;
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
         rmSetLightingSet("ottoman morning");
	else
	   rmSetLightingSet("patagonia");

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
      fishType = "FishSardine";
      whaleType = "minkeWhale";
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
	   makeCliffs = 0;
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
      cliffType = "rocky mountain2";
	if (rmRandInt(1,2) == 1)
         pondType = "hudson bay";
	else  
         pondType = "great lakes ice";
      centerTerrain = "yukon snow";
	treeType = "TreeYukon";
      if (variantChance == 1)
	{
         deerType = "muskOx";
         deer2Type = "caribou";
         centerHerdType = "bighornsheep";
	}
      else 
	{  
         deerType = "caribou"; 
         deer2Type = "muskOx";
         centerHerdType = "caribou";       
	}
      sheepChance = 0;
      fishType = "FishSalmon";
      whaleType = "beluga";
      placeBerries = 0;
	nativePattern = 6;
      hillTrees = 0;

      if (variantChance == 1)
	   centerMt = 1;
	else
	{
         if (featureChance < 4)
		makeIce = 1;
	   else	
	      makePond = 1;
	}	   
   }

   if (patternChance == 8)
      trPattern = rmRandInt(0,5);
   if (centerMt == 1)
      trPattern = rmRandInt(0,5); 

   rmTerrainInitialize("water");
   rmSetMapType("water");
   rmSetWorldCircleConstraint(true);
   rmSetWindMagnitude(2.0);

// Precipitation
   if (patternChance == 16) // amazon
      if (lightingChance == 2)
         rmSetGlobalRain( 1.0 );
   if (patternChance == 7) // yukon
      if (lightingChance == 2)
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
   rmDefineClass("nuggets");
   rmDefineClass("center");
   rmDefineClass("socketClass");
   int classHuntable=rmDefineClass("huntableFood");   
   int classHerdable=rmDefineClass("herdableFood"); 
   int canyon=rmDefineClass("canyon");

   // Text
   rmSetStatusText("",0.10);

// -------------Define constraints
   // Map edge constraints
   int playerEdgeConstraint=rmCreateBoxConstraint("player edge of map", rmXTilesToFraction(10), rmZTilesToFraction(10), 1.0-rmXTilesToFraction(10), 1.0-rmZTilesToFraction(10), 0.01);
   int bisonEdgeConstraint=rmCreateBoxConstraint("bison edge of map", rmXTilesToFraction(20), rmZTilesToFraction(20), 1.0-rmXTilesToFraction(20), 1.0-rmZTilesToFraction(20), 0.01);
   int centerConstraint=rmCreateClassDistanceConstraint("stay away from center", rmClassID("center"), 30.0);
   int centerConstraintShort=rmCreateClassDistanceConstraint("stay away from center short", rmClassID("center"), 12.0);
   int centerConstraintFar=rmCreateClassDistanceConstraint("stay away from center far", rmClassID("center"), 70.0);
   int circleConstraint=rmCreatePieConstraint("circle Constraint", 0.5, 0.5, 0, rmZFractionToMeters(0.47), rmDegreesToRadians(0), rmDegreesToRadians(360));
   int circleConstraintPond=rmCreatePieConstraint("circle Constraint for pond", 0.5, 0.5, 0, rmZFractionToMeters(0.33), rmDegreesToRadians(0), rmDegreesToRadians(360));

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
   int forestConstraint=rmCreateClassDistanceConstraint("forest vs. forest", rmClassID("classForest"), 20.0);
   int longForestConstraint=rmCreateClassDistanceConstraint("long forest vs. forest", rmClassID("classForest"), 25.0);
   int avoidResource=rmCreateTypeDistanceConstraint("resource avoid resource", "resource", 20.0);
   int avoidCoin=rmCreateTypeDistanceConstraint("avoid coin", "gold", 10.0);
   int shortAvoidSilver=rmCreateTypeDistanceConstraint("short gold avoid gold", "Mine", 20.0);
   int coinAvoidCoin=rmCreateTypeDistanceConstraint("coin avoids coin", "gold", 35.0);
   int avoidStartResource=rmCreateTypeDistanceConstraint("start resource no overlap", "resource", 1.0);
   int avoidSheep=rmCreateClassDistanceConstraint("sheep avoids sheep etc", rmClassID("herdableFood"), 45.0);
   int huntableConstraint=rmCreateClassDistanceConstraint("huntable constraint", rmClassID("huntableFood"), 35.0);
   int forestsAvoidBison=rmCreateClassDistanceConstraint("forest avoids bison", rmClassID("huntableFood"), 15.0);
   int avoidDucks=rmCreateTypeDistanceConstraint("avoids ducks", "DuckFamily", 50.0);

   // Avoid impassable land, certain features
   int avoidImpassableLand=rmCreateTerrainDistanceConstraint("avoid impassable land", "Land", false, 4.0);
   int shortAvoidImpassableLand=rmCreateTerrainDistanceConstraint("short avoid impassable land", "Land", false, 2.0);
   int longAvoidImpassableLand=rmCreateTerrainDistanceConstraint("long avoid impassable land", "Land", false, 18.0);
   int hillConstraint=rmCreateClassDistanceConstraint("hill vs. hill", rmClassID("classHill"), 15.0);
   int shortHillConstraint=rmCreateClassDistanceConstraint("patches vs. hill", rmClassID("classHill"), 5.0);
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
  
   // Unit avoidance
   int avoidStartingUnits=rmCreateClassDistanceConstraint("objects avoid starting units", rmClassID("startingUnit"), 30.0);
   int avoidStartingUnitsSmall=rmCreateClassDistanceConstraint("objects avoid starting units small", rmClassID("startingUnit"), 10.0);
   int avoidStartingUnitsLarge=rmCreateClassDistanceConstraint("objects avoid starting units large", rmClassID("startingUnit"), 50.0);
   int avoidImportantItem=rmCreateClassDistanceConstraint("things avoid each other", rmClassID("importantItem"), 10.0);
   int avoidImportantItemSmall=rmCreateClassDistanceConstraint("important item small avoidance", rmClassID("importantItem"), 7.0);
   int avoidNatives=rmCreateClassDistanceConstraint("stuff avoids natives", rmClassID("natives"), 60.0);
   int avoidNativesShort=rmCreateClassDistanceConstraint("stuff avoids natives shorter", rmClassID("natives"), 35.0);
   int avoidNugget=rmCreateClassDistanceConstraint("stuff avoids nuggets", rmClassID("nuggets"), 40.0);
   int avoidNuggetSmall=rmCreateTypeDistanceConstraint("avoid nuggets by a little", "AbstractNugget", 10.0);
   int avoidAll=rmCreateTypeDistanceConstraint("avoid all", "all", 6.0);

   // Trade route avoidance.
   int avoidTradeRoute = rmCreateTradeRouteDistanceConstraint("trade route", 8.0);
   int avoidTradeRouteCliff = rmCreateTradeRouteDistanceConstraint("trade route cliff", 10.0);
   int avoidTradeRouteFar = rmCreateTradeRouteDistanceConstraint("trade route far", 20.0);
   int avoidSocket=rmCreateClassDistanceConstraint("avoid sockets", rmClassID("socketClass"), 13.0);

   // Cardinal Directions - "halves" of the map.
   int Northward=rmCreatePieConstraint("northMapConstraint", 0.5, 0.5, 0, rmZFractionToMeters(0.5), rmDegreesToRadians(280), rmDegreesToRadians(80));
   int Southward=rmCreatePieConstraint("southMapConstraint", 0.5, 0.5, 0, rmZFractionToMeters(0.5), rmDegreesToRadians(100), rmDegreesToRadians(260));
   int Eastward=rmCreatePieConstraint("eastMapConstraint", 0.5, 0.5, 0, rmZFractionToMeters(0.5), rmDegreesToRadians(10), rmDegreesToRadians(170));
   int Westward=rmCreatePieConstraint("westMapConstraint", 0.5, 0.5, 0, rmZFractionToMeters(0.5), rmDegreesToRadians(190), rmDegreesToRadians(350));

   // New extra stuff for water spawn point avoidance.
   int flagLand = rmCreateTerrainDistanceConstraint("flag vs land", "land", true, 10.0);
   int flagVsFlag = rmCreateTypeDistanceConstraint("flag avoid same", "HomeCityWaterSpawnFlag", 70);
   int flagEdgeConstraint = rmCreatePieConstraint("flags stay near edge of map", 0.5, 0.5, rmGetMapXSize()-20, rmGetMapXSize()-10, 0, 0, 0);

// End of constraints -----------------------------------

// Build up big continent 
   int bigContinentID=rmCreateArea("big continent");
   rmSetAreaSize(bigContinentID, 0.41, 0.42);		
   rmSetAreaMix(bigContinentID, baseType);
   rmSetAreaElevationType(bigContinentID, cElevTurbulence);
   rmSetAreaElevationVariation(bigContinentID, 2.0);
   rmSetAreaBaseHeight(bigContinentID, baseHt);
   rmSetAreaElevationMinFrequency(bigContinentID, 0.09);
   rmSetAreaElevationOctaves(bigContinentID, 3);
   rmSetAreaElevationPersistence(bigContinentID, 0.5);
   if (trPattern < 2)
   {	
      rmSetAreaSmoothDistance(bigContinentID, 40); 
      rmSetAreaCoherence(bigContinentID, 0.68);
   }
   else
   {
      rmSetAreaSmoothDistance(bigContinentID, rmRandInt(28,40)); 
      rmSetAreaCoherence(bigContinentID, rmRandFloat(0.55, 0.65));
   }
   rmSetAreaLocation(bigContinentID, 0.5, 0.5);
   rmBuildArea(bigContinentID);

// Set up for axis and player side, player position
   int axisChance = rmRandInt(1, 2);
   int playerSide = rmRandInt(1, 2);   
   int positionChance = rmRandInt(1, 2);   
   int distChance = rmRandInt(1, 3);
   if (trPattern < 2)
      distChance = rmRandInt(1, 2);
   int sectionChance = rmRandInt(1,3);
   int ffaChance = rmRandInt(1, 4);   

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

 	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);

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

	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
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

	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);

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

	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
   }
}   
else 
{ 
   if (cNumberTeams == 2)
   {
      if (cNumberNonGaiaPlayers == 4) // 2 teams, 4 players 
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
             rmSetPlacementSection(0.21, 0.29);
	    else if (sectionChance == 2)
             rmSetPlacementSection(0.18, 0.32);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.16, 0.34);
 	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);

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
             rmSetPlacementSection(0.68, 0.82);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.66, 0.84);
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
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
             rmSetPlacementSection(0.43, 0.57);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.41, 0.59);
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);

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
             rmSetPlacementSection(0.93, 0.07);
	    else if (sectionChance == 3)
             rmSetPlacementSection(0.91, 0.09);
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
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
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);

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
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
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
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);

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
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
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
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);

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
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
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
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);

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
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
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
	         if (distChance == 1)
	            rmPlacePlayersCircular(0.23, 0.25, 0.0);
	         else if (distChance == 2)
	            rmPlacePlayersCircular(0.26, 0.28, 0.0);
	         else if (distChance == 3)
	            rmPlacePlayersCircular(0.29, 0.31, 0.0);
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
	         if (distChance == 1)
	            rmPlacePlayersCircular(0.23, 0.25, 0.0);
	         else if (distChance == 2)
	            rmPlacePlayersCircular(0.26, 0.28, 0.0);
	         else if (distChance == 3)
	            rmPlacePlayersCircular(0.29, 0.31, 0.0);
            }
	}
      else  // over 4 FFA 
      { 
	    if (distChance == 1)
	       rmPlacePlayersCircular(0.23, 0.25, 0.0);
	    else if (distChance == 2)
	       rmPlacePlayersCircular(0.26, 0.28, 0.0);
	    else if (distChance == 3)
	       rmPlacePlayersCircular(0.29, 0.31, 0.0);
      }
   }
}

   // Text
   rmSetStatusText("",0.20);
	
// Set up player areas.
   float playerFraction=rmAreaTilesToFraction(120);
   for(i=1; <cNumberPlayers)
   {
      int id=rmCreateArea("Player"+i);
      rmSetPlayerArea(i, id);
      rmSetAreaSize(id, playerFraction, playerFraction);
      rmAddAreaToClass(id, classPlayer);
      rmSetAreaMinBlobs(id, 1);
      rmSetAreaMaxBlobs(id, 1);
      rmAddAreaConstraint(id, playerConstraint); 
      rmAddAreaConstraint(id, longAvoidImpassableLand);
      rmAddAreaConstraint(id, playerEdgeConstraint); 
      rmSetAreaLocPlayer(id, i);
      rmSetAreaMix(id, baseType);
      rmSetAreaWarnFailure(id, false);
   }
   rmBuildAllAreas();

   // Text
   rmSetStatusText("",0.30);

// Trade Routes
if (trPattern == 2) // 2 opposite inner semicircular routes
{
   // first route
   int tradeRouteID = rmCreateTradeRoute();
   if (axisChance == 1) 
   {	
	rmAddTradeRouteWaypoint(tradeRouteID, 0.52, 0.72);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.66, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.68, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.66, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.52, 0.28);
   }
   else 
   {	
	rmAddTradeRouteWaypoint(tradeRouteID, 0.28, 0.52);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.40, 0.66);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.5, 0.68);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.60, 0.66);
	rmAddTradeRouteWaypoint(tradeRouteID, 0.72, 0.52);
   }
   rmBuildTradeRoute(tradeRouteID, "dirt");

   // second route
   int tradeRouteID2 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.48, 0.28);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.34, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.32, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.34, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.48, 0.72);
   }
   else
   {
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.28, 0.48);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.40, 0.34);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.5, 0.32);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.60, 0.34);
	rmAddTradeRouteWaypoint(tradeRouteID2, 0.72, 0.48);
   }
   rmBuildTradeRoute(tradeRouteID2, "carolinas\trade_route");	
}
else if (trPattern == 3)  // one 'circular' inner route
{
   int tradeRouteID3 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {	
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.51, 0.72);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.66, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.68, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.66, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.5, 0.29);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.34, 0.45);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.32, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.34, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.49, 0.72);
   }
   else 
   {	
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.28, 0.51);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.40, 0.66);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.5, 0.68);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.60, 0.66);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.71, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.60, 0.34);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.5, 0.32);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.40, 0.34);
	rmAddTradeRouteWaypoint(tradeRouteID3, 0.28, 0.49);
   }
   rmBuildTradeRoute(tradeRouteID3, "dirt");
}
else if (trPattern == 4)  // two 'diagonal'
{
   int tradeRouteID4 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.65, 0.72);
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.6, 0.62);
	if(variantChance == 1)
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.65, 0.5);
	else
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.6, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.6, 0.38);
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.65, 0.28);
   }
   else if (axisChance == 2) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.72, 0.65);
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.62, 0.6);
	if(variantChance == 1)
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.5, 0.65);
	else
	   rmAddTradeRouteWaypoint(tradeRouteID4, 0.5, 0.6);	
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.38, 0.6);
	rmAddTradeRouteWaypoint(tradeRouteID4, 0.28, 0.65);
   }
   rmBuildTradeRoute(tradeRouteID4, "carolinas\trade_route");

   int tradeRouteID4A = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
      rmAddTradeRouteWaypoint(tradeRouteID4A, 0.35, 0.72);
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.4, 0.62);
	if(variantChance == 1)
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.35, 0.5);
	else
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.4, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.4, 0.38);
      rmAddTradeRouteWaypoint(tradeRouteID4A, 0.35, 0.28);
   }
   else if (axisChance == 2) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.72, 0.35);
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.62, 0.4);
	if(variantChance == 1)
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.5, 0.35);
	else
	   rmAddTradeRouteWaypoint(tradeRouteID4A, 0.5, 0.4);
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.38, 0.4);
	rmAddTradeRouteWaypoint(tradeRouteID4A, 0.28, 0.35);
   }
   rmBuildTradeRoute(tradeRouteID4A, "dirt");
}
else if (trPattern == 5)  // two parabolas
{
   int tradeRouteID5 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.68, 0.72);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.6, 0.62);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.54, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.6, 0.38);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.68, 0.28);
   }
   else if (axisChance == 2) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.72, 0.68);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.62, 0.6);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.5, 0.54);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.38, 0.6);
	rmAddTradeRouteWaypoint(tradeRouteID5, 0.28, 0.68);
   }
   rmBuildTradeRoute(tradeRouteID5, "carolinas\trade_route");

   int tradeRouteID5A = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
      rmAddTradeRouteWaypoint(tradeRouteID5A, 0.32, 0.72);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.4, 0.62);
      rmAddTradeRouteWaypoint(tradeRouteID5A, 0.46, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.4, 0.38);
      rmAddTradeRouteWaypoint(tradeRouteID5A, 0.32, 0.28);
   }
   else if (axisChance == 2) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.72, 0.32);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.62, 0.4);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.5, 0.46);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.38, 0.4);
	rmAddTradeRouteWaypoint(tradeRouteID5A, 0.28, 0.32);
   }
   rmBuildTradeRoute(tradeRouteID5A, "dirt");
}
else if (trPattern == 6)  // one diagonal
{
   int tradeRouteID6 = rmCreateTradeRoute();
   if (axisChance == 1) 
   {
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.48, 0.2);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.52, 0.35);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.5, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.48, 0.55);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.52, 0.8);
   }
   else
   {
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.2, 0.48);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.35, 0.52);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.5, 0.5);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.65, 0.48);
	rmAddTradeRouteWaypoint(tradeRouteID6, 0.8, 0.52);
   }
   rmBuildTradeRoute(tradeRouteID6, "carolinas\trade_route");	
}
else if (trPattern == 0)  // one 'circular' outer route
{
   int tradeRouteID0 = rmCreateTradeRoute();
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.16, 0.51);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.24, 0.75);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.5, 0.84);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.76, 0.76);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.84, 0.5);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.76, 0.26);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.5, 0.16);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.24, 0.24);
   rmAddTradeRouteWaypoint(tradeRouteID0, 0.16, 0.49);
   rmBuildTradeRoute(tradeRouteID0, "dirt");
}
else if (trPattern == 1)  // 2 'semicircular' outer routes
{
   int tradeRouteID1 = rmCreateTradeRoute();
   int tradeRouteID1A = rmCreateTradeRoute();
   if (axisChance == 2)
   {
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.165, 0.51);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.25, 0.74);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.5, 0.835);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.74, 0.75);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.835, 0.51);
      rmBuildTradeRoute(tradeRouteID1, "carolinas\trade_route");	

      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.835, 0.49);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.74, 0.25);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.5, 0.165);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.25, 0.26);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.165, 0.49);
      rmBuildTradeRoute(tradeRouteID1A, "dirt");
   }
   else if (axisChance == 1)
   {
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.51, 0.835);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.74, 0.75);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.835, 0.5);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.75, 0.26);
      rmAddTradeRouteWaypoint(tradeRouteID1, 0.51, 0.165);
      rmBuildTradeRoute(tradeRouteID1, "carolinas\trade_route");	

      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.49, 0.165);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.26, 0.25);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.165, 0.5);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.25, 0.74);
      rmAddTradeRouteWaypoint(tradeRouteID1A, 0.49, 0.835);
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
else if(trPattern == 0) // outer ring
{
   if (socketPattern == 1)
   {
   rmSetObjectDefTradeRouteID(socketID, tradeRouteID0);
   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.005);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.167);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.333);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.505);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.667);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

   socketLoc = rmGetTradeRouteWayPoint(tradeRouteID0, 0.833);
   rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
   else if (socketPattern == 2)
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
else if (trPattern == 1) //  2 outer semicircles
{
   if (socketPattern == 1)
   { 
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID1);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.05);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.38);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.72);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      // change the trade route for the new sockets
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID1A);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.05);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.38);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.72);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);
   }
   if (socketPattern == 2)
   { 
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID1);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.05);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.3);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.55);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1, 0.8);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      // change the trade route for the new sockets
      rmSetObjectDefTradeRouteID(socketID, tradeRouteID1A);
      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.05);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.3);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.55);
      rmPlaceObjectDefAtPoint(socketID, 0, socketLoc);

      socketLoc = rmGetTradeRouteWayPoint(tradeRouteID1A, 0.8);
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
   rmSetAreaSize(centerArea, 0.05, 0.05);
   rmSetAreaLocation(centerArea, 0.5, 0.5);
   rmAddAreaToClass(centerArea, rmClassID("center")); 

   // Texas desert
   if (patternChance == 12)
   {
         int desertID = rmCreateArea("desert");
         rmSetAreaLocation(desertID, 0.5, 0.5); 
         rmSetAreaWarnFailure(desertID, false);
         rmSetAreaSize(desertID, 0.32, 0.34);
         rmSetAreaCoherence(desertID, rmRandFloat(0.2, 0.5));
         rmSetAreaTerrainType(desertID, "texas\ground4_tex");
         rmAddAreaTerrainLayer(desertID, "texas\ground1_tex", 0, 4);
         rmAddAreaTerrainLayer(desertID, "texas\ground2_tex", 4, 8);
         rmAddAreaTerrainLayer(desertID, "texas\ground3_tex", 8, 12);
         rmSetAreaMix(desertID, "texas_dirt");
         rmBuildArea(desertID);
   }

   // Center Highland or Canyon
   int makeCentralCliffArea = -1;
   if (makeCentralHighlands == 1)
	makeCentralCliffArea = 1;
   if (makeCentralCanyon == 1)
 	makeCentralCliffArea = 1;
   int edgeChance = rmRandInt(1,3);

   if (makeCentralCliffArea == 1)
   {
      reducedForest = 1;
      int centerHighlandsID=rmCreateArea("center highlands");
      rmSetAreaLocation(centerHighlandsID, 0.5, 0.5);
      rmSetAreaSize(centerHighlandsID, 0.028, 0.031);
      rmAddAreaToClass(centerHighlandsID, rmClassID("center"));
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
	   rmSetAreaCliffHeight(centerHighlandsID, 8, 1.0, 0.5);
	else if (makeCentralCanyon == 1)
	   rmSetAreaCliffHeight(centerHighlandsID, -8, 1.0, 0.5);
      rmSetAreaSmoothDistance(centerHighlandsID, 12);
      rmSetAreaCoherence(centerHighlandsID, 0.5);
	rmSetAreaHeightBlend(centerHighlandsID, 1.0);
      rmAddAreaConstraint(centerHighlandsID, avoidTradeRoute);
      rmAddAreaConstraint(centerHighlandsID, avoidSocket);
      rmBuildArea(centerHighlandsID);
      makePond = 0;
   }

   // Center mountain
   if (centerMt == 1)
      reducedForest = 1;
   int mtPattern = rmRandInt(1,3);

   if (patternChance == 7) // Yukon, bald hill
   { 
      if (centerMt == 1)
      {
         int snowPatchID = rmCreateArea("snow patch"); 
         rmAddAreaToClass(snowPatchID, rmClassID("classHill"));
         rmAddAreaToClass(snowPatchID, rmClassID("classPatch"));
         rmSetAreaLocation(snowPatchID, 0.5, 0.5); 
         rmSetAreaMix(snowPatchID, centerTerrain);
         rmSetAreaWarnFailure(snowPatchID, false);
	   if (mtPattern == 2)
	   {
            rmSetAreaMinBlobs(snowPatchID, 3);
            rmSetAreaMaxBlobs(snowPatchID, 6);
            rmSetAreaMinBlobDistance(snowPatchID, 12.0);
            rmSetAreaMaxBlobDistance(snowPatchID, 18.0);
            rmSetAreaSize(snowPatchID, 0.032, 0.039);
	   }
	   else if (mtPattern == 3)
	   {
            rmSetAreaMinBlobs(snowPatchID, 6);
            rmSetAreaMaxBlobs(snowPatchID, 12);
            rmSetAreaMinBlobDistance(snowPatchID, 32.0);
            rmSetAreaMaxBlobDistance(snowPatchID, 45.0);
            rmSetAreaSize(snowPatchID, 0.037, 0.039);
	   }
	   else if (mtPattern == 1)
	   {
            rmSetAreaSize(snowPatchID, 0.032, 0.039);        
         }
         rmSetAreaElevationType(snowPatchID, cElevTurbulence);
	   rmSetAreaElevationVariation(snowPatchID, rmRandInt(2, 3));
	   rmSetAreaCoherence(snowPatchID, rmRandFloat(0.4, 0.8));
	   rmSetAreaBaseHeight(snowPatchID, rmRandInt(8, 10));
	   rmSetAreaElevationPersistence(snowPatchID, rmRandFloat(0.5, 0.8));
	   if (rmRandInt(1,3) == 3)
            rmSetAreaSmoothDistance(snowPatchID, rmRandInt(8, 20));
         rmAddAreaConstraint(snowPatchID, avoidTradeRoute);
         rmAddAreaConstraint(snowPatchID, avoidSocket);
         rmBuildArea(snowPatchID); 
      }
   }
   else if (patternChance == 8)  // Rockies, forest on hill
   {
         int snowPatch2ID = rmCreateArea("snow patch 2"); 
         rmAddAreaToClass(snowPatch2ID, rmClassID("classHill"));
         rmAddAreaToClass(snowPatch2ID, rmClassID("classPatch"));
         rmSetAreaLocation(snowPatch2ID, 0.5, 0.5); 
         rmSetAreaWarnFailure(snowPatch2ID, false);
	   if (centerMt == 1)
	   {
	      if (mtPattern == 2)
	      {
            rmSetAreaMinBlobs(snowPatch2ID, 3);
            rmSetAreaMaxBlobs(snowPatch2ID, 6);
            rmSetAreaMinBlobDistance(snowPatch2ID, 12.0);
            rmSetAreaMaxBlobDistance(snowPatch2ID, 18.0);
            rmSetAreaSize(snowPatch2ID, 0.032, 0.039);
            rmSetAreaBaseHeight(snowPatch2ID, rmRandInt(8, 10));
	      }
	      else if (mtPattern == 3)
	      {
            rmSetAreaMinBlobs(snowPatch2ID, 6);
            rmSetAreaMaxBlobs(snowPatch2ID, 12);
            rmSetAreaMinBlobDistance(snowPatch2ID, 32.0);
            rmSetAreaMaxBlobDistance(snowPatch2ID, 45.0);
            rmSetAreaSize(snowPatch2ID, 0.039, 0.039);
            rmSetAreaBaseHeight(snowPatch2ID, rmRandInt(8, 10));
	      }
	      else if (mtPattern == 1)
	      {
            rmSetAreaSize(snowPatch2ID, 0.032, 0.039);
            rmSetAreaBaseHeight(snowPatch2ID, rmRandInt(8, 10));
	      }
	   }
	   else
	   {	      
            rmSetAreaSize(snowPatch2ID, 0.047, 0.048);
	   }
         rmSetAreaElevationType(snowPatch2ID, cElevTurbulence);
	   rmSetAreaElevationVariation(snowPatch2ID, rmRandInt(2, 3));
	   rmSetAreaCoherence(snowPatch2ID, rmRandFloat(0.4, 0.8));
	   rmSetAreaElevationPersistence(snowPatch2ID, rmRandFloat(0.5, 0.8));
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
   else if (patternChance > 18)
   {
      if (centerMt == 1)
      {
         int snowPatch3ID = rmCreateArea("snow patch 3"); 
         rmAddAreaToClass(snowPatch3ID, rmClassID("classHill"));
         rmAddAreaToClass(snowPatch3ID, rmClassID("classPatch"));
         rmSetAreaLocation(snowPatch3ID, 0.5, 0.5); 
         rmSetAreaWarnFailure(snowPatch3ID, false);
	   if (mtPattern == 2)
	   {
            rmSetAreaMinBlobs(snowPatch3ID, 3);
            rmSetAreaMaxBlobs(snowPatch3ID, 6);
            rmSetAreaMinBlobDistance(snowPatch3ID, 12.0);
            rmSetAreaMaxBlobDistance(snowPatch3ID, 18.0);
            rmSetAreaSize(snowPatch3ID, 0.032, 0.039);
	   }
	   else if (mtPattern == 3)
	   {
            rmSetAreaMinBlobs(snowPatch3ID, 6);
            rmSetAreaMaxBlobs(snowPatch3ID, 12);
            rmSetAreaMinBlobDistance(snowPatch3ID, 32.0);
            rmSetAreaMaxBlobDistance(snowPatch3ID, 45.0);
            rmSetAreaSize(snowPatch3ID, 0.039, 0.039);
	   }
	   else if (mtPattern == 1)
	   {
            rmSetAreaSize(snowPatch3ID, 0.032, 0.039);
	   }
	   if (patternChance == 20)  // Yukon Tundra, bald hill
	   {
            rmSetAreaTerrainType(snowPatch3ID, "yukon\ground1_yuk");
            rmAddAreaTerrainLayer(snowPatch3ID, "yukon\ground5_yuk", 0, 4);
            rmAddAreaTerrainLayer(snowPatch3ID, "yukon\ground4_yuk", 4, 8);
            rmAddAreaTerrainLayer(snowPatch3ID, "yukon\ground8_yuk", 8, 11);
	   }
	   else if (patternChance == 19) // Andes, bald hill
	   {
            rmSetAreaTerrainType(snowPatch3ID, "rockies\groundsnow1_roc");
            rmAddAreaTerrainLayer(snowPatch3ID, "patagonia\ground_snow1_pat", 0, 4);
            rmAddAreaTerrainLayer(snowPatch3ID, "patagonia\ground_snow2_pat", 4, 8);
            rmAddAreaTerrainLayer(snowPatch3ID, "patagonia\ground_snow2_pat", 8, 12);
	   }
         rmSetAreaElevationType(snowPatch3ID, cElevTurbulence);
	   rmSetAreaElevationVariation(snowPatch3ID, rmRandInt(2, 3));
	   rmSetAreaCoherence(snowPatch3ID, rmRandFloat(0.4, 0.8));
	   rmSetAreaBaseHeight(snowPatch3ID, rmRandInt(8, 10));
	   rmSetAreaElevationPersistence(snowPatch3ID, rmRandFloat(0.5, 0.8));
	   if (rmRandInt(1,3) == 3)
            rmSetAreaSmoothDistance(snowPatch3ID, rmRandInt(8, 20));
         rmAddAreaConstraint(snowPatch3ID, avoidTradeRoute);
         rmAddAreaConstraint(snowPatch3ID, avoidSocket);
         rmBuildArea(snowPatch3ID);
      } 
   }   
   else if (centerMt == 1) // green hill forest
   {
         int hillPatchID = rmCreateArea("green hill"); 
         rmAddAreaToClass(hillPatchID, rmClassID("classHill"));
         rmAddAreaToClass(hillPatchID, rmClassID("classPatch"));
         rmSetAreaLocation(hillPatchID, 0.5, 0.5); 
         rmSetAreaWarnFailure(hillPatchID, false);
         rmSetAreaForestType(hillPatchID, forestType);
         rmSetAreaForestDensity(hillPatchID, rmRandFloat(0.4, 0.6));
         rmSetAreaForestClumpiness(hillPatchID, rmRandFloat(0.5, 0.7));
         rmSetAreaForestUnderbrush(hillPatchID, rmRandFloat(0.0, 0.2));

	   if (mtPattern == 2)
	   {
            rmSetAreaMinBlobs(hillPatchID, 4);
            rmSetAreaMaxBlobs(hillPatchID, 7);
            rmSetAreaMinBlobDistance(hillPatchID, 18.0);
            rmSetAreaMaxBlobDistance(hillPatchID, 25.0);
            rmSetAreaSize(hillPatchID, 0.032, 0.039);
	   }
	   else if (mtPattern == 3)
	   {
            rmSetAreaMinBlobs(hillPatchID, 8);
            rmSetAreaMaxBlobs(hillPatchID, 15);
            rmSetAreaMinBlobDistance(hillPatchID, 32.0);
            rmSetAreaMaxBlobDistance(hillPatchID, 45.0);
            rmSetAreaSize(hillPatchID, 0.039, 0.039);
	   }
	   else if (mtPattern == 1)
	   {
            rmSetAreaSize(hillPatchID, 0.032, 0.039);
	   }
         rmSetAreaElevationType(hillPatchID, cElevTurbulence);
         rmSetAreaElevationVariation(hillPatchID, rmRandInt(2, 3));
	   rmSetAreaElevationPersistence(hillPatchID, rmRandFloat(0.5, 0.8));
         rmSetAreaCoherence(hillPatchID, rmRandFloat(0.4, 0.8));
         rmSetAreaBaseHeight(hillPatchID, rmRandInt(7,9));
	   if (rmRandInt(1,3) == 3)
            rmSetAreaSmoothDistance(hillPatchID, rmRandInt(10, 20));
         rmAddAreaConstraint(hillPatchID, avoidTradeRoute);
         rmAddAreaConstraint(hillPatchID, avoidSocket);
         rmBuildArea(hillPatchID);  
   }

   // Ice patch - Great Lakes Winter, Yukon or Yukon Tundra
   if (makeIce == 1)
   {
         nativeNumber = 2;
         int icePatchID = rmCreateArea("ice patch"); 
         rmAddAreaToClass(icePatchID, rmClassID("classHill"));
         rmAddAreaToClass(icePatchID, rmClassID("classPatch"));
         rmSetAreaLocation(icePatchID, 0.5, 0.5); 
         rmSetAreaWarnFailure(icePatchID, false);
         rmSetAreaSize(icePatchID, 0.03, 0.045);
         rmSetAreaCoherence(icePatchID, 0.8);
         rmSetAreaMix(icePatchID, "great_lakes_ice");
         rmSetAreaBaseHeight(icePatchID, 1.0);
         rmSetAreaElevationVariation(icePatchID, 0.0);
         rmAddAreaConstraint(icePatchID, avoidTradeRoute);
         rmAddAreaConstraint(icePatchID, avoidSocket);
         rmBuildArea(icePatchID); 
   }

   // Center lake      
   if (makePond == 1)
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

   // More Ponds for Bayou      
   if (patternChance == 3)
   {
	for (i=0; <cNumberNonGaiaPlayers*3)   
      {
	   int smallPond2ID=rmCreateArea("bigger small pond"+i);
	   rmSetAreaSize(smallPond2ID, rmAreaTilesToFraction(360), rmAreaTilesToFraction(480));
         rmSetAreaWaterType(smallPond2ID, pondType);
         rmSetAreaBaseHeight(smallPond2ID, 0.0);
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
         rmAddAreaConstraint(smallPond2ID, centerConstraintFar);
         rmAddAreaConstraint(smallPond2ID, circleConstraintPond);
         rmSetAreaCoherence(smallPond2ID, 0.1);
         rmSetAreaWarnFailure(smallPond2ID, false);
         rmBuildArea(smallPond2ID);
      }
	for (i=0; <cNumberNonGaiaPlayers*4)   
      {
	   int smallPondID=rmCreateArea("small pond"+i);
	   rmSetAreaSize(smallPondID, rmAreaTilesToFraction(190), rmAreaTilesToFraction(250));
         rmSetAreaWaterType(smallPondID, pondType);
         rmSetAreaBaseHeight(smallPondID, 0.0);
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
         rmAddAreaConstraint(smallPondID, centerConstraintFar);
         rmAddAreaConstraint(smallPondID, circleConstraintPond);
         rmSetAreaCoherence(smallPondID, rmRandFloat(0.2,0.8));
         rmSetAreaWarnFailure(smallPondID, false);
         rmBuildArea(smallPondID);
      }
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

// Water Flag
   int waterFlagID=-1;
   for(i=1; <cNumberPlayers)
   {
      rmClearClosestPointConstraints();
      waterFlagID=rmCreateObjectDef("HC water flag "+i);
      rmAddObjectDefItem(waterFlagID, "HomeCityWaterSpawnFlag", 1, 0.0);
      rmAddClosestPointConstraint(flagEdgeConstraint);
      rmAddClosestPointConstraint(flagVsFlag);
      rmAddClosestPointConstraint(flagLand);
      vector TCLocation = rmGetUnitPosition(rmGetUnitPlacedOfPlayer(startingTCID, i));
      vector closestPoint = rmFindClosestPointVector(TCLocation, rmXFractionToMeters(1.0));
      rmPlaceObjectDefAtLoc(waterFlagID, i, rmXMetersToFraction(xsVectorGetX(closestPoint)), rmZMetersToFraction(xsVectorGetZ(closestPoint)));
      rmClearClosestPointConstraints();
   }

   // Text
   rmSetStatusText("",0.50);

// NATIVE AMERICANS
   // Village A 
   int villageAID = -1;
   int whichNative = rmRandInt(1,2);
   int villageType = rmRandInt(1,5);

   if (nativePattern == 1)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native cherokee village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native iroquois village "+villageType);
      }
   }

   if (nativePattern == 2)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native comanche village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 3)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native cherokee village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native seminole village "+villageType);
      }
   }

   if (nativePattern == 4)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native iroquois village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 5)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native iroquois village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native cree village "+villageType);
      }
   }

   if (nativePattern == 6)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native nootka village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native cree village "+villageType);
      }
   }

   if (nativePattern == 7)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native nootka village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native comanche village "+villageType);
      }
   }

   if (nativePattern == 8)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native cree village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 9)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native comanche village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native seminole village "+villageType);
      }
   }

   if (nativePattern == 10)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native comanche village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native aztec village "+villageType);
      }
   }

   if (nativePattern == 11)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native maya village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native aztec village "+villageType);
      }
   }

   if (nativePattern == 12)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native maya village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native carib village "+villageType);
      }
   }

   if (nativePattern == 13)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native tupi village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native carib village "+villageType);
      }
   }

   if (nativePattern == 14)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native tupi village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native inca village "+villageType);
      }
   }

   if (nativePattern == 15)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native maya village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native inca village "+villageType);
      }
   }

   if (nativePattern == 16)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native nootka village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native iroquois village "+villageType);
      }
   }

   if (nativePattern == 17)
   {
      if (whichNative == 1)
      {
	villageAID = rmCreateGrouping("village A", "native aztec village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageAID = rmCreateGrouping("village A", "native inca village "+villageType);
      }
   }
   rmAddGroupingToClass(villageAID, rmClassID("natives"));
   rmAddGroupingToClass(villageAID, rmClassID("importantItem"));
   rmSetGroupingMinDistance(villageAID, 0.0);
   rmSetGroupingMaxDistance(villageAID, rmXFractionToMeters(0.09));
   rmAddGroupingConstraint(villageAID, avoidImpassableLand);
   rmAddGroupingConstraint(villageAID, avoidTradeRoute);
   rmAddGroupingConstraint(villageAID, avoidWater15);
   rmAddGroupingConstraint(villageAID, avoidNatives);
   rmAddGroupingConstraint(villageAID, playerConstraint);

   // Village D - opposite type from A 
   int villageDID = -1;
   villageType = rmRandInt(1,5);

   if (nativePattern == 1)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native cherokee village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native iroquois village "+villageType);
      }
   }

   if (nativePattern == 2)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native comanche village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 3)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native cherokee village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native seminole village "+villageType);
      }
   }

   if (nativePattern == 4)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native iroquois village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 5)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native iroquois village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native cree village "+villageType);
      }
   }

   if (nativePattern == 6)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native nootka village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native cree village "+villageType);
      }
   }

   if (nativePattern == 7)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native nootka village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native comanche village "+villageType);
      }
   }

   if (nativePattern == 8)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native cree village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 9)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native comanche village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native seminole village "+villageType);
      }
   }

   if (nativePattern == 10)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native comanche village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native aztec village "+villageType);
      }
   }

   if (nativePattern == 11)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native maya village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native aztec village "+villageType);
      }
   }

   if (nativePattern == 12)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native maya village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native carib village "+villageType);
      }
   }

   if (nativePattern == 13)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native tupi village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native carib village "+villageType);
      }
   }

   if (nativePattern == 14)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native tupi village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native inca village "+villageType);
      }
   }

   if (nativePattern == 15)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native inca village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native maya village "+villageType);
      }
   }

   if (nativePattern == 16)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native iroquois village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native nootka village "+villageType);
      }
   }

   if (nativePattern == 17)
   {
      if (whichNative == 2)
      {
	villageDID = rmCreateGrouping("village D", "native aztec village "+villageType);
      }
      else if (whichNative == 1)
      {
	villageDID = rmCreateGrouping("village D", "native inca village "+villageType);
      }
   }
   rmAddGroupingToClass(villageDID, rmClassID("natives"));
   rmAddGroupingToClass(villageDID, rmClassID("importantItem"));
   rmSetGroupingMinDistance(villageDID, 0.0);
   rmSetGroupingMaxDistance(villageDID, rmXFractionToMeters(0.09));
   rmAddGroupingConstraint(villageDID, avoidImpassableLand);
   rmAddGroupingConstraint(villageDID, avoidTradeRoute);
   rmAddGroupingConstraint(villageDID, avoidWater15);
   rmAddGroupingConstraint(villageDID, avoidNatives);
   rmAddGroupingConstraint(villageDID, playerConstraint);

   // Village B - randomly same or opposite village A
   int villageBID = -1;	
   villageType = rmRandInt(1,5);
   whichNative = rmRandInt(1,2);

   if (nativePattern == 1)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native cherokee village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native iroquois village "+villageType);
      }
   }

   if (nativePattern == 2)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native comanche village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 3)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native cherokee village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native seminole village "+villageType);
      }
   }

   if (nativePattern == 4)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native iroquois village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 5)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native iroquois village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native cree village "+villageType);
      }
   }

   if (nativePattern == 6)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native nootka village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native cree village "+villageType);
      }
   }

   if (nativePattern == 7)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native nootka village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native comanche village "+villageType);
      }
   }

   if (nativePattern == 8)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native cree village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 9)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native comanche village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native seminole village "+villageType);
      }
   }

   if (nativePattern == 10)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native aztec village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native comanche village "+villageType);
      }
   }

   if (nativePattern == 11)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native maya village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native aztec village "+villageType);
      }
   }

   if (nativePattern == 12)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native maya village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native carib village "+villageType);
      }
   }

   if (nativePattern == 13)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native carib village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native tupi village "+villageType);
      }
   }

   if (nativePattern == 14)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native inca village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native tupi village "+villageType);
      }
   }

   if (nativePattern == 15)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native maya village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native inca village "+villageType);
      }
   }

   if (nativePattern == 16)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native nootka village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native iroquois village "+villageType);
      }
   }

   if (nativePattern == 17)
   {
      if (whichNative == 1)
      {
	villageBID = rmCreateGrouping("village B", "native aztec village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageBID = rmCreateGrouping("village B", "native inca village "+villageType);
      }
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
      {
	villageCID = rmCreateGrouping("village C", "native cherokee village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native iroquois village "+villageType);
      }
   }

   if (nativePattern == 2)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native comanche village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 3)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native cherokee village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native seminole village "+villageType);
      }
   }

   if (nativePattern == 4)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native iroquois village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 5)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native iroquois village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native cree village "+villageType);
      }
   }

   if (nativePattern == 6)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native nootka village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native cree village "+villageType);
      }
   }

   if (nativePattern == 7)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native nootka village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native comanche village "+villageType);
      }
   }

   if (nativePattern == 8)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native cree village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native lakota village "+villageType);
      }
   }

   if (nativePattern == 9)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native comanche village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native seminole village "+villageType);
      }
   }

   if (nativePattern == 10)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native comanche village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native aztec village "+villageType);
      }
   }

   if (nativePattern == 11)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native maya village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native aztec village "+villageType);
      }
   }

   if (nativePattern == 12)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native maya village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native carib village "+villageType);
      }
   }

   if (nativePattern == 13)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native tupi village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native carib village "+villageType);
      }
   }

   if (nativePattern == 14)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native tupi village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native inca village "+villageType);
      }
   }

   if (nativePattern == 15)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native maya village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native inca village "+villageType);
      }
   }

   if (nativePattern == 16)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native nootka village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native iroquois village "+villageType);
      }
   }

   if (nativePattern == 17)
   {
      if (whichNative == 1)
      {
	villageCID = rmCreateGrouping("village C", "native aztec village "+villageType);
      }
      else if (whichNative == 2)
      {
	villageCID = rmCreateGrouping("village C", "native inca village "+villageType);
      }
   }
   rmAddGroupingToClass(villageCID, rmClassID("importantItem"));
   rmAddGroupingToClass(villageCID, rmClassID("natives"));
   rmSetGroupingMinDistance(villageCID, 0.0);
   rmSetGroupingMaxDistance(villageCID, rmXFractionToMeters(0.06));
   rmAddGroupingConstraint(villageCID, avoidImpassableLand);
   rmAddGroupingConstraint(villageCID, avoidWater10);
   rmAddGroupingConstraint(villageCID, avoidTradeRoute);
   rmAddGroupingConstraint(villageCID, avoidNatives);
   rmAddGroupingConstraint(villageCID, playerConstraint);

   // Placement of Native Americans
   if (nativeSetup < 4)
   {
      if (axisChance == 1)
         rmPlaceGroupingAtLoc(villageAID, 0, 0.5, 0.8); 
      else
         rmPlaceGroupingAtLoc(villageAID, 0, 0.8, 0.5);

      if (axisChance == 1)
         rmPlaceGroupingAtLoc(villageBID, 0, 0.5, 0.2);
      else
         rmPlaceGroupingAtLoc(villageBID, 0, 0.2, 0.5);

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
		if (variantChance == 1)
		{
               rmPlaceGroupingAtLoc(villageCID, 0, 0.49, 0.51);
               rmPlaceGroupingAtLoc(villageCID, 0, 0.51, 0.49);
	      }
		else
		{
               rmPlaceGroupingAtLoc(villageCID, 0, 0.51, 0.51);
               rmPlaceGroupingAtLoc(villageCID, 0, 0.49, 0.49);
	      }
	   }
	}
   }
   else if (nativeSetup > 5)
   {
	if (nativeSetup == 7)
	{
         if (axisChance == 1)
            rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.8); 
         else
            rmPlaceGroupingAtLoc(villageDID, 0, 0.8, 0.5);

         if (axisChance == 1)
            rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.2);
         else
            rmPlaceGroupingAtLoc(villageDID, 0, 0.2, 0.5);
	}
	if (nativeSetup == 8)
	{
	   rmSetGroupingMaxDistance(villageDID, rmXFractionToMeters(0.085));
         if (nativeNumber > 2)
	   {
		if (variantChance == 1)
		{
               rmPlaceGroupingAtLoc(villageDID, 0, 0.49, 0.51);
               rmPlaceGroupingAtLoc(villageDID, 0, 0.51, 0.49);
	      }
		else
		{
               rmPlaceGroupingAtLoc(villageDID, 0, 0.51, 0.51);
               rmPlaceGroupingAtLoc(villageDID, 0, 0.49, 0.49);
	      }
	   }
	}

      for(i=1; <cNumberPlayers) 
      {
         rmSetGroupingMinDistance(villageAID, 45.0);
         rmSetGroupingMaxDistance(villageAID, 70.0);           
	   rmPlaceGroupingAtLoc(villageAID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	   if (nativeSetup == 9)
	   {
            rmSetGroupingMinDistance(villageDID, 45.0);
            rmSetGroupingMaxDistance(villageDID, 70.0);      
		rmPlaceGroupingAtLoc(villageDID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	   }
	   if (nativeSetup == 10)
		rmPlaceGroupingAtLoc(villageAID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
      }
   }
   else if (nativeSetup > 3) // setup 4 and 5
   {
      if (axisChance == 1)
         rmPlaceGroupingAtLoc(villageAID, 0, 0.5, 0.8); 
      else
         rmPlaceGroupingAtLoc(villageAID, 0, 0.8, 0.5);

      if (axisChance == 1)
         rmPlaceGroupingAtLoc(villageAID, 0, 0.5, 0.2);
      else
         rmPlaceGroupingAtLoc(villageAID, 0, 0.2, 0.5);
	if (nativeSetup == 4)
	{
	   if (variantChance == 1)
	   {
            rmPlaceGroupingAtLoc(villageDID, 0, 0.49, 0.51);
            rmPlaceGroupingAtLoc(villageDID, 0, 0.51, 0.49);
         }
   	   else
	   {
            rmPlaceGroupingAtLoc(villageDID, 0, 0.51, 0.51);
            rmPlaceGroupingAtLoc(villageDID, 0, 0.49, 0.49);
	   }
	}
   	rmSetGroupingMaxDistance(villageDID, rmXFractionToMeters(0.18));
      if (axisChance == 1)
	{
         rmPlaceGroupingAtLoc(villageDID, 0, 0.8, 0.5);
         rmPlaceGroupingAtLoc(villageDID, 0, 0.2, 0.5);
      }
	else
	{
         rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.8);
         rmPlaceGroupingAtLoc(villageDID, 0, 0.5, 0.2);
	}  
   }
  
   // Text
   rmSetStatusText("",0.60);

// Player Nuggets
   int playerNuggetID=rmCreateObjectDef("player nugget");
   rmAddObjectDefItem(playerNuggetID, "nugget", 1, 0.0);
   rmAddObjectDefToClass(playerNuggetID, rmClassID("nuggets"));
   rmSetObjectDefMinDistance(playerNuggetID, 35.0);
   rmSetObjectDefMaxDistance(playerNuggetID, 45.0);
   rmAddObjectDefConstraint(playerNuggetID, avoidStartingUnitsSmall);
   rmAddObjectDefConstraint(playerNuggetID, avoidTradeRoute);
   rmAddObjectDefConstraint(playerNuggetID, avoidSocket);
   rmAddObjectDefConstraint(playerNuggetID, avoidNugget);
   rmAddObjectDefConstraint(playerNuggetID, avoidNatives);
   rmAddObjectDefConstraint(playerNuggetID, circleConstraint);
   rmAddObjectDefConstraint(playerNuggetID, avoidWater10);

   for(i=1; <cNumberPlayers)
   {
 	rmSetNuggetDifficulty(1, 1);
	rmPlaceObjectDefAtLoc(playerNuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
	rmPlaceObjectDefAtLoc(playerNuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
   }

// Cliffs
   int cliffHt = -1;
   int failCount=0;
   int numTries=cNumberNonGaiaPlayers*11;

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
	numTries=cNumberNonGaiaPlayers*8;

   if (makeCliffs == 1)
   { 
	if (cliffVariety == 6) // for Sonora only
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
		  rmSetAreaCliffHeight(mesaID, rmRandInt(4,10), 1.0, 1.0);
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
	   numTries=cNumberNonGaiaPlayers*14;
      else
	   numTries=cNumberNonGaiaPlayers*17;

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
		rmAddAreaConstraint(smallMesaID, avoidWater20);
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
      else // all other maps with cliffs
      {
         int numCliffs = rmRandInt(5,7);
	   if (cliffVariety == 2) 
 	      numCliffs = rmRandInt(6,8);
         if (makeCentralCliffArea == 1)
		numCliffs = rmRandInt(3,5);

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
		rmBuildArea(bigCliffID);
         }
      }
   }

// Random Nuggets
   int nuggetID= rmCreateObjectDef("nugget"); 
   rmAddObjectDefItem(nuggetID, "Nugget", 1, 0.0);
   rmAddObjectDefToClass(nuggetID, rmClassID("nuggets"));
   rmSetObjectDefMinDistance(nuggetID, 45.0);
   rmSetObjectDefMaxDistance(nuggetID, rmXFractionToMeters(0.35));
   rmAddObjectDefConstraint(nuggetID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(nuggetID, avoidNugget);
   rmAddObjectDefConstraint(nuggetID, avoidStartingUnits);
   rmAddObjectDefConstraint(nuggetID, avoidTradeRoute);
   rmAddObjectDefConstraint(nuggetID, avoidSocket);
   rmAddObjectDefConstraint(nuggetID, avoidAll);
   rmAddObjectDefConstraint(nuggetID, nuggetPlayerConstraint);
   rmAddObjectDefConstraint(nuggetID, circleConstraint);
   rmAddObjectDefConstraint(nuggetID, avoidWater20);

   for(i=1; <cNumberPlayers)
   {
      rmSetNuggetDifficulty(2, 2);
	rmPlaceObjectDefAtLoc(nuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
      rmSetNuggetDifficulty(3, 3);
	rmPlaceObjectDefAtLoc(nuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
   }
   
   rmAddObjectDefConstraint(nuggetID, farPlayerConstraint);
   rmSetObjectDefMinDistance(nuggetID, 85.0);
   for(i=1; <cNumberPlayers)
   {
      rmSetNuggetDifficulty(2, 2);
	rmPlaceObjectDefAtLoc(nuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
      rmSetNuggetDifficulty(4, 4);
	rmPlaceObjectDefAtLoc(nuggetID, 0, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
   }

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
   rmAddObjectDefItem(StartBerryBushID, "BerryBush", 2, 4.0);
   rmSetObjectDefMinDistance(StartBerryBushID, 10.0);
   rmSetObjectDefMaxDistance(StartBerryBushID, 16.0);
   rmAddObjectDefConstraint(StartBerryBushID, avoidStartingUnitsSmall);
   if (placeBerries == 1)
      rmPlaceObjectDefPerPlayer(StartBerryBushID, false, 1);

   // start area huntable
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

   // second huntable
   int deer2Num = rmRandInt(4, 7);
   int farPronghornID=rmCreateObjectDef("far pronghorn");
   rmAddObjectDefItem(farPronghornID, deer2Type, deer2Num, 4.0);
   rmAddObjectDefToClass(farPronghornID, rmClassID("huntableFood"));
   rmSetObjectDefMinDistance(farPronghornID, 42.0);
   rmSetObjectDefMaxDistance(farPronghornID, 65.0);
   rmAddObjectDefConstraint(farPronghornID, avoidStartResource);
   rmAddObjectDefConstraint(farPronghornID, mediumPlayerConstraint);
   rmAddObjectDefConstraint(farPronghornID, shortAvoidImpassableLand);
   rmAddObjectDefConstraint(farPronghornID, avoidNatives);
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
   rmSetObjectDefMinDistance(GoldFarID, 75.0);
   rmSetObjectDefMaxDistance(GoldFarID, 100.0);
   rmPlaceObjectDefPerPlayer(GoldFarID, false, rmRandInt(1, 2));

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
   rmSetObjectDefMinDistance(extraGoldID, 0.0);
   rmSetObjectDefMaxDistance(extraGoldID, 60.0);
   rmPlaceObjectDefAtLoc(extraGoldID, 0, 0.5, 0.5, rmRandInt(2, 3));
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
   int GoldFartherID=rmCreateObjectDef("player silver farther");
   rmAddObjectDefItem(GoldFartherID, "mine", 1, 0.0);
   rmAddObjectDefConstraint(GoldFartherID, avoidTradeRoute);
   rmAddObjectDefConstraint(GoldFartherID, avoidSocket);
   rmAddObjectDefConstraint(GoldFartherID, coinAvoidCoin);
   rmAddObjectDefConstraint(GoldFartherID, shortAvoidCanyons);
   rmAddObjectDefConstraint(GoldFartherID, avoidImportantItemSmall);
   rmAddObjectDefConstraint(GoldFartherID, circleConstraint);
   rmAddObjectDefConstraint(GoldFartherID, avoidAll);
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
      rmSetObjectDefMaxDistance(GoldFartherID, 125.0);
      rmAddObjectDefConstraint(GoldFartherID, fartherPlayerConstraint);
   }
   if (makePond == 1)
	rmPlaceObjectDefPerPlayer(GoldFartherID, false, 3);
   else
	rmPlaceObjectDefPerPlayer(GoldFartherID, false, 2);

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

   // Text
   rmSetStatusText("",0.70);

// sheep etc
   if (sheepChance > 0)
   {
      int sheepID=rmCreateObjectDef("herdable animal");
      rmAddObjectDefItem(sheepID, sheepType, 2, 4.0);
      rmSetObjectDefMinDistance(sheepID, 35.0);
      rmAddObjectDefToClass(sheepID, rmClassID("herdableFood"));
      rmSetObjectDefMaxDistance(sheepID, rmXFractionToMeters(0.5));
      rmAddObjectDefConstraint(sheepID, avoidSheep);
      rmAddObjectDefConstraint(sheepID, avoidAll);
      rmAddObjectDefConstraint(sheepID, playerConstraint);
      rmAddObjectDefConstraint(sheepID, avoidCliffs);
      rmAddObjectDefConstraint(sheepID, avoidImpassableLand);
      if (rmRandInt(1,2) == 1)
         rmPlaceObjectDefAtLoc(sheepID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*3);
      else 
         rmPlaceObjectDefAtLoc(sheepID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*4); 
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
   rmAddObjectDefConstraint(centralHerdID, longPlayerConstraint);
   rmAddObjectDefConstraint(centralHerdID, huntableConstraint);
   rmSetObjectDefCreateHerd(centralHerdID, true);
   rmPlaceObjectDefAtLoc(centralHerdID, 0, 0.5, 0.5, 2);
   // additional of central herd type
   rmAddObjectDefConstraint(centralHerdID, fartherPlayerConstraint);
   rmSetObjectDefMinDistance(centralHerdID, rmXFractionToMeters(0.3));
   rmSetObjectDefMaxDistance(centralHerdID, rmXFractionToMeters(0.38));
   rmPlaceObjectDefPerPlayer(centralHerdID, false, 1);

// Central forests
   if (patternChance == 8)  // for Rockies
   {
      numTries=3*cNumberNonGaiaPlayers;
	if (cNumberNonGaiaPlayers > 4)
	   numTries=2*cNumberNonGaiaPlayers;
      if (centerMt == 1)
	{
         for (i=0; <numTries)
         { 
         int snowForestPatchID = rmCreateArea("snow forest patch"+i, rmAreaID("snow patch 2"));
         rmAddAreaToClass(snowForestPatchID, rmClassID("classForest"));
         rmSetAreaWarnFailure(snowForestPatchID, false);
         rmSetAreaSize(snowForestPatchID, rmAreaTilesToFraction(150), rmAreaTilesToFraction(180));
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
	else  // for central highlands
	{
	   numTries=2*cNumberNonGaiaPlayers;
         for (i=0; <numTries)
         { 
         int snowForestPatch2ID = rmCreateArea("second snow forest patch"+i, rmAreaID("center highlands"));
         rmAddAreaToClass(snowForestPatch2ID, rmClassID("classForest"));
         rmSetAreaWarnFailure(snowForestPatch2ID, false);
         rmSetAreaSize(snowForestPatch2ID, rmAreaTilesToFraction(150), rmAreaTilesToFraction(180));
         rmSetAreaCoherence(snowForestPatch2ID, 0.6);
         rmSetAreaForestType(snowForestPatch2ID, "rockies snow forest");
         rmSetAreaForestDensity(snowForestPatch2ID, 1.0);
         rmSetAreaForestClumpiness(snowForestPatch2ID, 0.9);
         rmSetAreaForestUnderbrush(snowForestPatch2ID, 0.0);
         rmSetAreaCoherence(snowForestPatch2ID, 0.4);
         rmSetAreaSmoothDistance(snowForestPatch2ID, 10);
         rmAddAreaConstraint(snowForestPatch2ID, avoidAll);
         rmAddAreaConstraint(snowForestPatch2ID, avoidTradeRoute);
	   rmAddAreaConstraint(snowForestPatch2ID, avoidSocket);
	   rmAddAreaConstraint(snowForestPatch2ID, avoidNativesShort);
         rmBuildArea(snowForestPatch2ID);
	   }
      }          
   }

   if (mtForest == 1) // for all other maps central highlands or canyons
   {
      numTries=2*cNumberNonGaiaPlayers;
      for (i=0; <numTries)
      { 
         int forestPatchID = rmCreateArea("forest patch"+i, rmAreaID("center highlands"));
         rmAddAreaToClass(forestPatchID, rmClassID("classForest"));
         rmSetAreaWarnFailure(forestPatchID, false);
         rmSetAreaSize(forestPatchID, rmAreaTilesToFraction(100), rmAreaTilesToFraction(180));
         rmSetAreaCoherence(forestPatchID, 0.6);
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

// forest
   int forestChance = -1;
   numTries=23*cNumberNonGaiaPlayers;
   if (cNumberNonGaiaPlayers == 3)
      numTries=22*cNumberNonGaiaPlayers;  
   if (cNumberNonGaiaPlayers > 3)
      numTries=19*cNumberNonGaiaPlayers;  
   if (cNumberNonGaiaPlayers > 5)
      numTries=17*cNumberNonGaiaPlayers;  

   if(reducedForest == 1)
   {
      numTries=21*cNumberNonGaiaPlayers;
      if (cNumberNonGaiaPlayers == 3)
         numTries=19*cNumberNonGaiaPlayers;  
      if (cNumberNonGaiaPlayers > 3)
         numTries=16*cNumberNonGaiaPlayers;  
      if (cNumberNonGaiaPlayers > 5)
         numTries=14*cNumberNonGaiaPlayers;    
   }
   failCount=0;

   for (i=0; <numTries)
   {
      forestChance = rmRandInt(1, 2);
      int forest=rmCreateArea("forest "+i);
      rmSetAreaWarnFailure(forest, false);
      rmSetAreaSize(forest, rmAreaTilesToFraction(175), rmAreaTilesToFraction(235));
      rmSetAreaForestType(forest, forestType);
      rmSetAreaForestDensity(forest, rmRandFloat(0.7, 1.0));
      rmSetAreaForestClumpiness(forest, rmRandFloat(0.5, 0.9));
      rmSetAreaForestUnderbrush(forest, rmRandFloat(0.0, 0.5));
      rmSetAreaCoherence(forest, rmRandFloat(0.4, 0.7));
      if (forestChance == 2)
      {
		rmSetAreaMinBlobs(forest, 1);
		rmSetAreaMaxBlobs(forest, 3);					
		rmSetAreaMinBlobDistance(forest, 12.0);
		rmSetAreaMaxBlobDistance(forest, 24.0);
	}
      rmSetAreaSmoothDistance(forest, 20);
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
	if (makeCentralHighlands == 1)
   	   rmAddAreaConstraint(forest, centerConstraintShort);
	if (hillTrees == 1)
         rmSetAreaBaseHeight(forest, rmRandFloat(3.5, 5.0));
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

   // Dirt patches for Carolina
   if (patternChance == 2)
   {
	if (variantChance == 2)
	{
	   for (i=0; <cNumberNonGaiaPlayers*5)   
         {
		int dirtPatchC=rmCreateArea("carolina dirt patch "+i);
		rmSetAreaWarnFailure(dirtPatchC, false);
		rmSetAreaSize(dirtPatchC, rmAreaTilesToFraction(170), rmAreaTilesToFraction(240));
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
	   for (i=0; <cNumberNonGaiaPlayers*9)   
         {
		int gpPatch=rmCreateArea("GP patch "+i);
		rmSetAreaWarnFailure(gpPatch, false);
		rmSetAreaSize(gpPatch, rmAreaTilesToFraction(120), rmAreaTilesToFraction(220));
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
   for(i=0; <cNumberNonGaiaPlayers*15)
      rmPlaceObjectDefAtLoc(StragglerTreeID, 0, 0.5, 0.5);

   // Text
   rmSetStatusText("",0.90);

// Fish
   int fishID=rmCreateObjectDef("fish");
   int fishVsFishID=rmCreateTypeDistanceConstraint("fish v fish", "fish", 26.0);
   int fishLand = rmCreateTerrainDistanceConstraint("fish land", "land", true, 7.0);
   rmAddObjectDefItem(fishID, fishType, 2, 5.0);
   rmSetObjectDefMinDistance(fishID, 0.0);
   rmSetObjectDefMaxDistance(fishID, rmXFractionToMeters(0.5));
   rmAddObjectDefConstraint(fishID, fishVsFishID);
   rmAddObjectDefConstraint(fishID, fishLand);
   rmAddObjectDefConstraint(fishID, centerConstraintFar);
   if (cNumberNonGaiaPlayers < 4)
      rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*18);
   else if (cNumberNonGaiaPlayers < 6)
      rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*16);
   else
      rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, cNumberNonGaiaPlayers*14);

// Whales
   int whaleID=rmCreateObjectDef("whale");
   int whaleLand = rmCreateTerrainDistanceConstraint("whale v. land", "land", true, 18.0);
   int whaleVsWhaleID=rmCreateTypeDistanceConstraint("whale v whale", whaleType, 40.0);
   rmAddObjectDefItem(whaleID, whaleType, 1, 5.0);
   rmSetObjectDefMinDistance(whaleID, 0.0);
   rmSetObjectDefMaxDistance(whaleID, rmXFractionToMeters(0.5));
   rmAddObjectDefConstraint(whaleID, whaleVsWhaleID);
   rmAddObjectDefConstraint(whaleID, whaleLand);
   rmAddObjectDefConstraint(whaleID, centerConstraintFar);
   if (cNumberNonGaiaPlayers < 4)
      rmPlaceObjectDefAtLoc(whaleID, 0, 0.5, 0.5, 5*cNumberNonGaiaPlayers);
   else
      rmPlaceObjectDefAtLoc(whaleID, 0, 0.5, 0.5, 4*cNumberNonGaiaPlayers);

// Deco
   
   if (patternChance == 3)
   {	
	int treeClumps = rmRandInt(7,10);
	for(i=1; < treeClumps)
	{
	   int randomWaterTreeID=rmCreateObjectDef("random tree in water"+i);	
   	   rmAddObjectDefItem(randomWaterTreeID, "treeBayouMarsh", rmRandInt(2,5), 3.0);
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

   if (patternChance == 6)
   {
      int coastalRockID=rmCreateObjectDef("coastal rocks");
      rmAddObjectDefItem(coastalRockID, "coastalRocksSaguenay", 1, 0.0);
      rmSetObjectDefMinDistance(coastalRockID, 0.0);
      rmSetObjectDefMaxDistance(coastalRockID, rmXFractionToMeters(0.5));
      rmAddObjectDefConstraint(coastalRockID, rockVsLand);
	rmAddObjectDefConstraint(coastalRockID, nearShore);
      rmAddObjectDefConstraint(coastalRockID, avoidStartingUnits);
      rmPlaceObjectDefAtLoc(coastalRockID, 0, 0.5, 0.5, 6*cNumberNonGaiaPlayers);
   }

   if (patternChance == 12)
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

	for(i=1; <16*cNumberNonGaiaPlayers)
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

	for(i=1; <14*cNumberNonGaiaPlayers)
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
	rmPlaceObjectDefAtLoc(Grass, 0, 0.5, 0.5, 10*cNumberNonGaiaPlayers);
   }
   
   if (patternChance == 17) // Pampas
   {
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
      rmPlaceObjectDefAtLoc(decoUnderbrushID, 0, 0.5, 0.5, 12*cNumberNonGaiaPlayers);
   }

}  

  
