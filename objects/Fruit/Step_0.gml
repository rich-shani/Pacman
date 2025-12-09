/// ===============================================================================
/// FRUIT OBJECT - STEP_0 EVENT (SPAWN LOGIC)
/// ===============================================================================
/// Purpose: Handle fruit spawning based on dot collection milestones
/// Called: Every frame (first step event)
///
/// Responsibilities:
/// 1. Check dot collection thresholds for fruit spawn timing
/// 2. Spawn fruit at appropriate positions based on game variant
/// 3. Handle multiple fruit spawns (first and second fruit)
/// 4. Configure fruit movement for Ms. Pacman and Jr. Pacman variants
/// 5. Handle dot destruction when fruit spawns (Jr. Pacman)
/// ===============================================================================

// ===== DOT DESTRUCTION (JR. PACMAN MODE) =====
/// In Jr. Pacman mode, fruit destroys dots when spawning
/// Only applies to non-448 width rooms (extended mazes)
if (room_width == 448) {
    // Standard Pacman - no dot destruction
} else {
    /// Check if fruit is spawning on a dot
    if (place_meeting(x, y, Dot)) {
        /// Destroy the dot and create visual effect
        with (Dot) {
            if (place_meeting(x, y, Fruit) && smashed == 0) {
                smashed = 1;
                global.smashno = global.smashno + 1;
                
                /// Remove original dot tile
                tile_layer_delete_at(depth, x, y);
                
                /// Add replacement tiles with color blending
                tile_add(tile1, 41 * 16, 0, 16, 16, x, y, depth - 1);
                tile_add(tile2, 41 * 16, 0, 16, 16, x, y, depth + 1);
                
                /// Apply color blending to replacement tiles
                tile_set_blend(tile_layer_find(depth - 1, x, y), 
                              make_color_hsv(Drawless.mh, Drawless.ms, Drawless.mv));
                tile_set_blend(tile_layer_find(depth + 1, x, y), 
                              make_color_hsv(Drawless.mh2, Drawless.ms2, Drawless.mv2));
                
                /// Hide tiles if player 2 plus mode is active
                if (Pac.plus2 == 1) {
                    tile_layer_hide(depth - 1);
                    tile_layer_hide(depth + 1);
                }
                
                /// Hide the dot instance
                visible = false;
            }
        }
    }
}

// ===== FIRST FRUIT SPAWN =====
/// Spawn first fruit when dot count reaches threshold
/// Different thresholds for different game variants
if ((Pac.dotcount > -1 + 70 && global.game == 0) || 
    (Pac.dotcount > -1 + 73 && global.game == 1) || 
    (global.game == 2 && ((Drawless.c64 == 1 && Pac.dotcount > -1 + 246) || 
                          (Pac.dotcount > -1 + 96)))) {
    
    if (global.ex1 == 0) {
        // ===== STANDARD PACMAN FRUIT (448 width) =====
        if (room_width == 448) {
            /// Spawn fruit at fixed position with timer
            if (spawn == 0) {
                spawn = 1;
                x = xstart;
                y = ystart;
                alarm[0] = 540 + irandom(60);  // Random despawn timer
            }
        }
        // ===== JR. PACMAN FRUIT (moving fruit) =====
        else {
            /// Spawn fruit with movement state
            if (spawn == 0) {
                spawn = 1;
                alarm[0] = irandom(1080) + 120;  // Random spawn delay
                state = 0;  // Set to spawning state
                
                /// Random starting position (left or right side)
                if (irandom(1) == 0) {
                    direction = 0;   // Facing right
                    dir = 0;
                    x = Blinky.xstart;
                    y = Blinky.ystart;
                } else {
                    direction = 180;  // Facing left
                    dir = 2;
                    x = Blinky.xstart - 1;
                    y = Blinky.ystart;
                }
                
                /// Initialize tile coordinates
                tilex = 16 * (round(x / 16));
                tiley = 16 * (round(y / 16));
                newtile = 0;
            }
        }
    }
    // ===== MS. PACMAN FRUIT (bouncing fruit) =====
    else {
        /// Spawn fruit with bouncing movement
        if (spawn == 0) {
            tilex = 16 * (round(x / 16));
            tiley = 16 * (round(y / 16));
            spawn = 1;
            alarm[0] = 1080;  // Despawn timer
            state = 0;  // Set to spawning state
            
            /// Random vertical position (top or bottom exit)
            if (irandom(1) == 0) {
                y = global.ex1;
            } else {
                y = global.ex2;
            }
            
            /// Random horizontal position and direction
            if (irandom(1) == 0) {
                x = -24;        // Spawn from left
                direction = 0;  // Facing right
                dir = 0;
            } else {
                x = 456;        // Spawn from right
                direction = 180;  // Facing left
                dir = 2;
            }
            
            /// Random fruit type selection (level 8+)
            if (global.plus == 0) {
                if (global.lvl > 7) {
                    /// Weighted random selection for fruit type
                    if (random(7) < 1) {
                        image_index = 0;
                        value = 0;
                    } else {
                        if (random(6) < 1) {
                            image_index = 1;
                            value = 1;
                        } else {
                            if (random(5) < 1) {
                                image_index = 2;
                                value = 2;
                            } else {
                                if (random(4) < 1) {
                                    image_index = 8;
                                    value = 3;
                                } else {
                                    if (random(3) < 1) {
                                        image_index = 3;
                                        value = 4;
                                    } else {
                                        if (random(2) < 1) {
                                            image_index = 9;
                                            value = 5;
                                        } else {
                                            image_index = 10;
                                            value = 6;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                /// Plus mode fruit selection
                if (global.lvl > 7) {
                    if (random(7) < 1) {
                        image_index = 24;
                        value = 0;
                    } else {
                        if (random(6) < 1) {
                            image_index = 25;
                            value = 1;
                        } else {
                            if (random(5) < 1) {
                                image_index = 26;
                                value = 2;
                            } else {
                                if (random(4) < 1) {
                                    image_index = 27;
                                    value = 3;
                                } else {
                                    if (random(3) < 1) {
                                        image_index = 28;
                                        value = 4;
                                    } else {
                                        if (random(2) < 1) {
                                            image_index = 29;
                                            value = 5;
                                        } else {
                                            image_index = 30;
                                            value = 6;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

// ===== SECOND FRUIT SPAWN =====
/// Spawn second fruit when dot count reaches higher threshold
if ((Pac.dotcount > -1 + 170 && global.game == 0) || 
    (Pac.dotcount > -1 + 176 && global.game == 1) || 
    (global.game == 2 && ((Drawless.c64 == 1 && Pac.dotcount > -1 + 323) || 
                          (Pac.dotcount > -1 + 207)))) {
    
    if (global.ex1 == 0) {
        // ===== STANDARD PACMAN FRUIT =====
        if (room_width == 448) {
            /// Spawn second fruit at same position
            if (spawn == 1) {
                spawn = 2;
                x = xstart;
                y = ystart;
                alarm[0] = 540 + irandom(60);
            }
        }
        // ===== JR. PACMAN FRUIT =====
        else {
            /// Spawn second fruit with movement
            if (spawn == 1) {
                spawn = 2;
                
                /// Only spawn if not already moving
                if (state == -1) {
                    alarm[0] = irandom(1080) + 120;
                    state = 0;
                    
                    /// Random starting position
                    if (irandom(1) == 0) {
                        direction = 0;
                        dir = 0;
                        x = Blinky.xstart;
                        y = Blinky.ystart;
                    } else {
                        direction = 180;
                        dir = 2;
                        x = Blinky.xstart - 1;
                        y = Blinky.ystart;
                    }
                    
                    tilex = 16 * (round(x / 16));
                    tiley = 16 * (round(y / 16));
                    newtile = 0;
                }
            }
        }
    }
    // ===== MS. PACMAN FRUIT =====
    else {
        /// Spawn second fruit with bouncing movement
        if (spawn == 1) {
            tilex = 16 * (round(x / 16));
            tiley = 16 * (round(y / 16));
            spawn = 2;
            
            /// Only spawn if not already moving
            if (state == -1) {
                state = 0;
                alarm[0] = 1080;
                
                /// Random vertical position
                if (irandom(1) == 0) {
                    y = global.ex1;
                } else {
                    y = global.ex2;
                }
                
                /// Random horizontal position and direction
                if (irandom(1) == 0) {
                    x = -24;
                    direction = 0;
                    dir = 0;
                } else {
                    x = 456;
                    direction = 180;
                    dir = 2;
                }
                
                /// Random fruit type selection (same logic as first fruit)
                if (global.plus == 0) {
                    if (global.lvl > 7) {
                        if (random(7) < 1) {
                            image_index = 0;
                            value = 0;
                        } else {
                            if (random(6) < 1) {
                                image_index = 1;
                                value = 1;
                            } else {
                                if (random(5) < 1) {
                                    image_index = 2;
                                    value = 2;
                                } else {
                                    if (random(4) < 1) {
                                        image_index = 8;
                                        value = 3;
                                    } else {
                                        if (random(3) < 1) {
                                            image_index = 3;
                                            value = 4;
                                        } else {
                                            if (random(2) < 1) {
                                                image_index = 9;
                                                value = 5;
                                            } else {
                                                image_index = 10;
                                                value = 6;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if (global.lvl > 7) {
                        if (random(7) < 1) {
                            image_index = 24;
                            value = 0;
                        } else {
                            if (random(6) < 1) {
                                image_index = 25;
                                value = 1;
                            } else {
                                if (random(5) < 1) {
                                    image_index = 26;
                                    value = 2;
                                } else {
                                    if (random(4) < 1) {
                                        image_index = 27;
                                        value = 3;
                                    } else {
                                        if (random(3) < 1) {
                                            image_index = 28;
                                            value = 4;
                                        } else {
                                            if (random(2) < 1) {
                                                image_index = 29;
                                                value = 5;
                                            } else {
                                                image_index = 30;
                                                value = 6;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

// ===== ADDITIONAL FRUIT SPAWNS (JR. PACMAN ONLY) =====
/// Jr. Pacman can have up to 4 fruits
if (global.game == 2) {
    /// Third fruit spawn
    if (global.game == 2 && 
        ((Drawless.c64 == 1 && Pac.dotcount > -1 + 400) || 
         (Pac.dotcount > -1 + 301))) {
        if (spawn == 2) {
            spawn = 3;
            if (state == -1) {
                alarm[0] = irandom(1080) + 120;
                state = 0;
                
                /// Random starting position
                if (irandom(1) == 0) {
                    direction = 0;
                    dir = 0;
                    x = Blinky.xstart;
                    y = Blinky.ystart;
                } else {
                    direction = 180;
                    dir = 2;
                    x = Blinky.xstart - 1;
                    y = Blinky.ystart;
                }
                
                tilex = 16 * (round(x / 16));
                tiley = 16 * (round(y / 16));
                newtile = 0;
            }
        }
    }
    
    /// Fourth fruit spawn
    if (global.game == 2 && 
        ((Drawless.c64 == 1 && Pac.dotcount > -1 + 477) || 
         (Pac.dotcount > -1 + 413))) {
        if (spawn == 3) {
            spawn = 4;
            if (state == -1) {
                alarm[0] = irandom(1080) + 120;
                state = 0;
                
                /// Random starting position
                if (irandom(1) == 0) {
                    direction = 0;
                    dir = 0;
                    x = Blinky.xstart;
                    y = Blinky.ystart;
                } else {
                    direction = 180;
                    dir = 2;
                    x = Blinky.xstart - 1;
                    y = Blinky.ystart;
                }
                
                tilex = 16 * (round(x / 16));
                tiley = 16 * (round(y / 16));
                newtile = 0;
            }
        }
    }
}

// ===== FRUIT DESPAWN (MS. PACMAN & JR. PACMAN) =====
/// Remove fruit when it moves off-screen (Ms. Pacman bouncing fruit)
if ((global.game == 1 && state == 1) || (global.game == 2 && state > -1)) {
    if (x < -24 || x > room_width + 8) {
        state = -1;
        speed = 0;
        x = -32;
        y = -32;
        speed = 0;
        dir = -1;
        newtile = 0;
        tilex = 16 * (round(x / 16));
        tiley = 16 * (round(y / 16));
    }
}

// ===== RESET INACTIVE FRUIT =====
/// Reset fruit position when inactive (non-standard Pacman)
if (global.game > 0 && state == -1) {
    direction = 0;
    speed = 0;
    x = -32;
    y = -32;
    dir = -1;
}
