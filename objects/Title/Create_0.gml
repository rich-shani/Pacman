/// ===============================================================================
/// TITLE OBJECT - CREATE EVENT
/// ===============================================================================
/// Description: Initializes the Title/Intro screen with character animations
///
/// Features:
/// - Character introduction sequences with animations
/// - Ghost and Pac sprite animation and positioning
/// - Scrolling and parallax effects
/// - Interactive title screen with bouncing elements
/// - Background animations and transitions
/// ===============================================================================

// ===== LINE TRACKING & ANIMATION =====
/// Current line being displayed (controls intro animation sequence)
line = 0;
/// Press flag for user interaction
press = 0;

// ===== HORIZONTAL MOVEMENT VARIABLES =====
/// Left-side sprite position (for character movement animations)
left = 496;
/// Right-side character position
right = 0;
/// Second right-side position (for parallel animation)
right2 = 0;

// ===== PAUSE LOGIC =====
/// Pause number tracking (for multi-step pause sequences)
pausenum = 0;
/// Pause counter (frames spent paused)
pause = 0;
/// Opacity value for fade effects
op = 0;

// ===== DISPLAY & VISIBILITY =====
/// Show flag: 0=hidden, 1=visible (controls overlay display)
show = 0;

// ===== SCALE ANIMATION =====
/// Scale up direction: 0=scaling down, 1=scaling up (for pulsing effects)
scaleup = 1;
/// Current scale value (1.00 = normal, used for sprite size animation)
scale = 1.00;

// ===== ANIMATION FRAME INDICES =====
/// General animation index (for sprite frame cycling)
im = 0;
/// Animation index 2 (for ghost sprites)
im2 = 0;
/// Animation index 3 (for secondary sprites)
im3 = 0;
/// Animation index 4 (for tertiary sprites)
im4 = 0;

// ===== VERTICAL MOVEMENT =====
/// Vertical position (Y coordinate tracking)
up = 312;

// ===== INTRO SEQUENCE CONTROL =====
/// Current intro state: 0=none, 1-4=character intros, 5+=ending
intro = 0;
/// Direction flag: true=moving left, false=moving right
lefty = true;
/// Current horizontal position in intro (for sprite positioning)
posit = 288;

// ===== PARALLAX & SCROLLING =====
/// Scroll offset for background parallax effect
scroll = 0;
/// Falling distance (for sprites that fall from top of screen)
falling = 0;

// ===== BOUNCE ANIMATION =====
/// Bounce height/position counter
bounce = 0;
/// Bounce direction: true=bouncing up, false=bouncing down
bounceup = true;

// ===== NEXT FLAG =====
/// Transition flag: false=current, true=advance to next scene
next = false;
