function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 104; // Pac
	global.__objectDepths[1] = 200; // Wall
	global.__objectDepths[2] = 201; // Dot
	global.__objectDepths[3] = 0; // Slow
	global.__objectDepths[4] = 100; // Blinky
	global.__objectDepths[5] = 198; // Power
	global.__objectDepths[6] = 101; // Pinky
	global.__objectDepths[7] = 102; // Inky
	global.__objectDepths[8] = 103; // Clyde
	global.__objectDepths[9] = 105; // Fruit
	global.__objectDepths[10] = 0; // NoUp
	global.__objectDepths[11] = 0; // Title
	global.__objectDepths[12] = 0; // Cutscene
	global.__objectDepths[13] = 0; // Menu
	global.__objectDepths[14] = 0; // Pauser
	global.__objectDepths[15] = 0; // Blank
	global.__objectDepths[16] = 200; // HanglyWall
	global.__objectDepths[17] = -500; // Scroller
	global.__objectDepths[18] = 0; // Up
	global.__objectDepths[19] = 0; // Left
	global.__objectDepths[20] = 0; // Down
	global.__objectDepths[21] = 0; // Right
	global.__objectDepths[22] = 0; // Drawless
	global.__objectDepths[23] = 0; // Mac


	global.__objectNames[0] = "Pac";
	global.__objectNames[1] = "Wall";
	global.__objectNames[2] = "Dot";
	global.__objectNames[3] = "Slow";
	global.__objectNames[4] = "Blinky";
	global.__objectNames[5] = "Power";
	global.__objectNames[6] = "Pinky";
	global.__objectNames[7] = "Inky";
	global.__objectNames[8] = "Clyde";
	global.__objectNames[9] = "Fruit";
	global.__objectNames[10] = "NoUp";
	global.__objectNames[11] = "Title";
	global.__objectNames[12] = "Cutscene";
	global.__objectNames[13] = "Menu";
	global.__objectNames[14] = "Pauser";
	global.__objectNames[15] = "Blank";
	global.__objectNames[16] = "HanglyWall";
	global.__objectNames[17] = "Scroller";
	global.__objectNames[18] = "Up";
	global.__objectNames[19] = "Left";
	global.__objectNames[20] = "Down";
	global.__objectNames[21] = "Right";
	global.__objectNames[22] = "Drawless";
	global.__objectNames[23] = "Mac";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
