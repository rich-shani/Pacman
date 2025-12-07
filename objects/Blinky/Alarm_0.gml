/// ===== BLINKY ALARM[0] EVENT - COLLISION/EATEN RESPONSE =====
/// Triggers when Blinky collides with Pac (Pac eats Blinky during power pellet mode)
/// This event handles:
/// - Reversing all ghost directions to avoid clustering
/// - Transitioning Blinky to "eyes returning home" state
/// - Updating Pac's movement to reflect the consumption and continue eating

/// ===== REVERSE ALL GHOSTS TO PREVENT CLUSTERING =====
/// When a ghost is eaten, all other ghosts reverse direction to avoid following
/// the eaten ghost's path and bunching up

with (Blinky) {
    if (house == 0 && state < 2) {
        direction = resdir * 90;
    }
    resdir = -1;
}

with (Pinky) {
    if (house == 0 && state < 2) {
        direction = resdir * 90;
    }
    resdir = -1;
}

with (Inky) {
    if (house == 0 && state < 2) {
        direction = resdir * 90;
    }
    resdir = -1;
}

with (Clyde) {
    if (house == 0 && state < 2) {
        direction = resdir * 90;
    }
    resdir = -1;
}

with (Fruit) {
    if (state > -1) {
        direction = resdir * 90;
    }
    resdir = -1;
}

/// ===== BLINKY STATE CHANGES =====
// Stop Pac's normal movement (he's eating a ghost)
Pac.chomp = 0;
// Blinky enters "eyes mode" (state 2) - returns to ghost house
state = 2;
// Mark Blinky as eaten so draw event skips normal rendering
chomped = 0;  // Note: This seems inconsistent - may be a bug (should be 1?)

/// ===== PAC MOVEMENT DURING CONSUMPTION =====
/// When Pac eats a ghost, he continues moving in a specific direction
/// to avoid collision. The "eatdir" value determines which of 8 directions he moves.

with (Pac) {
    if (fright == true) {
        // Power pellet (frightened mode) was active when ghost was eaten
        // Pac continues at frightened speed

        if (pause == 0) {
            // Handle 8-direction movement (eatdir: 0-7 = cardinal + diagonal)
            if (eatdir == 0) { hspeed = spfright; vspeed = 0; eatdir = -1; }
            if (eatdir == 1) { hspeed = spfright; vspeed = -spfright; eatdir = -1; }
            if (eatdir == 2) { hspeed = 0; vspeed = -spfright; eatdir = -1; }
            if (eatdir == 3) { hspeed = -spfright; vspeed = -spfright; eatdir = -1; }
            if (eatdir == 4) { hspeed = -spfright; vspeed = 0; eatdir = -1; }
            if (eatdir == 5) { hspeed = -spfright; vspeed = spfright; eatdir = -1; }
            if (eatdir == 6) { hspeed = 0; vspeed = spfright; eatdir = -1; }
            if (eatdir == 7) { hspeed = spfright; vspeed = spfright; eatdir = -1; }

            // If Pac hit something while moving, speed up (bonk boost)
            if (bonked == 1) {
                speed = speed * 4;
            }
        } else {
            // Currently paused - decrement pause counter
            pause = pause - 1;
        }

        // Handle second position tracking (for dual Pac support)
        if (pause2 == 0) {
            if (eatdir2 == 0) { hspeed2 = spfright; vspeed2 = 0; eatdir2 = -1; }
            if (eatdir2 == 1) { hspeed2 = spfright; vspeed2 = -spfright; eatdir2 = -1; }
            if (eatdir2 == 2) { hspeed2 = 0; vspeed2 = -spfright; eatdir2 = -1; }
            if (eatdir2 == 3) { hspeed2 = -spfright; vspeed2 = -spfright; eatdir2 = -1; }
            if (eatdir2 == 4) { hspeed2 = -spfright; vspeed2 = 0; eatdir2 = -1; }
            if (eatdir2 == 5) { hspeed2 = -spfright; vspeed2 = spfright; eatdir2 = -1; }
            if (eatdir2 == 6) { hspeed2 = 0; vspeed2 = spfright; eatdir2 = -1; }
            if (eatdir2 == 7) { hspeed2 = spfright; vspeed2 = spfright; eatdir2 = -1; }

            if (bonked2 == 1) {
                // Scale bonk boost to match direction
                if (abs(hspeed2) > 0) {
                    hspeed2 = 4 * (abs(hspeed2) / hspeed2);
                }
                if (abs(vspeed2) > 0) {
                    vspeed2 = 4 * (abs(vspeed2) / vspeed2);
                }
            }
        } else {
            pause2 = pause2 - 1;
        }
    } else {
        // No power pellet active - shouldn't normally happen, but handle it
        // Pac continues at normal speed

        if (pause == 0) {
            if (eatdir == 0) { hspeed = sp; vspeed = 0; eatdir = -1; }
            if (eatdir == 1) { hspeed = sp; vspeed = -sp; eatdir = -1; }
            if (eatdir == 2) { hspeed = 0; vspeed = -sp; eatdir = -1; }
            if (eatdir == 3) { hspeed = -sp; vspeed = -sp; eatdir = -1; }
            if (eatdir == 4) { hspeed = -sp; vspeed = 0; eatdir = -1; }
            if (eatdir == 5) { hspeed = -sp; vspeed = sp; eatdir = -1; }
            if (eatdir == 6) { hspeed = 0; vspeed = sp; eatdir = -1; }
            if (eatdir == 7) { hspeed = sp; vspeed = sp; eatdir = -1; }

            if (bonked == 1) {
                speed = speed * 4;
            }
        } else {
            pause = pause - 1;
        }

        if (pause2 == 0) {
            if (eatdir2 == 0) { hspeed2 = sp; vspeed2 = 0; eatdir2 = -1; }
            if (eatdir2 == 1) { hspeed2 = sp; vspeed2 = -sp; eatdir2 = -1; }
            if (eatdir2 == 2) { hspeed2 = 0; vspeed2 = -sp; eatdir2 = -1; }
            if (eatdir2 == 3) { hspeed2 = -sp; vspeed2 = -sp; eatdir2 = -1; }
            if (eatdir2 == 4) { hspeed2 = -sp; vspeed2 = 0; eatdir2 = -1; }
            if (eatdir2 == 5) { hspeed2 = -sp; vspeed2 = sp; eatdir2 = -1; }
            if (eatdir2 == 6) { hspeed2 = 0; vspeed2 = sp; eatdir2 = -1; }
            if (eatdir2 == 7) { hspeed2 = sp; vspeed2 = sp; eatdir2 = -1; }

            if (bonked2 == 1) {
                if (abs(hspeed2) > 0) {
                    hspeed2 = 4 * (abs(hspeed2) / hspeed2);
                }
                if (abs(vspeed2) > 0) {
                    vspeed2 = 4 * (abs(vspeed2) / vspeed2);
                }
            }
        } else {
            pause = pause - 1;
            pause2 = pause2 - 1;
        }
    }
}

