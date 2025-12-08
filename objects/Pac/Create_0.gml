/// ===============================================================================
/// PAC-MAN OBJECT - CREATE EVENT (INITIALIZATION)
/// ===============================================================================
/// Purpose: Initialize all variables for Pac-Man character (Player 1 - main player)
/// This is the foundation for Player 1 gameplay mechanics
///
/// Features:
/// - Two-player support (Pac + Mac for Player 2)
/// - Movement with corner mechanics for smooth turns
/// - Power pellet (fright) mode with ghost eating
/// - Dot and fruit collection
/// - Death/life system
/// - Animation and collision handling
/// - Dynamic difficulty (Elroy thresholds)
/// - Siren audio management
///
/// Variables are organized into logical sections with clear purposes
/// ===============================================================================

// ===== MOVEMENT DIRECTION VARIABLES (PLAYER 1) =====
/// Target direction input variables (0=right, 1=up, 2=left, 3=down)
/// Used to detect keyboard input and set desired direction
xdir = 0;   // Horizontal direction component
ydir = 0;   // Vertical direction component
dir = 0;    // Cardinal direction (0-3, used for pathfinding)

xdir2 = 0;
ydir2 = 0;
dir2 = 0;

/// Movement speeds for Player 1
/// Used to apply actual velocity each frame
/// Note: oGameManager.sp and spfright are managed by oGameManager
hspeed2 = 0;   // Unused in current setup
vspeed2 = 0;   // Unused in current setup

// ===== EATING ANIMATION VARIABLES =====
/// Direction Pac was eating in (used for eating animation)
/// Converted from direction angle to 8-way direction
/// -1 = not eating, 0-7 = eating in that direction
eatdir2 = -1;

// ===== CHOMPING (GHOST EATING) VARIABLES =====
/// Current ghost eating state (0=not eating, 1=eating)
/// Set when Pac collides with frightened ghost
/// Triggers eating animation and freezes ghost movement
chomp = 0;

// ===== MOVEMENT PAUSE/SUSPENSION VARIABLES =====
/// Player 1 movement pause counter
/// Counts down each frame during pause states
/// 0 = not paused, >0 = paused (moving/eating blocked)
pause = 0;

/// Player 2 movement pause counter (similar to pause)
pause2 = 0;

/// Player 1 suspension state during dot/fruit collection
/// Set when eating dot/fruit to freeze movement briefly
/// Creates brief pause effect before continuing movement
stoppy = 0;

/// Player 2 suspension state during dot/fruit collection
stoppy2 = 0;

// ===== CORNER/TURN TRANSITION VARIABLES =====
/// Player 1 corner transition state (using PAC_CORNER enum)
/// NONE (0): Not in corner transition
/// Values 1-8: Smooth turn in progress (pre/post alignment states)
/// Used to smoothly turn Pac when input occurs mid-movement
corner = PAC_CORNER.NONE;

/// Player 2 corner transition state (mirrors corner)
corner2 = PAC_CORNER.NONE;

/// Frame counter for corner transition validation
/// Prevents corner completion until sufficient frames have passed
corner2check = 0;

// ===== DEATH/GAME STATE VARIABLES =====
/// Current Pac state (using PAC_STATE enum)
/// ALIVE (0): Playing normally
/// DYING (1): Death animation in progress
/// DEAD (2): Waiting to respawn or end level
/// DEAD_FINAL (3): Final life lost, game over state
dead = PAC_STATE.ALIVE;

/// Flag indicating Pac is actively dying (death animation)
/// Set when collision with ghost detected
/// Used to trigger death sequence and sound effects
deader = 0;

// ===== COLLISION VARIABLES =====
/// Bonked with Player 2 (collision): 0=no, 1=yes
bonked = 0;
bonked2 = 0;

// ===== BUFFERED DIRECTION VARIABLES =====
/// Buffered direction input for Player 1 (cardinal format)
/// Stores direction when player presses arrow key between intersections
/// Applied when Pac reaches next intersection for smooth turning
/// Range: 0-3 (using PAC_DIRECTION enum), -1 = no input buffered
park = 0;

/// Buffered direction input for Player 2 (mirrors park)
park2 = 0;

/// Current facing direction in degrees for Player 1
/// Range: 0, 90, 180, 270 (representing 4 cardinal directions)
/// Updated each frame based on movement velocity
/// Used for sprite rotation and animation direction
direction = 0;

/// Current facing direction for Player 2 (mirrors direction)
direction2 = 0;

// ===== VISUAL/ANIMATION VARIABLES =====
/// Blink animation counter during level intermission
/// Creates pulsing visual effect between levels
/// Increments each frame and resets at threshold
blink = 0;

/// Animation frame index for Pac sprite (0-7 for mouth animation)
/// Cycles through sprite frames to show opening/closing mouth
/// Makes Pac appear to be "eating" as he moves
im2 = 0;

/// Backup animation index (used in specific animation sequences)
i2m = 0;

/// Secondary animation index (used for alternating animations)
i2m2 = 0;

/// Death animation frame counter
/// Animates Pac dissolving when eaten by ghost
/// Ranges from 0 to completion (typically 11-12 frames)
deadani2m = 0;

/// Sprite scaling factor for visual effects
/// 1.0 = normal size, can increase/decrease for zoom effects
/// Used sparingly for visual polish
scale = 1;

// Note: Game mode variables (plus, plus2, prohibit, scatter, cycle)
// are now managed by oGameManager

// ===== TILE TRACKING VARIABLES =====
/// Tile-aligned X coordinate for Player 1 (grid position, not pixel)
/// Snapped to 16-pixel grid for collision and pathfinding
/// Updated based on actual pixel position each frame
tilex = 0;

/// Tile-aligned Y coordinate for Player 1
/// Used with tilex for grid-based collision detection
tiley = 0;

/// Tile-aligned X coordinate for Player 2
tilex2 = 0;

/// Tile-aligned Y coordinate for Player 2
tiley2 = 0;

// Note: Ghost signatures (psig, isig, csig), audio/ambience (siren, ambience),
// and timer/timing variables are now managed by oGameManager

/// ===== INITIALIZE SUPPORTING OBJECTS =====
/// These objects are created at Pac's position to handle UI, input, and Player 2

/// Game Manager: Handles overall game state management
/// Only create if it doesn't already exist (prevents duplicates)
if (!instance_exists(oGameManager)) {
    action_set_relative(0);
    action_create_object(oGameManager, 0, 0);
}

/// Scroller: Handles viewport/camera movement
action_set_relative(0);
action_create_object(Scroller, 0, 0);

/// Drawless: Invisible object that handles HUD drawing and debug overlay
{
action_set_relative(1);
action_create_object(Drawless, 0, 0);
action_set_relative(0);
}

/// Mac: Player 2 sprite (mirrors Player 1 movement in 2-player mode)
{
action_set_relative(1);
action_create_object(Mac, 0, 0);
action_set_relative(0);
}

action_set_relative(0);
