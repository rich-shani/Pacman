/// ===============================================================================
/// BLINKY GHOST OBJECT - CREATE EVENT
/// ===============================================================================
/// Description: Initializes Blinky (Red Shadow Ghost)
///
/// PERSONALITY: Aggressive direct pursuer
/// - Always chases Pac's current position in chase mode
/// - Scatter corner: Top-left area (32, 32)
/// - Elroy mode: Speeds up when dots are running low
///
/// CORE FEATURES:
/// - State machine: Chase → Scatter → Frightened → Eyes
/// - Grid-based pathfinding with 16-pixel tile tracking
/// - Speed adjustments based on game state (normal, elroy, frightened)
/// - Power pellet vulnerability with animation effects
/// - Tunnel wrapping mechanics
/// ===============================================================================

// ===== ANIMATION & VISUAL VARIABLES =====
im = 0;                    // Animation frame counter (increments 0-15 then resets)
flash = 0;                 // Flash state: 0=solid, 1=transparent (used when frightened)

// ===== POSITION TRACKING =====
tilex = 0;                 // Current tile X position (16-pixel aligned grid)
tiley = 0;                 // Current tile Y position (16-pixel aligned grid)
xstart = 216;              // Respawn position X (ghost house)
ystart = 224;              // Respawn position Y (ghost house)

// ===== PATHFINDING & BEHAVIOR VARIABLES =====
pursuex = 0;               // Target X for chase mode (Pac's position or corner)
pursuey = 0;               // Target Y for chase mode (Pac's position or corner)
house = 0;                 // House state: 0=released (free), 1=in ghost house
newtile = 0;               // New tile flag: 1 when ghost reaches new tile (triggers pathfinding)
aboutface = 0;             // Reversal flag: 1 forces ghost to reverse direction next turn

// ===== BEHAVIOR STATE VARIABLES =====
state = 0;                 // Ghost state: 0=chase/scatter, 1=frightened, 2=eyes returning home
elroydots = 244;           // Dot threshold for Elroy mode (faster chase when dots ≤ this)
elroydots2 = 234;          // Dot threshold for Elroy mode 2 (even faster)
cornerx = 32;              // Scatter mode target X (top-left corner)
cornery = 32;              // Scatter mode target Y (top-left corner)

// ===== DIRECTION VARIABLES =====
direction = 0;             // Direction in degrees: 0=right, 90=up, 180=left, 270=down
dir = 0;                   // Cardinal direction: 0=right, 1=up, 2=left, 3=down (for pathfinding)
fruity = 0;                // Fruit-related direction (used in special fruit chase modes)
codir = 0;                 // Co-direction: secondary direction used in pathfinding calculations
