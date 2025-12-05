function __init_global() {
	gml_pragma( "global", "__init_global();");

	// set any global defaults
	layer_force_draw_depth(true,0);		// force all layers to draw at depth 0
	draw_set_colour( c_black );

	// Initialize color variables
	global.mr = 255;
	global.mg = 255;
	global.mb = 255;
	global.mr2 = 255;
	global.mg2 = 255;
	global.mb2 = 255;
	global.dr = 255;
	global.dg = 255;
	global.db = 255;

	// Initialize game state variables
	global.game = 0;
	global.rand = 0;
	global.lvl = 0;
	global.mode = 0;
	global.randchoose = 0;

	// Initialize player variables
	global.p1score = 0;
	global.p1lives = 3;
	global.p1gameover = 0;
	global.p1x = 0;
	global.p1y = 0;
	global.p2score = 0;
	global.p2lives = 3;
	global.p2gameover = 0;
	global.p2x = 0;
	global.p2y = 0;
	global.p3x = 0;
	global.p3y = 0;
	global.players = 1;

	// Initialize score variables (game modes)
	global.pacscore = 0;
	global.pacplusscore = 0;
	global.pacrandscore = 0;
	global.pacplusrandscore = 0;
	global.hanglyscore = 0;
	global.hanglyplusscore = 0;
	global.babyloop = 0;
	global.babylvl = 0;
	global.babyscore = 0;
	global.baby2score = 0;
	global.baby3score = 0;
	global.ultrascore = 0;
	global.ultraplusscore = 0;
	global.arrscore = 0;
	global.arrplusscore = 0;
	global.mspacscore = 0;
	global.mspacplusscore = 0;
	global.mspacrandscore = 0;
	global.mspacplusrandscore = 0;
	global.mspmpscore = 0;
	global.mspmpplusscore = 0;
	global.pacjrscore = 0;
	global.pacjrplusscore = 0;
	global.jrpacscore = 0;
	global.jrpacplusscore = 0;
	global.jrpacrandscore = 0;
	global.jrpacplusrandscore = 0;
	global.strangescore = 0;
	global.strangeplusscore = 0;
	global.champscore = 0;
	global.champsplusscore = 0;
	global.c64score = 0;
	global.c64plusscore = 0;
	global.a2600score = 0;
	global.a2600plusscore = 0;
	global.bleachscore = 0;
	global.bleachplusscore = 0;
	global.extendedscore = 0;
	global.extendedplusscore = 0;
	global.newscore = 0;
	global.newplusscore = 0;

	// Initialize game flags and counters
	global.start = 0;
//	global.credit = 0;
	global.dottotal = 0;
	global.extralife = 0;
	global.extralife2 = 0;
	global.color = 0;
	global.last = 0;
	global.loop = 0;
	global.loopcount = 0;
	global.boost = 0;
	global.otto = 0;
	global.doki = 0;
	global.smashno = 0;
	global.ex1 = 0;
	global.ex2 = 0;
	global.plus = 0;

}
