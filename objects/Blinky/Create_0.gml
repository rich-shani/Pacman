/// ===== BLINKY CREATE_0.GML =====
/// Blinky ghost initialization with oGhost inheritance
///
/// This event runs when Blinky instance is created at room start.
/// event_inherited() loads all shared ghost variables from oGhost.
/// Then we override with Blinky-specific settings only.

/// ===== PARENT INITIALIZATION (MUST BE FIRST!) =====
/// Load all shared ghost variables from oGhost parent
/// This includes: animation, position, pathfinding, state, direction, speeds
event_inherited();

/// ===== BLINKY IDENTITY =====
/// Set Blinky's name and color (unique identity)
ghost_name = "Blinky";                      // Ghost identifier string
ghost_color = ghost_color_blinky();         // Red color: RGB(255, 0, 0)

/// ===== STARTING POSITION & SPAWN LOCATION =====
/// Set where Blinky spawns (center of ghost house)
xstart = 216;                               // Spawn X coordinate (pixel)
ystart = 224;                               // Spawn Y coordinate (pixel)
x = xstart;                                 // Place instance at spawn X
y = ystart;                                 // Place instance at spawn Y

/// ===== SCATTER MODE TARGET =====
/// When in scatter mode (not chasing), Blinky targets the top-right corner
cornerx = 416;                               // Scatter target X coordinate
cornery = 32;                               // Scatter target Y coordinate

/// ===== INITIAL STATE & DIRECTION =====
/// Set Blinky's starting state and facing direction
state = GHOST_STATE.CHASE;                  // Start in chase/scatter mode
dir = GHOST_DIRECTION.LEFT;                 // Start facing left