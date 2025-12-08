/// ===============================================================================
/// GAME MANAGER - ROOM INITIALIZATION
/// ===============================================================================
/// Purpose: Initialize game state variables when entering a room/level
/// Called: Room Start event (once per level)
///
/// Major Sections:
/// 1. Level Progression & Dot Totals
/// 2. Speed Configuration (Level & Game Variant)
/// 3. Fright Mode Timing Tables
/// 4. Ghost Release & Cycle Timings
/// 5. Game State Initialization
/// ===============================================================================

/// ===============================================================================
/// SECTION 1: LEVEL PROGRESSION & DOT TOTALS
/// ===============================================================================
/// Increment level number if player(s) still have lives
if (global.p1lives > 0 || global.p2lives > 0) {
    global.lvl = global.lvl + 1;
}

/// Calculate total dots/pellets in this level for completion detection
global.dottotal = (instance_number(Dot) + instance_number(Power));

/// ===============================================================================
/// SECTION 2: SPEED CONFIGURATION (LEVEL & GAME VARIANT)
/// ===============================================================================

/// PLUS MODE SPEEDS (Ms. Pac-Man Plus / Jr. Pac-Man)
if (global.plus == PAC_PLUS_MODE.ACTIVE) {
    oGameManager.sp = 2.5;
    spfright = 2.5;

    if (global.game < 2 && global.lvl > 15) {
        oGameManager.sp = 2.25;
        spfright = 2.375;
    }
    if (global.game == 2 && global.lvl > 12) {
        oGameManager.sp = 2.25;
        spfright = 2.375;
    }
} else {
    /// STANDARD MODE SPEEDS
    if (global.game < 2) {
        oGameManager.sp = 2.00001;
        spfright = 2.25;

        if (global.lvl > 1) {
            oGameManager.sp = 2.25;
            spfright = 2.375;
        }
        if (global.lvl > 4) {
            oGameManager.sp = 2.5;
            spfright = 2.5;
        }
        if (global.lvl > 20) {
            oGameManager.sp = 2.25;
            spfright = 2.375;
        }
    } else {
        /// Jr. Pac-Man standard mode
        oGameManager.sp = 2.25;
        spfright = 2.375;

        if (global.lvl > 2) {
            oGameManager.sp = 2.5;
            spfright = 2.5;
        }
        if (global.lvl > 15) {
            oGameManager.sp = 2.25;
            spfright = 2.375;
        }
    }
}

/// BOOST MODE OVERRIDE
if (global.boost > 0) {
    oGameManager.sp = 4;
    spfright = 4;
}

/// ===============================================================================
/// SECTION 3: FRIGHT MODE TIMING TABLES
/// ===============================================================================
fright = PAC_FRIGHT.OFF;

/// STANDARD AND MS. PAC-MAN FRIGHT TIMINGS
if (global.plus == PAC_PLUS_MODE.INACTIVE) {
    if (global.game < 2) {
        frighttime = 360;

        if (global.lvl == 2) frighttime = 300;
        if (global.lvl == 3) frighttime = 240;
        if (global.lvl == 4) frighttime = 180;
        if (global.lvl == 5) frighttime = 120;
        if (global.lvl == 6) frighttime = 300;
        if (global.lvl == 7) frighttime = 120;
        if (global.lvl == 8) frighttime = 120;
        if (global.lvl == 9) frighttime = 60;
        if (global.lvl == 10) frighttime = 300;
        if (global.lvl == 11) frighttime = 120;
        if (global.lvl == 12) frighttime = 60;
        if (global.lvl == 13) frighttime = 60;
        if (global.lvl == 14) frighttime = 180;
        if (global.lvl == 15) frighttime = 60;
        if (global.lvl == 16) frighttime = 60;
        if (global.lvl == 17) frighttime = 0;
        if (global.lvl == 18) frighttime = 60;
        if (global.lvl > 18) frighttime = 0;
    } else {
        /// Jr. Pac-Man
        frighttime = 360;

        if (global.lvl == 2) frighttime = 180;
        if (global.lvl == 3) frighttime = 120;
        if (global.lvl == 4) frighttime = 120;
        if (global.lvl == 5) frighttime = 120;
        if (global.lvl == 6) frighttime = 60;
        if (global.lvl == 7) frighttime = 60;
        if (global.lvl == 8) frighttime = 120;
        if (global.lvl == 9) frighttime = 60;
        if (global.lvl == 10) frighttime = 60;
        if (global.lvl == 11) frighttime = 60;
        if (global.lvl == 12) frighttime = 60;
        if (global.lvl == 13) frighttime = 60;
        if (global.lvl == 14) frighttime = 0;
        if (global.lvl == 15) frighttime = 60;
        if (global.lvl > 15) frighttime = 0;
    }
}

/// PLUS MODE FRIGHT TIMINGS
if (global.plus == PAC_PLUS_MODE.ACTIVE) {
    if (global.game < 2) {
        frighttime = 240;
        bonustime = 360;

        if (global.lvl == 2) { frighttime = 180; bonustime = 360; }
        if (global.lvl == 3) { frighttime = 120; bonustime = 300; }
        if (global.lvl == 4) { frighttime = 120; bonustime = 240; }
        if (global.lvl == 5) { frighttime = 120; bonustime = 180; }
        if (global.lvl == 6) { frighttime = 240; bonustime = 300; }
        if (global.lvl == 7) { frighttime = 120; bonustime = 180; }
        if (global.lvl == 8) { frighttime = 60; bonustime = 180; }
        if (global.lvl == 9) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 10) { frighttime = 120; bonustime = 240; }
        if (global.lvl == 11) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 12) { frighttime = 0; bonustime = 120; }
        if (global.lvl == 13) { frighttime = 0; bonustime = 120; }
        if (global.lvl == 14) { frighttime = 120; bonustime = 240; }
        if (global.lvl == 15) { frighttime = 0; bonustime = 120; }
        if (global.lvl == 16) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 17) { frighttime = 0; bonustime = 120; }
        if (global.lvl == 18) { frighttime = 120; bonustime = 120; }
        if (global.lvl == 19) { frighttime = 0; bonustime = 60; }
        if (global.lvl > 19) { frighttime = 0; bonustime = 0; }
    } else {
        /// Jr. Pac-Man Plus
        frighttime = 240;
        bonustime = 360;

        if (global.lvl == 2) { frighttime = 120; bonustime = 240; }
        if (global.lvl == 3) { frighttime = 120; bonustime = 180; }
        if (global.lvl == 4) { frighttime = 120; bonustime = 180; }
        if (global.lvl == 5) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 6) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 7) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 8) { frighttime = 0; bonustime = 60; }
        if (global.lvl == 9) { frighttime = 0; bonustime = 60; }
        if (global.lvl == 10) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 11) { frighttime = 60; bonustime = 60; }
        if (global.lvl == 12) { frighttime = 0; bonustime = 60; }
        if (global.lvl > 12) { frighttime = 0; bonustime = 0; }
    }
}

/// ===============================================================================
/// SECTION 4: GAME STATE INITIALIZATION
/// ===============================================================================
dot = 0;
chompcount = 0;
pluseat = 0;
start = 1;
finish = 0;
siren = 0;
ambience = 0;
plus = -1;
plus2 = 0;
countdown = 10;
blink = 0;

/// ===============================================================================
/// SECTION 5: GHOST RELEASE & MOVEMENT INITIALIZATION
/// ===============================================================================
/// Ghost release signatures
psig = 244;
isig = 244;
csig = 244;

/// Direction change timer
timerstart = 240;
timer = timerstart;

/// Scatter/Chase mode cycle tracking
cycle = 0;
scatter = 1;

/// ===============================================================================
/// SECTION 6: SCATTER/CHASE TIMING CONFIGURATION
/// ===============================================================================
if (global.game < 2) {
    /// STANDARD PAC-MAN & MS. PAC-MAN
    scatter1 = 7;
    chase1 = 20;
    scatter2 = 7;
    chase2 = 20;
    scatter3 = 5;
    chase3 = 20;
    scatter4 = 5;

    if (global.lvl > 1) {
        scatter1 = 7;
        chase1 = 20;
        scatter2 = 7;
        chase2 = 20;
        scatter3 = 5;
        chase3 = 1033;
        scatter4 = 1 / 60;
    }

    if (global.lvl > 4 || global.plus == PAC_PLUS_MODE.ACTIVE) {
        scatter1 = 5;
        chase1 = 20;
        scatter2 = 5;
        chase2 = 20;
        scatter3 = 5;
        chase3 = 1037;
        scatter4 = 1 / 60;
    }
} else {
    /// JR. PAC-MAN
    scatter1 = 7;
    chase1 = 20;
    scatter2 = 7;
    chase2 = 20;
    scatter3 = 5;
    chase3 = 1033;
    scatter4 = 1 / 60;

    if (global.lvl > 2 || global.plus == PAC_PLUS_MODE.ACTIVE) {
        scatter1 = 5;
        chase1 = 20;
        scatter2 = 5;
        chase2 = 20;
        scatter3 = 5;
        chase3 = 1037;
        scatter4 = 1 / 60;
    }
}
