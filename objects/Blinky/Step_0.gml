event_inherited();

if state == GHOST_STATE.CHASE {
    /// DEFAULT BEHAVIOR: Direct chase (Blinky's strategy)
    /// Child ghosts override this event with their own calculation
    /// - Blinky: Current position
    /// - Pinky: 4 tiles ahead
    /// - Inky: Double vector from Blinky
    /// - Clyde: Distance-dependent

    pursuex = 16 * round(Pac.x / 16);
    pursuey = 16 * round(Pac.y / 16);

    /// In scatter mode (when Pac is in specific areas), chase scatter corner instead
    /// This behavior is GLOBAL but can be overridden by child ghosts
    /// Some rooms trigger "scatter mode" where ghosts ignore Pac
    /// This is handled by scripts that modify pursuex/pursuey
}

