r");
	
	    // SET THE MAP TYPE:
		rmSetMapType("newEngland");
	    rmSetMapType("water");
		rmSetMapType("grass");
	    
	    // SET THE LIGHTING:
		rmSetLightingSet("new england");
	    		
		// SET WIND MAGNITUDE:
		rmSetWindMagnitude(2.0);

	    // CHOOSE THE MERCS:
	    chooseMercs();

	    // CORNER CONSTRAINT:
	    rmSetWorldCircleConstraint(true);
/*================================================================================================================*/
   // TEXT:
   // THESE STATUS TEXT LINES ARE USED TO MANUALLY ANIMATE THE MAP GENERATION PROGRESS BAR:
   rmSetStatusText("",0.15);
/*================================================================================================================*/
// ******************************************* DEFINE THE CLASSES: ********************************************** //
/*----------------------------------------------------------------------------------------------------------------*/
// NONE FOR NOW:
/*----------------------------------------------------------------------------------------------------------------*/
	    int classPlayer=rmDefineClass("player");
	    rmDefineClass("startingUnit");
	    rmDefineClass("classForest");
	    rmDefineClass("importantItem");
	    rmDefineClass("natives");
		rmDefineClass("nuggets");
		rmDefineClass("SocketClass");
	    int classbigContinent=rmDefineClass("big continent");
		rmDefineClass("region1");
		rmDefineClass("corner");
		rmDefineClass("bay");
/*================================================================================================================*/
   // TEXT:
   // THESE STATUS TEXT LINES ARE USED TO MANUALLY ANIMATE THE MAP GENERATION PROGRESS BAR:
   rmSetStatusText("",0.20);
/*================================================================================================================*/
// **************************************** DEFINE THE CONSTRAINTS: ********************************************* //
/*================================================================================================================*/
	    // MAP EDGE CONSTRAINT:
		int playerEdgeConstraint=rmCreateBoxConstraint("player edge of map", rmXTilesToFraction(6), rmZTilesToFraction(6), 1.0-rmXTilesToFraction(6), 1.0-rmZTilesToFraction(6), 0.01);
  		int longPlayerConstraint=rmCreateClassDistanceConstraint("continent stays away from players", classPlayer, 12.0);

	    // PLAYER CONSTRAINTS:
	    int playerConstraint=rmCreateClassDistanceConstraint("stay away from players", classPlayer, 15.0);
		
		// Bonus area constraint.
        int bigContinentConstraint=rmCreateClassDistanceConstraint("avoid bonus island", classbigContinent, 15.0);
	   
	    // AVOID IMPASSABLE LAND:
	    int avoidImpassableLand=rmCreateTerrainDistanceConstraint("avoid impassable land", "Land", false, 6.0);
	    	
	    // SEAFOOD AVOIDANCE:
		int fishVsFishID=rmCreateTypeDistanceConstraint("fish v fish", "FishCod", 18.0);
        int fishLand = rmCreateTerrainDistanceConstraint("fish land", "land", true, 6.0);
		int whaleLand = rmCreateTerrainDistanceConstraint("whale v. land", "land", true, 15.0);
		int whaleVsWhaleID=rmCreateTypeDistanceConstraint("whale v whale", "minkeWhale", 50.0);
        	
	    // NATIVES AVOIDANCE:
	    int avoidNatives=rmCreateClassDistanceConstraint("stuff avoid natives", rmClassID("natives"), 15.0);
		
	    // SILVER MINES CONSTRAINT:
	    int avoidCoin=rmCreateTypeDistanceConstraint("stuff avoid silver", "Mine", 15.0);
		
		// RANDOM TREES AVOIDANCE:
	    int avoidTrees=rmCreateTypeDistanceConstraint("stuff avoid Trees", "TreeNewEngland", 5.0);
		
		// GOLD MINES CONSTRAINT:
	    int avoidGold=rmCreateTypeDistance<?xml version = "1.0" encoding = "UTF-8"?>

<mapinfo 

details = "45739" 
imagepath = "ui\random_map\standard_maps" 
displayName = "The Autumn War" 
cannotReplace = ""
loadDetailsText="This is a nice large Map with a New England rms Style." 
loadBackground="ui\random_map\all_maps">

<loadss>ui\random_map\new_england\new_england_ss_01</loadss>
<loadss>ui\random_map\new_england\new_england_ss_02</loadss>
<loadss>ui\random_map\new_england\new_england_ss_03</loadss>

</mapinfo>