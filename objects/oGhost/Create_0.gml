/// ===============================================================================
/// oGHOST - BASE GHOST OBJECT - CREATE EVENT
/// ===============================================================================
/// Purpose: Initialize all shared ghost variables and state
/// Parent: N/A (Base class)
/// Children: Blinky, Pinky, Inky, Clyde
///
/// This object contains ALL shared initialization logic that every ghost needs.
/// Child ghosts override only their unique properties:
/// - Ghost name and personality
/// - Starting position (xstart, ystart)
/// - Scatter corner (cornerx, cornery)
/// - Speed thresholds (elroydots, elroydots2)
///
/// Key Design Principle: event_inherited() is NOT called here because this IS
/// the base initialization. Child ghosts call event_inherited() to use this code.
/// ===============================================================================

// ===== IDENTIFICATION =====
/// Ghost name: "Blinky", "Pinky", "Inky", or "Clyde" (set by child object)
ghost_name = "";

// ===== ANIMATION VARIABLES =====
/// Animation frame index (0-15, cycles through sprite frames)
/// Incremented each frame: im = (im + 1) % 16
im = 0;

/// Flash state counter for frightened mode (flashing effect)
/// When state == FRIGHTENED and flash > 15, ghost becomes white
flash = 0;

/// Elroy mode counter (0=off, 1=mode1 faster, 2=mode2 fastest)
/// Used to display visual effect (red eyes)
elroy = 0;

// ===== POSITION TRACKING (16-pixel grid aligned) =====
/// Current tile X coordinate (grid position, not pixel position)
/// Updated each frame: tilex = 16 * round(x / 16)
tilex = 0;

/// Current tile Y coordinate (grid position, not pixel position)
/// Updated each frame: tiley = 16 * round(y / 16)
tiley = 0;

/// Starting X position (pixel coordinate)
/// Set by child object, used for respawning
xstart = 0;

/// Starting Y position (pixel coordinate)
/// Set by child object, used for respawning
ystart = 0;

// ===== PATHFINDING & BEHAVIOR =====
/// Target pursuit X coordinate (where ghost is chasing)
/// Calculated in Step_1 based on ghost personality
pursuex = 0;

/// Target pursuit Y coordinate
/// Calculated in Step_1 based on ghost personality
pursuey = 0;

/// House state: 0 = released, 1 = in ghost house
/// Determines if ghost is contained or free to roam
house = 0;

/// House state machine (varies by ghost type)
/// Blinky: 0=bouncing, 1=exiting
/// Pinky: 0=waiting, 1=dot-counting, 2=bouncing, 3=exiting
/// Inky: 0-4 complex exit sequence
/// Clyde: 0-4 complex exit sequence
housestate = 0;

/// New tile flag: 1 when ghost reaches a new grid tile
/// Used to trigger pathfinding update (turning decision)
newtile = 0;

/// About-face flag: 1 when ghost should reverse direction
/// Used in power pellet mode to make ghosts reverse
aboutface = 0;

// ===== AI STATE MACHINE =====
/// Current ghost behavioral state (uses GHOST_STATE enum)
/// - GHOST_STATE.CHASE = 0: Normal pursuit mode
/// - GHOST_STATE.FRIGHTENED = 1: Power pellet active, vulnerable
/// - GHOST_STATE.EYES = 2: Ghost eaten, eyes returning to house
/// - GHOST_STATE.IN_HOUSE = 3: Inside ghost house, bouncing
/// - GHOST_STATE.HOUSE_READY = 4: Waiting to exit house
state = GHOST_STATE.CHASE;

// ===== ELROY MODE (Faster pursuit when dots are low) =====
/// Dot count threshold for Elroy mode 1 (first speed increase)
/// When Pac.dotcount <= this value, ghost becomes faster
/// Set by child object (Blinky uses 244)
elroydots = 244;

/// Dot count threshold for Elroy mode 2 (maximum speed)
/// When Pac.dotcount <= this value, ghost is at maximum speed
/// Set by child object
elroydots2 = 0;

// ===== SCATTER MODE =====
/// Scatter corner X coordinate (where ghost runs when not chasing)
/// Set by child object (varies by personality)
cornerx = 0;

/// Scatter corner Y coordinate
/// Set by child object (varies by personality)
cornery = 0;

// ===== DIRECTION TRACKING =====
/// Current direction in degrees (0=right, 90=up, 180=left, 270=down)
/// Used by physics system for movement
direction = 0;

/// Cardinal direction: 0=right, 1=up, 2=left, 3=down
/// Used by pathfinding and turning logic
dir = GHOST_DIRECTION.RIGHT;

/// Reverse direction (opposite of current direction)
/// Used when power pellet makes ghosts reverse
resdir = GHOST_DIRECTION.LEFT;

/// Fruit-related direction tracking
/// Used in special game modes
fruity = 0;

/// Co-direction for pathfinding (secondary direction choice)
/// Used when multiple paths are equally short
codir = 0;

// ===== SPEED VARIABLES =====
/// Normal speed (varies by level and game mode)
sp = 1.875;

/// Slow area speed (tunnels and special zones)
spslow = 1.0;

/// Frightened mode speed (slower when power pellet active)
spfright = 1.25;

/// Elroy mode 1 speed (faster pursuit)
spelroy = 2.0;

/// Elroy mode 2 speed (maximum speed)
spelroy2 = 2.125;

/// Eyes speed (very fast when returning to house)
speyes = 4.0;

// ===== DRAW/RENDER VARIABLES =====
/// Current draw color (primary ghost color)
draw_color = c_white;

// ===== SPRITE VARIABLES =====
/// Image index (sprite animation frame)
image_index = 0;

/// Image speed (animation speed)
image_speed = 0;

// ===== PHYSICS =====
/// Horizontal speed (pixels per frame)
hspeed = 0;

/// Vertical speed (pixels per frame)
vspeed = 0;

// ===== DEBUG/OPTIONAL =====
/// Elroy visual indicator (for debugging)
elroy_display = 0;

// ===== CHILD OBJECT OVERRIDE POINT =====
/// Child objects should set these before calling event_inherited():
///
/// In child Create_0.gml (before event_inherited()):
///   ghost_name = "Blinky";
///   xstart = 216;
///   ystart = 224;
///   cornerx = 32;
///   cornery = 32;
///   elroydots = 244;
///   event_inherited();
///
/// This ensures child-specific values are set before base initialization completes.

/// ===============================================================================
/// END oGHOST CREATE EVENT
/// ===============================================================================
