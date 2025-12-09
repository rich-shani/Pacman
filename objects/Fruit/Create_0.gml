/// ===============================================================================
/// FRUIT OBJECT - CREATE EVENT (INITIALIZATION)
/// ===============================================================================
/// Purpose: Initialize fruit object variables and set sprite based on level
/// Called: When fruit object is created
///
/// Responsibilities:
/// 1. Initialize position, state, and animation variables
/// 2. Set fruit sprite/image_index based on current level and game variant
/// 3. Handle special game modes (doki mode, plus mode)
/// 4. Configure fruit appearance for different game variants
/// ===============================================================================

// ===== POSITION AND STATE VARIABLES =====
/// C64 mode flag (for Commodore 64 variant)
c64 = 0;

/// Extended room flag (currently disabled)
/// Uncomment to enable for Extended rooms 1-7
// if (room == Extended1 || room == Extended2 || room == Extended3 || 
//     room == Extended4 || room == Extended5 || room == Extended6 || 
//     room == Extended7) {
//     extend = 1;
// }
extend = 0;

/// Spawn state: 0=not spawned, 1=first spawn, 2=second spawn, etc.
spawn = 0;

/// Points display flag: 0=hidden, 1=showing points
points = 0;

/// Initial position (off-screen)
x = -32;
y = -32;

/// Movement direction (0=right, 1=up, 2=left, 3=down)
dir = 0;

/// Exit option (for Ms. Pacman fruit movement)
exopt = -1;

/// Movement state: -1=inactive, 0=spawning, 1=moving
state = -1;

/// New tile flag (for pathfinding)
newtile = 0;

/// Tile-aligned coordinates (grid position)
tilex = 16 * (round(x / 16));
tiley = 16 * (round(y / 16));

/// Result direction (for pathfinding)
resdir = -1;

/// Bounce direction: 1=up, 0=down
up = 1;

/// Bounce offset (for vertical animation)
bounce = 0;

/// Target coordinates for chasing (Ms. Pacman mode)
chasex = 0;
chasey = 0;

/// Explosion animation flag
explosion = 0;

/// Animation frame counter
im = 0;

/// Explosion position
expx = 0;
expy = 0;

/// Sprite animation speed (0 = manual control)
image_speed = 0;

// ===== COLOR VARIABLES =====
/// Color hue, saturation, value (calculated in Draw event)
dh = 0;
ds = 0;
dv = 0;

/// Secondary color values (for shadow effects)
mh2 = 0;
ms2 = 0;
mv2 = 0;

// ===== VISUAL EFFECTS =====
/// Sprite scale factor (1.0 = normal size)
/// Change to 1.5 for larger fruit
scale = 1;

/// Scale animation flag: 1=scaling up, 0=scaling down
/// Change to 0 to disable scaling animation
scaleup = 1;

// ===== MOVEMENT CONTROL =====
/// Prevent turning flag
noturn = 0;

/// Prevent movement flag
nomove = 0;

/// Fruit active flag
fruity = 1;

// ===== SPRITE SELECTION BASED ON LEVEL =====
/// Set fruit sprite and point value based on current level and game variant
/// Different games have different fruit progression schedules

// ===== DOKI MODE (Special variant) =====
if (global.doki == 1) {
    // ===== STANDARD PACMAN (game = 0) =====
    if (global.game == 0) {
        if (global.lvl == 0) { image_index = 0; value = 0; }
        if (global.lvl == 1) { image_index = 0; value = 0; }
        if (global.lvl == 2) { image_index = 1; value = 1; }
        if (global.lvl == 3) { image_index = 2; value = 2; }
        if (global.lvl == 4) { image_index = 2; value = 2; }
        if (global.lvl == 5) { image_index = 3; value = 3; }
        if (global.lvl == 6) { image_index = 3; value = 3; }
        if (global.lvl == 7) { image_index = 4; value = 4; }
        if (global.lvl == 8) { image_index = 4; value = 4; }
        if (global.lvl == 9) { image_index = 5; value = 5; }
        if (global.lvl == 10) { image_index = 5; value = 5; }
        if (global.lvl == 11) { image_index = 6; value = 6; }
        if (global.lvl == 12) { image_index = 6; value = 6; }
        if (global.lvl > 12) { image_index = 7; value = 7; }
    }
    
    // ===== MS. PACMAN (game = 1) =====
    if (global.game == 1) {
        if (global.lvl == 0) { image_index = 0; value = 0; }
        if (global.lvl == 1) { image_index = 0; value = 0; }
        if (global.lvl == 2) { image_index = 1; value = 1; }
        if (global.lvl == 3) { image_index = 2; value = 2; }
        if (global.lvl == 4) { image_index = 3; value = 3; }
        if (global.lvl == 5) { image_index = 4; value = 4; }
        if (global.lvl == 6) { image_index = 5; value = 5; }
        if (global.lvl == 7) { image_index = 6; value = 6; }
    }
    
    // ===== JR. PACMAN (game = 2) =====
    if (global.game == 2) {
        if (global.lvl == 0) { image_index = 0; value = 0; }
        if (global.lvl == 1) { image_index = 0; value = 0; }
        if (global.lvl == 2) { image_index = 1; value = 1; }
        if (global.lvl == 3) { image_index = 2; value = 2; }
        if (global.lvl == 4) { image_index = 3; value = 3; }
        if (global.lvl == 5) { image_index = 4; value = 4; }
        if (global.lvl == 6) { image_index = 5; value = 5; }
        if (global.lvl > 6) { image_index = 6; value = 6; }
    }
}
// ===== STANDARD MODE =====
else {
    // ===== NORMAL MODE (plus = 0) =====
    if (global.plus == 0) {
        // ===== STANDARD PACMAN (game = 0) =====
        if (global.game == 0) {
            if (global.lvl == 0) { image_index = 0; value = 0; }
            if (global.lvl == 1) { image_index = 0; value = 0; }
            if (global.lvl == 2) { image_index = 1; value = 1; }
            if (global.lvl == 3) { image_index = 2; value = 2; }
            if (global.lvl == 4) { image_index = 2; value = 2; }
            if (global.lvl == 5) { image_index = 3; value = 3; }
            if (global.lvl == 6) { image_index = 3; value = 3; }
            if (global.lvl == 7) { image_index = 4; value = 4; }
            if (global.lvl == 8) { image_index = 4; value = 4; }
            if (global.lvl == 9) { image_index = 5; value = 5; }
            if (global.lvl == 10) { image_index = 5; value = 5; }
            if (global.lvl == 11) { image_index = 6; value = 6; }
            if (global.lvl == 12) { image_index = 6; value = 6; }
            if (global.lvl > 12) { image_index = 7; value = 7; }
        }
        
        // ===== MS. PACMAN (game = 1) =====
        if (global.game == 1) {
            if (global.lvl == 0) { image_index = 0; value = 0; }
            if (global.lvl == 1) { image_index = 0; value = 0; }
            if (global.lvl == 2) { image_index = 1; value = 1; }
            if (global.lvl == 3) { image_index = 2; value = 2; }
            if (global.lvl == 4) { image_index = 8; value = 3; }
            if (global.lvl == 5) { image_index = 3; value = 4; }
            if (global.lvl == 6) { image_index = 9; value = 5; }
            if (global.lvl == 7) { image_index = 10; value = 6; }
        }
        
        // ===== JR. PACMAN (game = 2) =====
        if (global.game == 2) {
            if (global.lvl == 0) { image_index = 17; value = 0; }
            if (global.lvl == 1) { image_index = 17; value = 0; }
            if (global.lvl == 2) { image_index = 18; value = 1; }
            if (global.lvl == 3) { image_index = 19; value = 2; }
            if (global.lvl == 4) { image_index = 20; value = 3; }
            if (global.lvl == 5) { image_index = 21; value = 4; }
            if (global.lvl == 6) { image_index = 22; value = 5; }
            if (global.lvl > 6) { image_index = 23; value = 6; }
        }
    }
    // ===== PLUS MODE (plus > 0) =====
    else {
        // ===== STANDARD PACMAN PLUS (game = 0) =====
        if (global.game == 0) {
            if (global.lvl == 0) { image_index = 11; value = 0; }
            if (global.lvl == 1) { image_index = 11; value = 0; }
            if (global.lvl == 2) { image_index = 12; value = 1; }
            if (global.lvl == 3) { image_index = 13; value = 2; }
            if (global.lvl == 4) { image_index = 13; value = 2; }
            if (global.lvl == 5) { image_index = 3; value = 3; }
            if (global.lvl == 6) { image_index = 3; value = 3; }
            if (global.lvl == 7) { image_index = 14; value = 4; }
            if (global.lvl == 8) { image_index = 14; value = 4; }
            if (global.lvl == 9) { image_index = 5; value = 5; }
            if (global.lvl == 10) { image_index = 5; value = 5; }
            if (global.lvl == 11) { image_index = 15; value = 6; }
            if (global.lvl == 12) { image_index = 15; value = 6; }
            if (global.lvl > 12) { image_index = 16; value = 7; }
        }
        
        // ===== MS. PACMAN PLUS (game = 1) =====
        if (global.game == 1) {
            if (global.lvl == 0) { image_index = 24; value = 0; }
            if (global.lvl == 1) { image_index = 24; value = 0; }
            if (global.lvl == 2) { image_index = 25; value = 1; }
            if (global.lvl == 3) { image_index = 26; value = 2; }
            if (global.lvl == 4) { image_index = 27; value = 3; }
            if (global.lvl == 5) { image_index = 28; value = 4; }
            if (global.lvl == 6) { image_index = 29; value = 5; }
            if (global.lvl == 7) { image_index = 30; value = 6; }
        }
        
        // ===== JR. PACMAN PLUS (game = 2) =====
        if (global.game == 2) {
            if (global.lvl == 0) { image_index = 31; value = 0; }
            if (global.lvl == 1) { image_index = 31; value = 0; }
            if (global.lvl == 2) { image_index = 32; value = 1; }
            if (global.lvl == 3) { image_index = 33; value = 2; }
            if (global.lvl == 4) { image_index = 34; value = 3; }
            if (global.lvl == 5) { image_index = 35; value = 4; }
            if (global.lvl == 6) { image_index = 36; value = 5; }
            if (global.lvl > 6) { image_index = 37; value = 6; }
        }
    }
}
