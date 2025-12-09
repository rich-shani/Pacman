/// ===============================================================================
/// beginstep2() - PLAYER 2 DIRECTION, COLLECTION, & COLLISION HANDLING
/// ===============================================================================
/// Purpose: Handle Player 2 direction updates, dot/power pellet/fruit collection,
///          level completion, and ghost interactions
/// Called: Every frame from Pac Step_1 event (second step script)
///
/// Responsibilities:
/// 1. Update Player 2 facing direction based on movement
/// 2. Handle dot collection and scoring
/// 3. Handle power pellet collection and fright mode activation
/// 4. Handle fruit collection and scoring
/// 5. Detect level completion
/// 6. Handle ghost collisions (eating or being eaten)
/// 7. Freeze movement during special states
/// ===============================================================================

/// @description Player 2's direction
function beginstep2() {
    // ===== DIRECTION UPDATE =====
    /// Update Player 2 facing direction based on current movement speed
    /// Only update when Player 2 is active and game is running
    if (dead == 0 && global.start == 0 && chomp == 0) {
        /// Cardinal directions (4-way)
        if (hspeed2 > 0 && vspeed2 == 0) { direction2 = 0; }      // Right
        if (hspeed2 < 0 && vspeed2 == 0) { direction2 = 180; }    // Left
        if (vspeed2 < 0 && hspeed2 == 0) { direction2 = 90; }     // Up
        if (vspeed2 > 0 && hspeed2 == 0) { direction2 = 270; }    // Down
        
        /// Diagonal directions (8-way)
        if (hspeed2 > 0 && vspeed2 < 0) { direction2 = 45; }      // Up-Right
        if (hspeed2 < 0 && vspeed2 < 0) { direction2 = 135; }     // Up-Left
        if (hspeed2 < 0 && vspeed2 > 0) { direction2 = 225; }     // Down-Left
        if (hspeed2 > 0 && vspeed2 > 0) { direction2 = 315; }    // Down-Right
    } else {
        /// Freeze direction and movement when inactive
        direction2 = direction2;  // Maintain current direction
        hspeed2 = 0;
        vspeed2 = 0;
    }
    
    // ===== DOT COLLECTION =====
    /// Handle dot collection when Player 2 collides with dot
    /// Only process when Player 2 is active and not prohibited
    if (dead == 0 && global.start == 0 && Pac.prohibit < 2) {
        /// Check if Player 2 is at dot position (grid-aligned)
        if (place_meeting((16 * (round(x2 / 16))), (16 * (round(y2 / 16))), Dot)) {
            /// Process dot collection
            with (Dot) {
                /// Check if dot is colliding with Mac (Player 2 sprite)
                if (place_meeting(x, y, Mac)) {
                    /// Handle smashed dot (Jr. Pacman mode)
                    if (smashed == true) {
                        global.smashno = global.smashno - 1;  // Decrement smash counter
                        
                        /// Pause movement if boost mode is disabled
                        if (global.boost == 0) {
                            Pac.pause2 = 1;
                            Pac.stoppy2 = 1;
                        }
                        
                        /// Award points and play sound
                        if (global.lvl > 0) {
                            global.p2score = global.p2score + 40;  // Smashed dot worth 40 points
                            sound_play(JrDot2);
                        }
                    } else {
                        /// Normal dot - play sound for Jr. Pacman
                        if (global.game == 2 && global.lvl > 0) {
                            sound_play(JrDot);
                        }
                    }
                    
                    /// Destroy dot instance
                    instance_destroy();
                }
            }
            
            /// Pause movement during collection (if boost mode disabled)
            if (global.boost == 0) {
                Pac.eatdir2 = Pac.direction2 / 45;  // Store eating direction
                direction2 = direction2;  // Maintain direction
                hspeed2 = 0;  // Stop movement
                vspeed2 = 0;
            }
            
            /// Award points
            if (global.lvl > 0) {
                global.p2score = global.p2score + 10;  // Standard dot worth 10 points
            }
            
            /// Reset ghost release timer
            if (global.boost == 0) {
                Pac.timer = Pac.timerstart + 1;
            }
            
            /// Clear collision flag
            bonked2 = 0;
            
            /// Play collection sound based on game variant
            if (global.lvl > 0) {
                if (global.game == 1) {
                    /// Ms. Pacman sound
                    sound_play(MsDot);
                    exit;
                }
                if (global.game == 0) {
                    /// Standard Pacman alternating sounds
                    if (dot == 0) {
                        sound_play(Dot0);
                        dot = 1;
                        exit;
                    }
                    if (dot == 1) {
                        sound_play(Dot1);
                        dot = 0;
                        exit;
                    }
                }
            }
        }
    }
    
    // ===== POWER PELLET COLLECTION =====
    /// Handle power pellet collection when Player 2 collides with power pellet
    /// Only process when Player 2 is alive
    if (dead == 0) {
        /// Check if Player 2 is at power pellet position (grid-aligned)
        if (place_meeting((16 * (round(x2 / 16))), (16 * (round(y2 / 16))), Power)) {
            /// Destroy power pellet instance
            with (Power) {
                if (place_meeting(x, y, Mac)) {
                    instance_destroy();
                }
            }
            
            /// Pause movement during collection (if boost mode disabled)
            if (global.boost == 0) {
                Pac.eatdir2 = Pac.direction2 / 45;  // Store eating direction
                direction2 = direction2;  // Maintain direction
                hspeed2 = 0;  // Stop movement
                vspeed2 = 0;
            }
            
            /// Pause movement briefly (if boost mode disabled)
            if (global.boost == 0) {
                Pac.pause2 = 1;
                Pac.stoppy2 = 1;
            }
            
            /// Activate fright mode if power pellet has effect
            if (Pac.frighttime > 0) {
                /// Handle two-player mode prohibition switching
                if (global.players == 2) {
                    if (Pac.prohibit == 2) {
                        Pac.prohibit = 0;  // Allow Player 1 to interact
                    } else {
                        Pac.prohibit = 1;  // Block Player 1 interaction
                    }
                }
                
                /// Activate fright mode
                fright = 1;
                Pac.alarm[0] = Pac.frighttime;  // Set fright timer
                Pac.chompcount = 0;  // Reset ghost eating counter
            }
            
            /// Make all ghosts visible
            Blinky.visible = true;
            Pinky.visible = true;
            Inky.visible = true;
            Clyde.visible = true;
            
            /// Reset plus mode variables
            Pac.pluseat = 0;
            Pac.Pac.plus = -1;
            Pac.plus2 = 0;
            
            /// Reset ghost release timer
            Pac.timer = Pac.timerstart + 1;
            
            /// Random plus mode activation (if plus mode enabled)
            if (global.plus == 1) {
                Pac.Pac.plus = irandom(7);  // Random plus value (0-7)
                
                /// Random plus2 activation (if conditions met)
                if (Pac.frighttime > 0 && 
                    ((global.game < 2 && global.lvl > 2) || 
                     (global.game == 2 && global.lvl > 1))) {
                    Pac.plus2 = irandom(1);  // Random plus2 value (0-1)
                }
            }
            
            /// Make ghosts turn around (about-face)
            with (Blinky) {
                aboutface = 1;
                if (state < 2 && Pac.frighttime > 0) {
                    if (Pac.Pac.plus == 0) {
                        if (state == 1) { state = 0; }  // Exit frightened if in it
                    } else {
                        state = 1;  // Enter frightened
                    }
                }
            }
            with (Pinky) {
                aboutface = 1;
                if (state < 2 && Pac.frighttime > 0) {
                    if (Pac.Pac.plus == 1) {
                        if (state == 1) { state = 0; }
                    } else {
                        state = 1;
                    }
                }
            }
            with (Inky) {
                aboutface = 1;
                if (state < 2 && Pac.frighttime > 0) {
                    if (Pac.Pac.plus == 2) {
                        if (state == 1) { state = 0; }
                    } else {
                        state = 1;
                    }
                }
            }
            with (Clyde) {
                aboutface = 1;
                if (state < 2 && Pac.frighttime > 0) {
                    if (Pac.Pac.plus == 3) {
                        if (state == 1) { state = 0; }
                    } else {
                        state = 1;
                    }
                }
            }
            
            /// Reset plus variable
            Pac.Pac.plus = -1;
            
            /// Clear collision flag
            bonked2 = 0;
            
            /// Award points and play sound
            if (global.lvl > 0) {
                global.p2score = global.p2score + 50;  // Power pellet worth 50 points
                
                /// Play sound based on game variant
                if (global.game == 2) {
                    sound_play(JrDot2);
                }
                if (global.game == 1) {
                    sound_play(MsDot);
                }
                if (global.game == 0) {
                    /// Standard Pacman alternating sounds
                    if (dot == 0) {
                        sound_play(Dot0);
                        dot = 1;
                        exit;
                    }
                    if (dot == 1) {
                        sound_play(Dot1);
                        dot = 0;
                        exit;
                    }
                }
            }
        }
    }
    
    // ===== LEVEL COMPLETION CHECK =====
    /// Check if all dots have been collected
    /// Only check when level is active and game has started
    if (global.lvl > 0) {
        if (global.start == 0) {
            if (dead == 0) {
                /// Check if dot count equals or exceeds total dots
                if ((Pac.dotcount == global.dottotal || Pac.dotcount > global.dottotal) && 
                    Pac.finish == 0) {
                    /// Level complete!
                    Pac.finish = 1;  // Set finish flag
                    alarm[11] = 60;  // Set completion timer
                    alarm[1] = -1;   // Stop scatter/chase timer
                    
                    /// Stop all ghost about-face behavior
                    Blinky.aboutface = 0;
                    Pinky.aboutface = 0;
                    Inky.aboutface = 0;
                    Clyde.aboutface = 0;
                    
                    /// Stop all movement
                    Blinky.speed = 0;
                    Pinky.speed = 0;
                    Inky.speed = 0;
                    Clyde.speed = 0;
                    Pac.speed = 0;
                }
            }
        }
    }
    
    // ===== FRUIT COLLECTION =====
    /// Handle fruit collection when Player 2 collides with fruit
    /// Only process when Player 2 is active and not prohibited
    if (dead == 0 && Pac.prohibit < 2) {
        /// Check if Player 2 is at fruit position (grid-aligned)
        if (place_meeting((16 * (round(x2 / 16))), (16 * (round(y2 / 16))), Fruit)) {
            /// Only collect if Player 2 is moving
            if (hspeed2 == 0 && vspeed2 == 0) {
                // Not moving - don't collect
            } else {
                /// Process fruit collection
                with (Fruit) {
                    if (place_meeting(x, y, Mac)) {
                        /// Show points display
                        points = true;
                        alarm[1] = 60;  // Points display timer
                        
                        /// Play fruit collection sound
                        if (global.lvl > 0) {
                            sound_play(snd_Fruit);
                        }
                        
                        /// Store spawn position if fruit was moving
                        if (state > -1) {
                            xstart = x;
                            ystart = y;
                        }
                        
                        /// Reset fruit position and state
                        x = -32;
                        y = -32;
                        tilex = 16 * (round(x / 16));
                        tiley = 16 * (round(y / 16));
                        newtile = 0;
                        alarm[0] = -1;  // Stop despawn timer
                        state = -1;     // Set inactive
                        direction = 0;
                        speed = 0;
                        dir = -1;
                        
                        /// Award points based on fruit value and game variant
                        if (global.lvl > 0) {
                            // ===== STANDARD PACMAN SCORING =====
                            if (global.game == 0) {
                                if (value == 0) { global.p2score = global.p2score + 100; }
                                if (value == 1) { global.p2score = global.p2score + 300; }
                                if (value == 2) { global.p2score = global.p2score + 500; }
                                if (value == 3) { global.p2score = global.p2score + 700; }
                                if (value == 4) { global.p2score = global.p2score + 1000; }
                                if (value == 5) { global.p2score = global.p2score + 2000; }
                                if (value == 6) { global.p2score = global.p2score + 3000; }
                                if (value == 7) { global.p2score = global.p2score + 5000; }
                            }
                            // ===== MS. PACMAN / JR. PACMAN SCORING =====
                            else {
                                if (value == 0) { global.p2score = global.p2score + 100; }
                                if (value == 1) { global.p2score = global.p2score + 200; }
                                if (value == 2) { global.p2score = global.p2score + 500; }
                                if (value == 3) { global.p2score = global.p2score + 700; }
                                if (value == 4) { global.p2score = global.p2score + 1000; }
                                if (value == 5) { global.p2score = global.p2score + 2000; }
                                if (value == 6) { global.p2score = global.p2score + 5000; }
                            }
                        }
                        
                        /// Handle plus mode bonus (if enabled)
                        if (global.plus == true) {
                            /// Check if bonus time is available
                            if (bonustime > 0) {
                                /// Handle two-player mode prohibition switching
                                if (global.players == 2) {
                                    if (Pac.prohibit == 2) {
                                        Pac.prohibit = 0;  // Allow Player 1
                                    } else {
                                        Pac.prohibit = 1;  // Block Player 1
                                    }
                                }
                                
                                /// Activate extended fright mode
                                fright = 1;
                                Pac.alarm[0] = bonustime;  // Set extended timer
                                Pac.chompcount = 0;        // Reset counter
                                Pac.plus2 = 0;            // Reset plus2
                                Pac.pluseat = 1;           // Enable plus eating bonus
                                
                                /// Hide ghosts during bonus fright
                                with (Blinky) { if (state < 2) { visible = false; } }
                                with (Pinky) { if (state < 2) { visible = false; } }
                                with (Inky) { if (state < 2) { visible = false; } }
                                with (Clyde) { if (state < 2) { visible = false; } }
                            }
                            
                            /// Reset ghost release timer
                            Pac.timer = Pac.timerstart + 1;
                            
                            /// Make ghosts turn around and enter frightened state
                            with (Blinky) {
                                aboutface = 1;
                                if (state < 2 && bonustime > 0) { state = 1; }
                            }
                            with (Pinky) {
                                aboutface = 1;
                                if (state < 2 && bonustime > 0) { state = 1; }
                            }
                            with (Inky) {
                                aboutface = 1;
                                if (state < 2 && bonustime > 0) { state = 1; }
                            }
                            with (Clyde) {
                                aboutface = 1;
                                if (state < 2 && bonustime > 0) { state = 1; }
                            }
                        }
                        
                        exit;  // Exit fruit collection
                    }
                }
            }
        }
    }
    
    // ===== GHOST COLLISION HANDLING =====
    /// Handle collisions between Player 2 and ghosts
    /// Only process when level is not finished
    if (Pac.finish == 0) {
        /// Only process when not eating ghost
        if (chomp == 0) {
            if (dead == 0) {
                // ===== BLINKY COLLISION =====
                /// Check collision with Blinky (red ghost)
                if (((16 * (round(x2 / 16)) == Blinky.tilex && 
                      16 * (round(y2 / 16)) == Blinky.tiley) || 
                     (abs(x2 - Blinky.x) < 5 && abs(y2 - Blinky.y) < 5)) && 
                    Blinky.house == 0) {
                    with (Blinky) {
                        /// Player 2 eats Blinky (frightened state)
                        if (state == 1 && Pac.chomp == 0 && Pac.prohibit < 2) {
                            Pac.bonked2 = 0;
                            Pac.chomper = 2;  // Set chomper to Player 2
                            
                            /// Play eating sound
                            if (global.lvl > 0) {
                                if (global.game == 0) { sound_play(Chomp); }
                                if (global.game == 1) { sound_play(MsChomp); }
                                if (global.game == 2) { sound_play(JrChomp); }
                            }
                            
                            /// Execute eating script
                            with (Pac) {
                                script_execute(sickofit);
                            }
                            
                            /// Update eating counter and state
                            Pac.chompcount = Pac.chompcount + 1;
                            Pac.chomp = 1;
                            alarm[0] = 60;  // Eating animation timer
                            chomped = 1;   // Mark as eaten
                            
                            /// Store eating direction
                            if (Pac.hspeed2 == 0 && Pac.vspeed2 == 0) {
                                // Not moving - no direction to store
                            } else {
                                if (Pac.eatdir2 == -1) {
                                    Pac.eatdir2 = Pac.direction2 / 45;
                                }
                            }
                            
                            /// Store Player 1 eating direction (if moving)
                            if (!Pac.speed == 0) {
                                if (Pac.eatdir == -1) {
                                    Pac.eatdir = Pac.direction / 45;
                                }
                            }
                            
                            /// Reset ghost directions
                            with (Blinky) { if (state < 2) { resdir = direction / 90; } }
                            with (Pinky) { if (state < 2) { resdir = direction / 90; } }
                            with (Inky) { if (state < 2) { resdir = direction / 90; } }
                            with (Clyde) { if (state < 2) { resdir = direction / 90; } }
                            with (Fruit) { if (state > -1) { resdir = direction / 90; } }
                            
                            /// Award points based on eating counter
                            if (global.lvl > 0) {
                                if (Pac.chompcount == 1) {
                                    global.p2score = global.p2score + (200 + (200 * Pac.pluseat));
                                }
                                if (Pac.chompcount == 2) {
                                    global.p2score = global.p2score + (400 + (400 * Pac.pluseat));
                                }
                                if (Pac.chompcount == 3) {
                                    global.p2score = global.p2score + (800 + (800 * Pac.pluseat));
                                }
                                if (Pac.chompcount == 4) {
                                    global.p2score = global.p2score + (1600 + (1600 * Pac.pluseat));
                                }
                            }
                        }
                        
                        /// Player 2 is eaten by Blinky (normal state)
                        if (state == 0 && Pac.dead == 0) {
                            Pac.deader = 2;      // Set deader to Player 2
                            Pac.dead = 1;        // Set death state
                            Pac.alarm[11] = 60;  // Death animation timer
                            
                            /// Set ghost bounce animation
                            bounce = -2;
                            uppity = 1;
                            okidoki = 1;
                            
                            /// Stop scatter/chase timer
                            Pac.alarm[1] = -1;
                            
                            /// Stop all ghost about-face behavior
                            Blinky.aboutface = 0;
                            Pinky.aboutface = 0;
                            Inky.aboutface = 0;
                            Clyde.aboutface = 0;
                            
                            /// Snap all ghosts to grid
                            Blinky.tilex = 16 * (round(Blinky.x / 16));
                            Blinky.tiley = 16 * (round(Blinky.y / 16));
                            Pinky.tilex = 16 * (round(Pinky.x / 16));
                            Pinky.tiley = 16 * (round(Pinky.y / 16));
                            Inky.tilex = 16 * (round(Inky.x / 16));
                            Inky.tiley = 16 * (round(Inky.y / 16));
                            Clyde.tilex = 16 * (round(Clyde.x / 16));
                            Clyde.tiley = 16 * (round(Clyde.y / 16));
                            
                            /// Reset ghost newtile flags
                            Blinky.newtile = 0;
                            Pinky.newtile = 0;
                            Inky.newtile = 0;
                            Clyde.newtile = 0;
                        }
                    }
                }
                
                // ===== PINKY COLLISION =====
                /// Check collision with Pinky (pink ghost)
                /// Same logic as Blinky collision
                if (((16 * (round(x2 / 16)) == Pinky.tilex && 
                      16 * (round(y2 / 16)) == Pinky.tiley) || 
                     (abs(x2 - Pinky.x) < 5 && abs(y2 - Pinky.y) < 5)) && 
                    Pinky.house == 0) {
                    with (Pinky) {
                        if (state == 1 && Pac.chomp == 0 && Pac.prohibit < 2) {
                            Pac.bonked2 = 0;
                            Pac.chomper = 2;
                            if (global.lvl > 0) {
                                if (global.game == 0) { sound_play(Chomp); }
                                if (global.game == 1) { sound_play(MsChomp); }
                                if (global.game == 2) { sound_play(JrChomp); }
                            }
                            with (Pac) { script_execute(sickofit); }
                            Pac.chompcount = Pac.chompcount + 1;
                            Pac.chomp = 1;
                            alarm[0] = 60;
                            chomped = 1;
                            if (Pac.hspeed2 == 0 && Pac.vspeed2 == 0) {
                                // Not moving
                            } else {
                                if (Pac.eatdir2 == -1) { Pac.eatdir2 = Pac.direction2 / 45; }
                            }
                            if (!Pac.speed == 0) {
                                if (Pac.eatdir == -1) { Pac.eatdir = Pac.direction / 45; }
                            }
                            with (Blinky) { if (state < 2) { resdir = direction / 90; } }
                            with (Pinky) { if (state < 2) { resdir = direction / 90; } }
                            with (Inky) { if (state < 2) { resdir = direction / 90; } }
                            with (Clyde) { if (state < 2) { resdir = direction / 90; } }
                            with (Fruit) { if (state > -1) { resdir = direction / 90; } }
                            if (global.lvl > 0) {
                                if (Pac.chompcount == 1) { global.p2score = global.p2score + (200 + (200 * Pac.pluseat)); }
                                if (Pac.chompcount == 2) { global.p2score = global.p2score + (400 + (400 * Pac.pluseat)); }
                                if (Pac.chompcount == 3) { global.p2score = global.p2score + (800 + (800 * Pac.pluseat)); }
                                if (Pac.chompcount == 4) { global.p2score = global.p2score + (1600 + (1600 * Pac.pluseat)); }
                            }
                        }
                        if (state == 0 && Pac.dead == 0) {
                            Pac.deader = 2;
                            Pac.dead = 1;
                            Pac.alarm[11] = 60;
                            bounce = -2;
                            uppity = 1;
                            okidoki = 1;
                            Pac.alarm[1] = -1;
                            Blinky.aboutface = 0;
                            Pinky.aboutface = 0;
                            Inky.aboutface = 0;
                            Clyde.aboutface = 0;
                            Blinky.tilex = 16 * (round(Blinky.x / 16));
                            Blinky.tiley = 16 * (round(Blinky.y / 16));
                            Pinky.tilex = 16 * (round(Pinky.x / 16));
                            Pinky.tiley = 16 * (round(Pinky.y / 16));
                            Inky.tilex = 16 * (round(Inky.x / 16));
                            Inky.tiley = 16 * (round(Inky.y / 16));
                            Clyde.tilex = 16 * (round(Clyde.x / 16));
                            Clyde.tiley = 16 * (round(Clyde.y / 16));
                            Blinky.newtile = 0;
                            Pinky.newtile = 0;
                            Inky.newtile = 0;
                            Clyde.newtile = 0;
                        }
                    }
                }
                
                // ===== INKY COLLISION =====
                /// Check collision with Inky (cyan ghost)
                /// Same logic as Blinky collision
                if (((16 * (round(x2 / 16)) == Inky.tilex && 
                      16 * (round(y2 / 16)) == Inky.tiley) || 
                     (abs(x2 - Inky.x) < 5 && abs(y2 - Inky.y) < 5)) && 
                    Inky.house == 0) {
                    with (Inky) {
                        if (state == 1 && Pac.chomp == 0 && Pac.prohibit < 2) {
                            Pac.bonked2 = 0;
                            Pac.chomper = 2;
                            if (global.lvl > 0) {
                                if (global.game == 0) { sound_play(Chomp); }
                                if (global.game == 1) { sound_play(MsChomp); }
                                if (global.game == 2) { sound_play(JrChomp); }
                            }
                            with (Pac) { script_execute(sickofit); }
                            Pac.chompcount = Pac.chompcount + 1;
                            Pac.chomp = 1;
                            alarm[0] = 60;
                            chomped = 1;
                            if (Pac.hspeed2 == 0 && Pac.vspeed2 == 0) {
                                // Not moving
                            } else {
                                if (Pac.eatdir2 == -1) { Pac.eatdir2 = Pac.direction2 / 45; }
                            }
                            if (!Pac.speed == 0) {
                                if (Pac.eatdir == -1) { Pac.eatdir = Pac.direction / 45; }
                            }
                            with (Blinky) { if (state < 2) { resdir = direction / 90; } }
                            with (Pinky) { if (state < 2) { resdir = direction / 90; } }
                            with (Inky) { if (state < 2) { resdir = direction / 90; } }
                            with (Clyde) { if (state < 2) { resdir = direction / 90; } }
                            with (Fruit) { if (state > -1) { resdir = direction / 90; } }
                            if (global.lvl > 0) {
                                if (Pac.chompcount == 1) { global.p2score = global.p2score + (200 + (200 * Pac.pluseat)); }
                                if (Pac.chompcount == 2) { global.p2score = global.p2score + (400 + (400 * Pac.pluseat)); }
                                if (Pac.chompcount == 3) { global.p2score = global.p2score + (800 + (800 * Pac.pluseat)); }
                                if (Pac.chompcount == 4) { global.p2score = global.p2score + (1600 + (1600 * Pac.pluseat)); }
                            }
                        }
                        if (state == 0 && Pac.dead == 0) {
                            Pac.deader = 2;
                            Pac.dead = 1;
                            Pac.alarm[11] = 60;
                            bounce = -2;
                            uppity = 1;
                            okidoki = 1;
                            Pac.alarm[1] = -1;
                            Blinky.aboutface = 0;
                            Pinky.aboutface = 0;
                            Inky.aboutface = 0;
                            Clyde.aboutface = 0;
                            Blinky.tilex = 16 * (round(Blinky.x / 16));
                            Blinky.tiley = 16 * (round(Blinky.y / 16));
                            Pinky.tilex = 16 * (round(Pinky.x / 16));
                            Pinky.tiley = 16 * (round(Pinky.y / 16));
                            Inky.tilex = 16 * (round(Inky.x / 16));
                            Inky.tiley = 16 * (round(Inky.y / 16));
                            Clyde.tilex = 16 * (round(Clyde.x / 16));
                            Clyde.tiley = 16 * (round(Clyde.y / 16));
                            Blinky.newtile = 0;
                            Pinky.newtile = 0;
                            Inky.newtile = 0;
                            Clyde.newtile = 0;
                        }
                    }
                }
                
                // ===== CLYDE COLLISION =====
                /// Check collision with Clyde (orange ghost)
                /// Same logic as Blinky collision
                if (((16 * (round(x2 / 16)) == Clyde.tilex && 
                      16 * (round(y2 / 16)) == Clyde.tiley) || 
                     (abs(x2 - Clyde.x) < 5 && abs(y2 - Clyde.y) < 5)) && 
                    Clyde.house == 0) {
                    with (Clyde) {
                        if (state == 1 && Pac.chomp == 0 && Pac.prohibit < 2) {
                            Pac.bonked2 = 0;
                            Pac.chomper = 2;
                            if (global.lvl > 0) {
                                if (global.game == 0) { sound_play(Chomp); }
                                if (global.game == 1) { sound_play(MsChomp); }
                                if (global.game == 2) { sound_play(JrChomp); }
                            }
                            with (Pac) { script_execute(sickofit); }
                            Pac.chompcount = Pac.chompcount + 1;
                            Pac.chomp = 1;
                            alarm[0] = 60;
                            chomped = 1;
                            if (Pac.hspeed2 == 0 && Pac.vspeed2 == 0) {
                                // Not moving
                            } else {
                                if (Pac.eatdir2 == -1) { Pac.eatdir2 = Pac.direction2 / 45; }
                            }
                            if (!Pac.speed == 0) {
                                if (Pac.eatdir == -1) { Pac.eatdir = Pac.direction / 45; }
                            }
                            with (Blinky) { if (state < 2) { resdir = direction / 90; } }
                            with (Pinky) { if (state < 2) { resdir = direction / 90; } }
                            with (Inky) { if (state < 2) { resdir = direction / 90; } }
                            with (Clyde) { if (state < 2) { resdir = direction / 90; } }
                            with (Fruit) { if (state > -1) { resdir = direction / 90; } }
                            if (global.lvl > 0) {
                                if (Pac.chompcount == 1) { global.p2score = global.p2score + (200 + (200 * Pac.pluseat)); }
                                if (Pac.chompcount == 2) { global.p2score = global.p2score + (400 + (400 * Pac.pluseat)); }
                                if (Pac.chompcount == 3) { global.p2score = global.p2score + (800 + (800 * Pac.pluseat)); }
                                if (Pac.chompcount == 4) { global.p2score = global.p2score + (1600 + (1600 * Pac.pluseat)); }
                            }
                        }
                        if (state == 0 && Pac.dead == 0) {
                            Pac.deader = 2;
                            Pac.dead = 1;
                            Pac.alarm[11] = 60;
                            bounce = -2;
                            uppity = 1;
                            okidoki = 1;
                            Pac.alarm[1] = -1;
                            Blinky.aboutface = 0;
                            Pinky.aboutface = 0;
                            Inky.aboutface = 0;
                            Clyde.aboutface = 0;
                            Blinky.tilex = 16 * (round(Blinky.x / 16));
                            Blinky.tiley = 16 * (round(Blinky.y / 16));
                            Pinky.tilex = 16 * (round(Pinky.x / 16));
                            Pinky.tiley = 16 * (round(Pinky.y / 16));
                            Inky.tilex = 16 * (round(Inky.x / 16));
                            Inky.tiley = 16 * (round(Inky.y / 16));
                            Clyde.tilex = 16 * (round(Clyde.x / 16));
                            Clyde.tiley = 16 * (round(Clyde.y / 16));
                            Blinky.newtile = 0;
                            Pinky.newtile = 0;
                            Inky.newtile = 0;
                            Clyde.newtile = 0;
                        }
                    }
                }
            }
        }
    }
    
    // ===== MOVEMENT FREEZE =====
    /// Freeze Player 2 movement during special states
    
    // ===== FREEZE DURING GHOST EATING =====
    /// Stop movement when eating ghost
    if (chomp == true) {
        if (hspeed2 == 0 && vspeed2 == 0) {
            // Already stopped
        } else {
            direction2 = direction2;  // Maintain direction
            hspeed2 = 0;               // Stop movement
            vspeed2 = 0;
        }
    }
    
    // ===== FREEZE DURING LEVEL START/FINISH =====
    /// Stop movement during level start or finish
    if (global.start == true || Pac.finish > 0) {
        hspeed2 = 0;
        vspeed2 = 0;
    }
    
    // ===== FREEZE DURING DEATH =====
    /// Stop movement when dead
    if (dead > 0) {
        hspeed2 = 0;
        vspeed2 = 0;
    }
}
