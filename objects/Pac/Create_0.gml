/// ===============================================================================
/// PAC-MAN OBJECT - CREATE EVENT
/// ===============================================================================
/// Description: Initializes all variables for Pac-Man character (Player 1)
///
/// Features:
/// - Two-player support (Pac + Mac for Player 2)
/// - Movement with corner mechanics for smooth turns
/// - Power pellet (fright) mode with ghost eating
/// - Dot and fruit collection
/// - Death/life system
/// - Animation and collision handling
/// ===============================================================================

// ===== MOVEMENT VARIABLES =====
/// Player 1 movement direction (cardinal: 0=right, 1=up, 2=left, 3=down)
xdir = 0;
ydir = 0;
dir = 0;

/// Player 2 movement direction (mirror of Player 1 in 2P mode)
xdir2 = 0;
ydir2 = 0;
dir2 = 0;
x2 = x;  // Player 2 X position
y2 = y;  // Player 2 Y position

/// Movement speeds (pixels per frame)
hspeed2 = 0;  // Player 2 horizontal speed
vspeed2 = 0;  // Player 2 vertical speed
sp = 2;       // Normal movement speed
spfright = 3; // Speed while in fright (power pellet) mode

// ===== POWER PELLET (FRIGHT) VARIABLES =====
/// Fright mode: 0=normal, 1=eating ghosts
fright = 0;
/// Duration of fright mode (in frames)
frighttime = 0;
/// Direction Pac was eating in (used for animations)
eatdir2 = -1;

// ===== CHOMPING (GHOST EATING) VARIABLES =====
/// Currently in midst of eating ghost: 0=no, 1=yes
chomp = 0;
/// Count of consecutive ghosts eaten this fright period
chompcount = 0;
/// Bonus points from fruit eaten during fright
pluseat = 0;
/// Bonus time/duration for powered-up state
bonustime = 0;

// ===== PAUSE/STOP VARIABLES =====
/// Player 1 pause state
pause = 0;
/// Player 2 pause state
pause2 = 0;
/// Stopped (used during dot/fruit collection)
stoppy = 0;
stoppy2 = 0;

// ===== CORNER/TURN VARIABLES =====
/// Corner state for smooth turning (1-8 represent 8 possible corner turns)
corner = 0;
corner2 = 0;
/// Check counter for corner transition
corner2check = 0;

// ===== DEATH/GAME STATE VARIABLES =====
/// Death state: 0=alive, 1=dying, 2=dead, 3=lost life
dead = 0;
deader = 0;
/// Level start delay: 0=playing, 1=starting (ghosts/Pac frozen)
start = 0;
/// Level finish: 0=playing, 1=finished (all dots collected)
finish = 0;

// ===== DOT COLLECTION VARIABLES =====
/// Dot sound index (alternates between Dot0 and Dot1)
dot = 0;
/// Total dots collected this level
dotcount = 0;
/// Countdown timer
countdown = 0;

// ===== COLLISION VARIABLES =====
/// Bonked with Player 2 (collision): 0=no, 1=yes
bonked = 0;
bonked2 = 0;

// ===== PARKING/DIRECTION VARIABLES =====
/// Park direction (used for input buffering): 0=right, 1=up, 2=left, 3=down, -1=none
park = 0;
park2 = 0;
/// Current facing direction (in degrees)
direction = 0;
direction2 = 0;

// ===== VISUAL/ANIMATION VARIABLES =====
/// Blink state during intermission scenes
blink = 0;
/// Animation frame index (Pac mouth open/close)
im2 = 0;
/// Animation indices for different animation states
i2m = 0;
i2m2 = 0;
/// Death animation frame
deadani2m = 0;
/// Scale for sprite sizing
scale = 1;

// ===== GAME MODE VARIABLES =====
/// Plus mode (bonus points multiplier): 0=normal, -1=eating, etc.
plus = 0;
plus2 = 0;
/// Prohibition flags (ghost interaction control)
prohibit = 0;
/// Scatter mode flag
scatter = 0;
/// Cycle counter
cycle = 0;

// ===== TILE TRACKING VARIABLES =====
/// Tile-aligned X/Y coordinates for collision and ghost interaction
tilex = 0;
tiley = 0;
tilex2 = 0;
tiley2 = 0;
/// Ghost signature variables (used for ghost state tracking)
csig = 0;
psig = 0;
isig = 0;
/// Ambience sound index (tracks which background sound is playing)
ambience = 0;

/// ===== INITIALIZE SUPPORTING OBJECTS =====
/// These objects are created at Pac's position to handle UI, input, and Player 2

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
