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
hspeed2 = 0;   // Unused in current setup
vspeed2 = 0;   // Unused in current setup
sp = 2;        // Normal movement speed (pixels/frame)
spfright = 3;  // Power pellet mode speed (faster than normal for escape)

// ===== POWER PELLET (FRIGHT) VARIABLES =====
/// Current fright mode state (using PAC_FRIGHT enum)
/// OFF (0): Normal mode, ghosts are dangerous
/// ACTIVE (1): Power pellet active, ghosts vulnerable
fright = PAC_FRIGHT.OFF;

/// Duration of current fright mode in frames
/// Set when power pellet collected, counts down to 0
/// When 0, fright mode ends and ghosts return to normal
frighttime = 0;

/// Direction Pac was eating in (used for eating animation)
/// Converted from direction angle to 8-way direction
/// -1 = not eating, 0-7 = eating in that direction
eatdir2 = -1;

// ===== CHOMPING (GHOST EATING) VARIABLES =====
/// Current ghost eating state (0=not eating, 1=eating)
/// Set when Pac collides with frightened ghost
/// Triggers eating animation and freezes ghost movement
chomp = 0;

/// Count of consecutive ghosts eaten in current fright period
/// Resets to 0 when fright mode ends
/// Used to determine eating score multiplier (200, 400, 800, 1600)
chompcount = 0;

/// Bonus multiplier active flag for ghost eating
/// When 1, all ghost eating scores are multiplied by CHOMP_BONUS_MULTIPLIER
/// Set during special bonus modes (certain fruits/power-ups)
pluseat = 0;

/// Bonus time duration in frames for extended fright mode
/// When bonus fruit eaten during fright, extends fright timer by this amount
bonustime = 0;

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

/// Level start freeze state
/// 0 = Game playing normally
/// 1 = Level just started, all actors frozen (intro delay)
/// After delay, start transitions to 0 and gameplay begins
start = 0;

/// Level completion flag
/// 0 = Level in progress (dots still available)
/// 1 = All dots collected, level finished
/// When finish = 1, level completion sequence triggers
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

// ===== GAME MODE & BONUS VARIABLES =====
/// Plus mode bonus multiplier state
/// Affects score multipliers and ghost behavior during fright
/// 0 = normal mode, values 1-7 = different bonus configuration
plus = 0;

/// Player 2 plus mode state (mirrors plus)
plus2 = 0;

/// Ghost interaction prohibition flag (using GHOST_PROHIBIT enum)
/// ALLOWED (0): Normal interaction
/// PLAYER1_BLOCKED (1): Pac cannot interact with ghosts
/// PLAYER2_BLOCKED (2): Mac cannot interact with ghosts
/// Used to control ghost/Pac interaction in special modes
prohibit = GHOST_PROHIBIT.ALLOWED;

/// Scatter mode active flag
/// 0 = Chase mode (ghosts hunt Pac)
/// 1 = Scatter mode (ghosts flee to corners)
/// Alternates during level based on timer
scatter = 0;

/// Game cycle counter
/// Tracks which phase of level cycle is active
/// Used with scatter/chase mode timing
cycle = 0;

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

// ===== GHOST SIGNATURE VARIABLES =====
/// Clyde ghost state signature (for house release logic)
/// Tracks when Clyde meets release conditions
csig = 0;

/// Pinky ghost state signature (for house release logic)
/// Tracks when Pinky meets release conditions
psig = 0;

/// Inky ghost state signature (for house release logic)
/// Tracks when Inky meets release conditions
isig = 0;

// ===== AUDIO/AMBIENCE VARIABLES =====
/// Current background music siren level (using SIREN_LEVEL enum)
/// LEVEL_0-4: Determines which siren sound plays
/// Changes as more dots are eaten (siren intensifies)
/// Also changes during fright mode (plays frightened music)
ambience = SIREN_LEVEL.LEVEL_0;

/// Siren progression tracker (0-4)
/// Separate variable tracking progression through siren levels
/// Based on dot count remaining
siren = 0;

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
