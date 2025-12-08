/// ===============================================================================
/// pac_enums.gml
/// ===============================================================================
/// Purpose: Define all enums used in Pac-Man object for self-documenting code
/// This replaces magic numbers with named constants throughout the game logic
/// ===============================================================================

/// ===============================================================================
/// PAC_STATE - Pac-Man lifecycle states
/// ===============================================================================
enum PAC_STATE {
	ALIVE = 0,              /// Normal gameplay state
	DYING = 1,              /// In death animation sequence
	DEAD = 2,               /// Dead, life deducted, awaiting respawn
	DEAD_FINAL = 3          /// Game over state (no lives remaining)
}

/// ===============================================================================
/// PAC_FRIGHT - Fright mode activation states
/// ===============================================================================
enum PAC_FRIGHT {
	OFF = 0,                /// Normal mode - ghosts chase Pac
	ACTIVE = 1              /// Fright mode - ghosts are frightened
}

/// ===============================================================================
/// PAC_DIRECTION - Directional input (4-way movement)
/// ===============================================================================
enum PAC_DIRECTION {
	RIGHT = 0,              /// Moving right (positive X)
	UP = 1,                 /// Moving up (negative Y)
	LEFT = 2,               /// Moving left (negative X)
	DOWN = 3                /// Moving down (positive Y)
}

/// ===============================================================================
/// PAC_PLUS_MODE - Game variant modes (Pac-Man Plus variant)
/// ===============================================================================
enum PAC_PLUS_MODE {
	INACTIVE = 0,           /// Standard Pac-Man gameplay
	ACTIVE = 1              /// Pac-Man Plus variant with modified mechanics
}

/// ===============================================================================
/// GHOST_STATE - Ghost AI behavioral states
/// ===============================================================================
enum GHOST_STATE {
	CHASE = 0,              /// Actively pursuing Pac-Man
	FRIGHTENED = 1,         /// Running away from Pac-Man (fright mode)
	EYES = 2,               /// Eyes-only state returning to ghost house
	SCATTER = 3,            /// Moving to corner scatter positions
	HOUSE = 4               /// Inside ghost house
}

/// ===============================================================================
/// GHOST_PROHIBIT - Ghost movement restrictions per player
/// ===============================================================================
enum GHOST_PROHIBIT {
	ALLOWED = 0,            /// Ghost can move freely (not restricted)
	PLAYER1_BLOCKED = 1,    /// Ghost movement blocked for Player 1
	PLAYER2_BLOCKED = 2     /// Ghost movement blocked for Player 2
}
