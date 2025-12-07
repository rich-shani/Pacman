/// ===== BLINKY OTHER[0] EVENT - COLLISION DETECTION / TUNNEL WRAPPING =====
/// Handles horizontal tunnel wrapping (left/right edges of the maze)
/// When Blinky exits the left or right side of the playfield, wrap to opposite side

// WRAP AT LEFT EDGE: Moving left (direction 180°) past x = -24
if (direction == 180 && x < -24) {
    // Bounce to right side with wraparound calculation
    x = (room_width + 24) - (x + 24);
    // Update tile position to match new x coordinate
    tilex = 16 * round(x / 16);
}

// WRAP AT RIGHT EDGE: Moving right (direction 0°) past x = room_width + 24
if (direction == 0 && x > (room_width + 24)) {
    // Bounce to left side with wraparound calculation
    x = -24 + (x - (room_width + 24));
    // Update tile position to match new x coordinate
    tilex = 16 * round(x / 16);
}


