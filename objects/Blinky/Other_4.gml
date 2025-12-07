/// ===== BLINKY OTHER[4] EVENT - SPAWN/INITIALIZATION =====
/// Runs once at room start to initialize speed values based on game level, variant, and mode
/// Other[4] is used because it's the "Custom User Defined Event 4" (custom event)

/// ===== TILE ALIGNMENT =====
// Snap current position to tile grid coordinates
tilex = 16 * round(x / 16);
tiley = 16 * round(y / 16);
newtile = 0;  // Reset new tile flag (prevents pathfinding on first step)

/// ===== SPEED CONFIGURATION BY GAME TYPE & LEVEL =====
/// Speeds are carefully calibrated per level to maintain game difficulty progression
/// Lower values = slower; higher values = faster

if (global.game < 2) {
    // STANDARD PAC-MAN MODE
    sp = 1.875;          // Normal chase speed (baseline)
    spslow = 1;          // Tunnel/slow area speed
    spfright = 1.25;     // Frightened mode speed (when Pac has power pellet)
    spelroy = 2;         // Elroy mode 1: Speeds up when dots are low (first threshold)
    spelroy2 = 2.125;    // Elroy mode 2: Even faster when very few dots remain

    // LEVEL 2+: Increase speeds for difficulty
    if (global.lvl > 1) {
        sp = 2.125;
        spslow = 1.125;
        spfright = 1.375;
        spelroy = 2.25;
        spelroy2 = 2.375;
    }

    // LEVEL 5+ or PLUS MODE: Further increase for more challenge
    if (global.lvl > 4 || global.plus == 1) {
        sp = 2.375;
        spslow = 1.25;
        spfright = 1.5;
        spelroy = 2.5;
        spelroy2 = 2.625;
    }
} else {
    // GAME VARIANT 2 MODE (alternate game type)
    sp = 2.125;          // Starts at medium speed
    spslow = 1.125;
    spfright = 1.375;
    spelroy = 2.25;
    spelroy2 = 2.375;

    // LEVEL 3+ or PLUS MODE: Speed boost
    if (global.lvl > 2 || global.plus == 1) {
        sp = 2.375;
        spslow = 1.25;
        spfright = 1.5;
        spelroy = 2.5;
        spelroy2 = 2.625;
    }
}

// EYES SPEED (Returning to house): Always same, independent of level
speyes = 4;

// SPEED BOOST POWER-UP: Temporarily massively increase speed (activated by global.boost = 2)
if (global.boost == 2) {
    sp = 4;
    spelroy = 4.125;
    spelroy2 = 4.25;
}

/// ===== ELROY MODE THRESHOLDS =====
/// When remaining dots drop below these thresholds, Blinky enters Elroy mode
/// and speeds up to chase Pac more aggressively (adding difficulty late-game)

elroydots = 224;   // Elroy mode 1 threshold: activate when ≤ 224 dots remain
elroydots2 = 234;  // Elroy mode 2 threshold: activate when ≤ 234 dots remain

// LEVEL 2: Stricter Elroy thresholds (activate later in the level)
if (global.lvl == 2) {
    elroydots = 214;
    elroydots2 = 229;
} else if (global.lvl > 2) {
    // LEVEL 3+: More lenient (activate earlier)
    elroydots = 204;
    elroydots2 = 224;
}

if (global.lvl > 5) {
    elroydots = 194;
    elroydots2 = 219;
}

if (global.lvl > 8) {
    elroydots = 184;
    elroydots2 = 214;
}

if (global.lvl > 11) {
    elroydots = 164;
    elroydots2 = 204;
}

if (global.lvl > 14) {
    elroydots = 144;
    elroydots2 = 194;
}

if (global.lvl > 18) {
    elroydots = 124;
    elroydots2 = 184;
}

// GAME VARIANT 2: Double the thresholds (Elroy activates much later, easier game)
if (global.game == 2) {
    elroydots = elroydots * 2;
    elroydots2 = elroydots2 * 2;
}

// PLUS MODE: Flip thresholds (Elroy activates when MORE dots remain, much harder)
if (global.plus == 1) {
    elroydots = elroydots - (global.dottotal - elroydots);
    elroydots2 = elroydots2 - (global.dottotal - elroydots2);
}

/// ===== MOVEMENT & BEHAVIOR INITIALIZATION =====
dir = 2;                // Cardinal direction: 0=right, 1=up, 2=left, 3=down (Blinky starts facing left)
im = 0;                 // Animation frame counter (0-15, resets)
aboutface = 0;          // About-face flag: 0=normal, 1=reversal pending

// Initial velocity: move left at normal speed
hspeed = -sp;
vspeed = 0;

/// ===== STATE MACHINE INITIALIZATION =====
state = 0;              // State: 0=chase/scatter, 1=frightened, 2=eyes returning home

/// ===== VISUAL & BEHAVIOR STATE =====
flash = 0;              // Flashing in frightened mode: 0=solid, 1=transparent (during rapid flashing)
house = 0;              // In house flag: 0=released (free), 1=trapped in house
housestate = 0;         // House state machine: 0=exiting, 1=inside (moving up)
resdir = -1;            // Reversal direction flag (set when reversing)
chomped = 0;            // Eaten flag: 0=alive, 1=eaten (body gone, showing eyes)

/// ===== SCATTER MODE TARGETS =====
cornerx = 400;          // Scatter corner X (top-left in standard Pac-Man)
cornery = -16;          // Scatter corner Y

/// ===== ELROY STATE TRACKING =====
elroy = 0;              // Elroy mode: 0=off, 1=mode 1, 2=mode 2 (used for visual/audio feedback)
uppity = 1;             // Unused flag

