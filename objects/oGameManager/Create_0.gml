/// ===============================================================================
/// GAME MANAGER - CREATE EVENT (INITIALIZATION)
/// ===============================================================================
/// Purpose: Initialize all game-wide state management variables
/// This object manages the overall game state, not specific to Pacman character
///
/// Features:
/// - Level progression and completion tracking
/// - Dot collection and scoring management
/// - Ghost AI cycle management (scatter/chase timing)
/// - Fright mode state management
/// - Audio/ambience control
/// - Game configuration (speed, timing, etc.)
///
/// Variables are organized into logical sections with clear purposes
/// ===============================================================================

// ===== LEVEL STATE VARIABLES =====
/// Level start freeze state
/// 0 = Game playing normally
/// 1 = Level just started, all actors frozen (intro delay)
start = 0;

/// Level completion flag
/// 0 = Level in progress (dots still available)
/// 1 = All dots collected, level finished
finish = 0;

/// Total dots collected this level
dotcount = 0;

/// Countdown timer (for death/respawn sequences)
countdown = 0;

// ===== GHOST AI CYCLE MANAGEMENT =====
/// Scatter mode active flag
/// 0 = Chase mode (ghosts hunt Pac)
/// 1 = Scatter mode (ghosts flee to corners)
scatter = 0;

/// Game cycle counter
/// Tracks which phase of level cycle is active
/// Used with scatter/chase mode timing
cycle = 0;

/// Scatter/Chase timing configuration (set per level in Other_4)
/// These define how long ghosts stay in each mode
scatter1 = 7;
chase1 = 20;
scatter2 = 7;
chase2 = 20;
scatter3 = 5;
chase3 = 20;
scatter4 = 5;

// ===== GHOST RELEASE TIMING =====
/// Ghost release timer (counts down from timerstart)
/// When reaches 0, next ghost exits house
timer = 0;

/// Timer start value (set per level)
timerstart = 240;

/// Ghost release signatures (dot count thresholds)
/// When dotcount reaches these values, ghosts are released
psig = 0;  /// Pinky release signature
isig = 0;  /// Inky release signature
csig = 0;  /// Clyde release signature

// ===== FRIGHT MODE (POWER PELLET) VARIABLES =====
/// Current fright mode state (using PAC_FRIGHT enum)
/// OFF (0): Normal mode, ghosts are dangerous
/// ACTIVE (1): Power pellet active, ghosts vulnerable
fright = PAC_FRIGHT.OFF;

/// Duration of fright mode in frames (set per level)
/// Set when power pellet collected, counts down to 0
frighttime = 0;

/// Bonus time duration for extended fright mode
/// When bonus fruit eaten during fright, extends fright timer
bonustime = 0;

/// Count of consecutive ghosts eaten in current fright period
/// Resets to 0 when fright mode ends
/// Used to determine eating score multiplier (200, 400, 800, 1600)
chompcount = 0;

/// Bonus multiplier active flag for ghost eating
/// When 1, all ghost eating scores are multiplied
pluseat = 0;

/// Ghost interaction prohibition flag (using GHOST_PROHIBIT enum)
/// ALLOWED (0): Normal interaction
/// PLAYER1_BLOCKED (1): Pac cannot interact with ghosts
/// PLAYER2_BLOCKED (2): Mac cannot interact with ghosts
prohibit = GHOST_PROHIBIT.ALLOWED;

// ===== AUDIO/AMBIENCE VARIABLES =====
/// Current background music siren level (using SIREN_LEVEL enum)
/// LEVEL_0-4: Determines which siren sound plays
/// Changes as more dots are eaten (siren intensifies)
ambience = SIREN_LEVEL.LEVEL_0;

/// Siren progression tracker (0-4)
/// Separate variable tracking progression through siren levels
/// Based on dot count remaining
siren = 0;

// ===== PLUS MODE VARIABLES =====
/// Plus mode bonus multiplier state
/// Affects score multipliers and ghost behavior during fright
/// 0 = normal mode, values 1-7 = different bonus configuration
plus = 0;

/// Player 2 plus mode state
plus2 = 0;

// ===== SPEED CONFIGURATION =====
/// Normal movement speed (pixels/frame)
/// Set per level in Other_4 event
sp = 2;

/// Power pellet mode speed (faster during fright)
/// Set per level in Other_4 event
spfright = 3;

// ===== DOT COLLECTION VARIABLES =====
/// Dot sound index (alternates between Dot0 and Dot1)
dot = 0;

/// Visual/animation variables
blink = 0;
           